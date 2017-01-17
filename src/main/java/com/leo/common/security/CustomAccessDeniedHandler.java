package com.leo.common.security;

import com.alibaba.fastjson.JSON;
import com.leo.bean.AjaxResult;
import com.leo.enums.AjaxState;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LT on 2017/01/17 23:46
 */
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
    private String errorPage;

    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().println(JSON.toJSONString(new AjaxResult(AjaxState.FAILED, "没有权限")));
        /*String requestType = request.getHeader("X-Requested-With");
        if (!response.isCommitted()) {
            //如果是ajax请求，返回json
            if ("XMLHttpRequest".equals(requestType)) {
                response.setContentType("application/json;charset=utf-8");
                response.getWriter().println(JSON.toJSONString(new AjaxResult(AjaxState.FAILED, "没有权限")));
            } else {
                if (errorPage != null) {
                    // Put exception into request scope (perhaps of use to a view)
                    request.setAttribute(WebAttributes.ACCESS_DENIED_403,
                            accessDeniedException);

                    // Set the 403 status code.
                    response.setStatus(HttpServletResponse.SC_FORBIDDEN);

                    // forward to error page.
                    RequestDispatcher dispatcher = request.getRequestDispatcher(errorPage);
                    dispatcher.forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN,
                            accessDeniedException.getMessage());
                }
            }

        }*/
    }

    public void setErrorPage(String errorPage) {
        this.errorPage = errorPage;
    }
}
