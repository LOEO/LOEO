package com.loeo.interceptor.mybatis;

import com.loeo.bean.Page;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Properties;

/**
 * Created by LT on 2016/9/14 0014 23:20
 */
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class})})
public class PageInterceptor implements Interceptor {
    public Object intercept(Invocation invocation) throws Throwable {
        StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
        MetaObject metaObject = MetaObject.forObject(statementHandler, SystemMetaObject.DEFAULT_OBJECT_FACTORY,SystemMetaObject.DEFAULT_OBJECT_WRAPPER_FACTORY);
        //会拦截到RoutingStatementHandler，RoutingStatementHandler 中的 delegate 是BaseStatementHandler
        MappedStatement mappedStatement = (MappedStatement) metaObject.getValue("delegate.mappedStatement");
        String id = mappedStatement.getId();
        if (id.matches(".+ByPage$")) {
            BoundSql boundSql = statementHandler.getBoundSql();
            String sql = boundSql.getSql();
            String countSql = "select count(*) from (" + sql + ") a";

            Connection connection = (Connection) invocation.getArgs()[0];
            PreparedStatement ps = connection.prepareStatement(countSql);
            Map<?, ?> params = (Map<?, ?>) boundSql.getParameterObject();
            ParameterHandler parameterHandler = (ParameterHandler) metaObject.getValue("delegate.parameterHandler");
            parameterHandler.setParameters(ps);
            Page page = (Page) params.get("page");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                page.setTotal(rs.getInt(1));
            }

            sql = "select a.* from ("+sql+") a limit "+ page.getDbIndex()+","+page.getPageSize();
            metaObject.setValue("delegate.boundSql.sql",sql);
        }
        return invocation.proceed();
    }

    public Object plugin(Object o) {
        return Plugin.wrap(o,this);
    }

    public void setProperties(Properties properties) {
    }
}
