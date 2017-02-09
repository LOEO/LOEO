package com.loeo.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LT on 2016/7/2 0002 19:08
 */
public class FrameOptionFilter implements Filter {
    private String frameOption;

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
       /* DENY：浏览器拒绝当前页面加载任何Frame页面
        SAMEORIGIN：frame页面的地址只能为同源域名下的页面
        ALLOW-FROM：允许frame加载的页面地址*/
        if(this.frameOption!=null && !this.frameOption.equals(""))
            ((HttpServletResponse)servletResponse).setHeader("x-frame-options",this.frameOption);
        filterChain.doFilter(servletRequest,servletResponse);
    }

    public void destroy() {

    }

    public String getFrameOption() {
        return frameOption;
    }

    public void setFrameOption(String frameOption) {
        this.frameOption = frameOption;
    }
}
