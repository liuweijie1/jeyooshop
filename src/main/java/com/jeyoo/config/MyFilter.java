package com.jeyoo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 拦截器
 *
 * @author chenye
 */
@Configuration
public class MyFilter implements WebMvcConfigurer {

    /**
     * 注册拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //addPathPattern后跟拦截地址，excludePathPatterns后跟排除拦截地址
        registry.addInterceptor(new MyInterceptor()).addPathPatterns("/user/**").addPathPatterns("/trade/**").addPathPatterns("/usercontactmanage/**").addPathPatterns("/infomationmanage/**").addPathPatterns("/propertyreportmanage/**").addPathPatterns("/admin/**")
                //登录页面
                .excludePathPatterns("/login")
                //注册页面
                .excludePathPatterns("/redirect").excludePathPatterns("/codeServlet")
                //注册方法
                ;
    }

    class MyInterceptor implements HandlerInterceptor {
        /**
         * 在请求处理之前进行调用（Controller方法调用之前
         */
        @Override
        public boolean preHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o) throws Exception {
            HttpSession session = request.getSession();
            //获取登录的session信息
            Object user = session.getAttribute("admin");
            if (user != null) {
                return true;
            } else {
                //未登录自动跳转界面
                httpServletResponse.sendRedirect("/redirect");
                return false;
            }

        }

        /**
         * 请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）
         */
        @Override
        public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) {

        }

        /**
         * 在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行（主要是用于进行资源清理工作）
         */
        @Override
        public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        }
    }

}