package com.jeyoo.config;



import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.mapper.ShopConfigMapper;
import com.jeyoo.pojo.ShopConfig;
import com.jeyoo.utils.LoginAuthUtil;

import lombok.extern.slf4j.Slf4j;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 拦截器
 *
 * @author chenye
 */
@Configuration
@Slf4j
public class MyFilter implements WebMvcConfigurer {
	@Autowired
	private ShopConfigMapper shopConfigmapper;
//http://1867200p2d.iok.la/page/index/process

	
	/**
     * 注册拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //addPathPattern后跟拦截地址，excludePathPatterns后跟排除拦截地址
        registry.addInterceptor(new MyInterceptor()).addPathPatterns("/user/**").addPathPatterns("/page/**").addPathPatterns("/usercontactmanage/**").addPathPatterns("/infomationmanage/**").addPathPatterns("/propertyreportmanage/**").addPathPatterns("/admin/**")
                //登录页面
                .excludePathPatterns("/login")
                //排除拦截静态资源
                .excludePathPatterns("/**/*.css", "/**/*.js", "/**/*.png", "/**/*.jpg", "/**/*.jpeg", "/**/*.gif", "/**/fonts/*")
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
        	
        	String openid = request.getParameter("openid") == null ? "": request.getParameter("openid").toString().trim();
    		if (StringUtils.isBlank(openid)) {
    			openid = request.getSession().getAttribute("WX_OPEN_ID")==null ? "": request.getSession().getAttribute("WX_OPEN_ID").toString();
    			
    			
    		}
        	
    		request.getSession().setAttribute("WX_OPEN_ID", openid);
        	
        	String nickname = request.getSession().getAttribute("nickname")==null ? "": request.getSession().getAttribute("nickname").toString();
        	//判断店铺参数是否存在
    		String shopid = request.getParameter("shopid") == null ? "": request.getParameter("shopid").toString().trim();
    		if (StringUtils.isBlank(shopid)) {
    			shopid = request.getSession().getAttribute("shopid")==null ? "": request.getSession().getAttribute("shopid").toString();
    			
    		}
    		
    		if (StringUtils.isBlank(shopid)) {
    			request.getSession().setAttribute("shopid", "");
    			log.info("无店铺参数");
    		
    			httpServletResponse.sendRedirect("/error/notshop.html");
    			return false;
    		}
    		
    		request.getSession().setAttribute("shopid", shopid);
    		
    		
    		//判断店铺是否在时效范围内
    		ShopConfig shopConfig=shopConfigmapper.getShopConfig(Long.valueOf(shopid));
    		
    		if(shopConfig==null) {
    			
    			//查询不到店铺信息（shopid不正确、店铺服务时间不正确）
    			httpServletResponse.sendRedirect("/error/timeout.html");
    			return false;
    		}
    		request.getSession().setAttribute("shopconfig", shopConfig);
    		//请求的路径
    		log.info("本次跳转路径：" + request.getRequestURI() + "?" + request.getQueryString());
    		
    		//UserInfoBean user = businessCommonService.getUserInfo(request);//session中获取用户信息
    		HttpSession session = request.getSession();
            //获取登录的session信息
            Object user = session.getAttribute("USER_TOKEN");
            //获取登录的session信息
          
    		/*if(null == user ){
    			
    			//判断是否为微信环境，微信环境未登陆，进行AUTH登陆
    			String userAgent = request.getHeader("user-agent").toLowerCase();
    			log.info("--micromessenger--" + userAgent);
    			//if(userAgent.indexOf("micromessenger") > -1){//微信环境
    				if(true){//微信环境
    				Map<String, Object> authLogin = LoginAuthUtil.authLogin(request, httpServletResponse);//进行auto登录
    				boolean status = (Boolean)authLogin.get("status");//auth登录是否成功
    				boolean isAuthIfNesscary = (Boolean)authLogin.get("isAuthIfNesscary");//auth登录操作是否有重定向(1授权2绑定手机号)
    				
    				if(status){//auth登录成功
    					return true;
    				} else if(!status && isAuthIfNesscary){//auth登录失败，但是存在重定向
    					return false;
    				} else {//auth登录失败，没有重定向，进行免密登录
    					//LoginFreeUtil.freeLogin(request, response);
    				}
    			} else {//非微信环境,进行免密登录
    				httpServletResponse.sendRedirect("/error/notwe.html");
        			return false;
    			}
    			return false;
    		}*/
    		return true;
    	}
        	
        	
        	
        	
           /* HttpSession session = request.getSession();
            //获取登录的session信息
            Object user = session.getAttribute("admin");
            if (user != null) {
                return true;
            } else {
                //未登录自动跳转界面
                httpServletResponse.sendRedirect("/redirect");
                return false;
            }*/

      

        /**
         * 请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）
         */
        @Override
        public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) {

      // System.out.println("拦截了");
        
        
        
        }

        /**
         * 在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行（主要是用于进行资源清理工作）
         */
        @Override
        public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        }
    }

}