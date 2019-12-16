package com.jeyoo.utils;



import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jeyoo.config.MyFilter;
import com.jeyoo.pojo.User;


import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

/**
 * auth登录工具类
 * 
 * @author sunyanxia
 *
 */
@Component
@Slf4j
public class LoginAuthUtil {

	

	private static final String WX_OPEN_ID = "WX_OPEN_ID";// 微信openId session键值
	private static final String ACCESSTOKEN = "ACCESSTOKEN";// 微信token

	private static final String APP_ID = "wx48c2cffa3a6deb39";
	private static final String APP_SECRET = "d053eeb1d407b2d3e2442bc2a3f2f225";

	



	/**
	 * outh登录
	 * 
	 * @param request
	 * @param response
	 */
	public static Map<String, Object> authLogin(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		String contextPath = request.getContextPath();
		String basePath ="https://" + request.getServerName() +contextPath;

		String qryStr = request.getQueryString();// 参数

		String toPath = ("null" == qryStr || StringUtils.isBlank(qryStr)) ? request.getServletPath()
				: request.getServletPath() + "?" + qryStr;// 跳转路径

		// 获取OAuth2.0请求后，服务器返回的code内容,这个code在接下来向微信服务请求用户信息的时候要用到
		String code = request.getParameter("code");
		String openId = (String) session.getAttribute(WX_OPEN_ID);
		log.info("code:" + code + "---------------openId:" + openId);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		boolean status = false;// auth登录是否成功
		boolean isAuthIfNesscary = false;// 是否存在重定向

		try {
			// openId为空没有进行授权，code为空不是授权返回，先进行授权
			if (StringUtils.isEmpty(code) && StringUtils.isEmpty(openId)) {

				log.info("openId为空没有进行授权，code为空不是授权返回，先进行授权");
				authIfNesscary(request, response);
				isAuthIfNesscary = true;

				// code不为空openId为空，即为授权返回
			} else if (StringUtils.isNotEmpty(code) && StringUtils.isEmpty(openId)) {
				String str = getAccessToken(code);
				log.info("根据code获取openid:" + str);
				if (StringUtils.isNotBlank(str)) {// 有返回值
					JSONObject obj = JSONObject.fromObject(str);
					String openid = obj.getString("openid");
					String accessToken = obj.getString("access_token");

					session.setAttribute(ACCESSTOKEN, accessToken);

					if (StringUtils.isNotBlank(openid)) {// openid不为空
						// 根据openid查询是否绑定手机号，没绑定跳转绑定页面,已绑定把用户信息放入session
						return dealUserInfo(accessToken, openid, basePath, toPath, request, response);
					}
				}

				// openid不为空，说明该次已经授权
			} else if (StringUtils.isNotEmpty(openId)) {
				// 根据openid查询是否绑定手机号，没绑定跳转绑定页面,已绑定把用户信息放入session

				String accessToken = (String) session.getAttribute(ACCESSTOKEN);
				return dealUserInfo(accessToken, openId, basePath, toPath, request, response);
			}
		} catch (Exception e) {
			log.error("auth登录失败", e);
		}
		returnMap.put("status", status);
		returnMap.put("isAuthIfNesscary", isAuthIfNesscary);

		return returnMap;
	}

	public static Map<String, Object> dealUserInfo(String accessToken, String openId, String basePath, String toPath,
			HttpServletRequest request, HttpServletResponse response) {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		boolean status = false;
		boolean isAuthIfNesscary = false;
		try {

			//Map<String, String> map = authLoginService.queryByOpenId(openId);// 根据openid查询手机号
																				// 昵称
			if (true) {// 手机号不为空，数据库已存在该微信用户信息
				/*String mobile = map.get("PHONE");
				String nickname = map.get("NICKNAME");// 昵称
				String headimgurl = map.get("HEADIMGURL");// 头像
					User userInfo = new User();
					setUserInfoSms(userInfo, res, mobile);// 设置用户信息
*/
					//request.getSession().setAttribute("USER_TOKEN", Serializer.serialize(userInfo));// 用户信息放入缓存
					request.getSession().setAttribute("USER_TOKEN", openId);
					request.getSession().setAttribute(WX_OPEN_ID, openId);// openid放入用户信息
					//request.getSession().setAttribute(OTHER_MOBILE, mobile);
					
					//loginAuthUtil.loginService.addLoginLog(logParams);// 添加登录日志

					//authLoginService.addLoginLogDetail(mobile, "wap", "1", "8", basePath + toPath);// 添加详细登录日志

					
					status = true;
				
			} else {// 手机号为空,跳转绑定手机号页面
				/*logger.info(openId + "手机号为空,跳转手机号绑定页面");
				request.getSession().setAttribute(WX_OPEN_ID, openId);
				request.getSession().setAttribute(REDIRECT_URL, basePath + toPath);
				response.sendRedirect(LOGIN_WECHAT_BINDING);
				isAuthIfNesscary = true;*/
			}
		} catch (Exception e) {
			log.error("处理用户信息失败", e);
		}
		returnMap.put("status", status);
		returnMap.put("isAuthIfNesscary", isAuthIfNesscary);

		return returnMap;
	}

	/**
	 * 跳转授权页面进行授权(获取code)
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public static void authIfNesscary(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String basePath = "http://" + request.getServerName() + request.getContextPath();
		String qryStr = request.getQueryString();// 参数

		String toPath = StringUtils.isBlank(qryStr) ? request.getServletPath()
				: request.getServletPath() + "?" + qryStr;// 跳转路径

		String serviceUrl = URLEncoder.encode(basePath + toPath, "UTF-8");

		StringBuffer oauth_url = new StringBuffer();
		oauth_url.append("https://open.weixin.qq.com/connect/oauth2/authorize");
		oauth_url.append("?appid=").append(APP_ID);
		oauth_url.append("&redirect_uri=").append(serviceUrl);
		oauth_url.append("&response_type=code");
		oauth_url.append("&scope=snsapi_userinfo");
		oauth_url.append("&state=2#wechat_redirect");
		log.info("跳转授权页面进行授权(获取code)----" + oauth_url);
		response.sendRedirect(oauth_url.toString());
	}

	/**
	 * 获取token
	 * 
	 * @param code
	 * @return
	 */
	public static String getAccessToken(String code) {
		StringBuffer url = new StringBuffer();
		url.append("https://api.weixin.qq.com/sns/oauth2/access_token");
		url.append("?appid=").append(APP_ID);
		url.append("&secret=").append(APP_SECRET);
		url.append("&code=").append(code);
		url.append("&grant_type=authorization_code");
		try {
			return HttpsClientUtils.get(url.toString());
//			return SendHttp.send(url.toString());
		} catch (Exception e) {
			log.error("获取token出错", e);
			return "";
		}
	}

	
	/**
	 * 获取userinfo
	 * 
	 * @param code
	 * @return
	 */
	public static String getWXUserInfo(String openid,String accesstoken) {
		StringBuffer url = new StringBuffer();
		url.append("https://api.weixin.qq.com/sns/userinfo");
		url.append("?openid=").append(openid);
		url.append("&access_token=").append(accesstoken);
		url.append("&lang=").append("zh_CN");
		
		try {
			return HttpsClientUtils.get(url.toString());

		} catch (Exception e) {
			log.error("获取wxinfo出错", e);
			return "";
		}
	}

	

	/**
	 * 拼接添加日志参数
	 * 
	 * @param pageContext
	 * @return
	 */
	public static Map<String, Object> getLogParams(String mobile, String loginType, String code,
			HttpServletRequest request, String userId) {
		// 增加客户端IP
		String clientRealIP = request.getHeader("clientrealip");
		clientRealIP = StringUtils.isEmpty(clientRealIP) ? "" : clientRealIP;

		Map<String, Object> paramsMap = new HashMap<String, Object>();

		paramsMap.put("isSuccess", code);// 登录是否成功
		paramsMap.put("mobile", mobile);// 手机号
		paramsMap.put("loginType", loginType);// 登录方式
		paramsMap.put("market", "");// 下载渠道
		paramsMap.put("userId", "0");// 用户号码的唯一标示，用于判断用户是否新入网。
		paramsMap.put("platform", "wap");// 终端型号（iphone，android， wap）
		paramsMap.put("version", "");// app版本号
		paramsMap.put("deviceCode", "");// 手机唯一标识号
		paramsMap.put("imsi", "");// 手机卡imsi号
		paramsMap.put("imei", "");// ios:uuid android:imei
		paramsMap.put("phoneModel", "");// 手机型号
		paramsMap.put("phoneSystem", "");// 手机系统型号
		paramsMap.put("screen", "");// 手机分辨率
		paramsMap.put("netWork", "");// 当前网络
		paramsMap.put("ip", clientRealIP);// 客户端IP
		paramsMap.put("userId", userId);
		return paramsMap;
	}



	/***
	 * 用户信息记入session（分为只有opid、异网用户绑定、山东移动绑定，不在跳转绑定页面）
	 * 
	 * @param accessToken
	 * @param openId
	 * @param basePath
	 * @param toPath
	 * @param request
	 * @param response
	 * @return
	 */
	/*public static Map<String, Object> dealUserInfoOther(String accessToken, String openId, String basePath,
			String toPath, HttpServletRequest request, HttpServletResponse response) {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		boolean status = false;
		boolean isAuthIfNesscary = false;
		String type = WECHATPHONE;
		try {
			// 首先去山东移动用户绑定表里去查询
			Map<String, String> map = authLoginService.queryByOpenId(openId);// 根据openid查询手机号
																				// 昵称
			if (map == null || map.isEmpty()) {
				// 如果查不到，去异网用户绑定表里去查询
				map = authLoginService.queryByOpenIdOther(openId);
				type = WECHATOTHERPHONE;
			}

			if (null != map && !map.isEmpty()) {// 手机号不为空，数据库已存在该微信用户信息
				String mobile = map.get("PHONE");
				String nickname = map.get("NICKNAME");// 昵称
				String headimgurl = map.get("HEADIMGURL");// 头像
				// if (InvocationResult.isResultSuccess(res)) {//非行业应用卡
				Map<String, Object> logParams = new HashMap<String, Object>();
				if (WECHATPHONE.equals(type)) {
					UserInfoBean userInfo = new UserInfoBean();
					QRY900004Result res = loginAuthUtil.loginService.qryUserInfoNew(mobile);
					setUserInfoSms(userInfo, res, mobile);// 设置用户信息
					logParams = getLogParams(mobile, LOGINTYPE, "1", request, res.getSubsid());
					request.getSession().setAttribute("USER_TOKEN", Serializer.serialize(userInfo));// 用户信息放入缓存
					loginAuthUtil.loginService.addLoginLog(logParams);// 添加登录日志
				}
				//添加异网登录日志
				if(WECHATOTHERPHONE.equals(type)){
					authLoginService.addLoginLogDifferent(mobile, "wap", "1", type);
				}
				request.getSession().setAttribute(OTHER_MOBILE, mobile);// 用户信息放入缓存
				authLoginService.addLoginLogDetail(mobile, "wap", "1", "8", basePath + toPath);// 添加详细登录日志
				request.getSession().setAttribute(WX_OPEN_ID, openId);// openid放入用户信息
				request.getSession().setAttribute(LOGINTYPEOTHER, type);
				String tnickname = "";// 微信昵称
				String theadimgurl = "";// 微信用户头像链接

				QRY900015Result weChatUserInfo = loginAuthUtil.loginService.checkUserInfoForThirdPlatform("wap",
						"WECHAT", openId, accessToken, "");

				logger.info(openId + "----" + accessToken + "----" + JSONObject.fromObject(weChatUserInfo));

				if (InvocationResult.isResultSuccess(weChatUserInfo)) {
					if (StringUtils.isBlank(nickname) || StringUtils.isBlank(headimgurl)
							|| !nickname.equals(weChatUserInfo.getUserName())
							|| !headimgurl.equals(weChatUserInfo.getUserPic())) {// 若昵称为空或已改变，修改该条记录，把昵称和头像补全
						tnickname = weChatUserInfo.getUserName();
						theadimgurl = weChatUserInfo.getUserPic();
						authLoginService.updateWechatUserOther(openId, tnickname, theadimgurl);
					}
				}
				status = true;
				// }
			} else {// 手机号为空
				logger.info(openId + "手机号为空,id不为空跳转");
				request.getSession().setAttribute(WX_OPEN_ID, openId);
				request.getSession().setAttribute(REDIRECT_URL, basePath + toPath);
				request.getSession().setAttribute(LOGINTYPEOTHER, WECHATOPENID);
				response.sendRedirect(basePath + toPath);
				System.out.println("ssssssssssssssssss========================="+basePath + toPath);
			    isAuthIfNesscary = true;
			}
		} catch (Exception e) {
			logger.error("处理用户信息失败", e);
		}
		returnMap.put("status", status);
		returnMap.put("isAuthIfNesscary", isAuthIfNesscary);

		return returnMap;
	}*/

	/**
	 * outh登录(不在绑定手机号)
	 * 
	 * @param request
	 * @param response
	 * @param type
	 *            1代表openid登录，0代表异网用户登录
	 */
	/*public static Map<String, Object> authLoginNew(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		String contextPath = request.getContextPath();
		String basePath = "https://" + request.getServerName() + contextPath;
		// 参数
		String qryStr = request.getQueryString();
		// 跳转路径
		String toPath = ("null" == qryStr || StringUtils.isBlank(qryStr)) ? request.getServletPath()
				: request.getServletPath() + "?" + qryStr;

		// 获取OAuth2.0请求后，服务器返回的code内容,这个code在接下来向微信服务请求用户信息的时候要用到
		String code = request.getParameter("code");
		String openId = (String) session.getAttribute(WX_OPEN_ID);
		log.info("code:" + code + "---------------openId:" + openId);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		boolean status = false;// auth登录是否成功
		boolean isAuthIfNesscary = false;// 是否存在重定向

		try {
			// openId为空没有进行授权，code为空不是授权返回，先进行授权
			if (StringUtils.isEmpty(code) && StringUtils.isEmpty(openId)) {

				log.info("openId为空没有进行授权，code为空不是授权返回，先进行授权");
				authIfNesscary(request, response);
				isAuthIfNesscary = true;

				// code不为空openId为空，即为授权返回
			} else if (StringUtils.isNotEmpty(code) && StringUtils.isEmpty(openId)) {
				String str = getAccessToken(code);
				log.info("根据code获取openid:" + str);
				if (StringUtils.isNotBlank(str)) {// 有返回值
					JSONObject obj = JSONObject.fromObject(str);
					String openid = obj.getString("openid");
					String accessToken = obj.getString("access_token");

					session.setAttribute(ACCESSTOKEN, accessToken);

					if (StringUtils.isNotBlank(openid)) {// openid不为空
						// 根据openid查询是否绑定手机号，没绑定跳转绑定页面,已绑定把用户信息放入session
						return dealUserInfoOther(accessToken, openid, basePath, toPath, request, response);
					}
				}
				// openid不为空，说明该次已经授权
			} else if (StringUtils.isNotEmpty(openId)) {
				// 根据openid查询是否绑定手机号，没绑定跳转绑定页面,已绑定把用户信息放入session
				String accessToken = (String) session.getAttribute(ACCESSTOKEN);
				return dealUserInfoOther(accessToken, openId, basePath, toPath, request, response);
			}
		} catch (Exception e) {
			log.error("auth登录失败", e);
		}
		returnMap.put("status", status);
		returnMap.put("isAuthIfNesscary", isAuthIfNesscary);

		return returnMap;
	}*/
}
