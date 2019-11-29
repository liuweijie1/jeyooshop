package com.jeyoo.controller;

import com.jeyoo.config.JwtInitProperties;
import com.jeyoo.pojo.AdminEmployee;
import com.jeyoo.pojo.User;
import com.jeyoo.service.impl.AuthService;
import com.jeyoo.utils.CookieUtils;
import com.jeyoo.utils.JwtUtils;
import com.jeyoo.utils.MD5;
import com.jeyoo.vo.HouseEnum;
import com.jeyoo.vo.UserInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@Controller
public class AuthController {
    @Autowired
    private AuthService authService;
    @Autowired
    private JwtInitProperties properties;
    /**
     * 登录
     *
     * @return
     * @throws Exception 
     */
    @PostMapping("login")
    @ResponseBody
    //public ResponseEntity<String> codecheck(HttpServletResponse response, HttpServletRequest request)throws ServletException, IOException {
    	public String codecheck(HttpServletResponse response, HttpServletRequest request)throws Exception {
    	//设置响应乱码
        response.setContentType("text/html;charset=UTF-8");
        //对验证码进行校验
        //获取用户名、密码、验证码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String md5Password = MD5.md5(password, HouseEnum.SALT.getName());
       // String code = request.getParameter("code");
        String code = request.getParameter(HouseEnum.VERIFYCODE.getName());
        //获取CodeServlet生成的验证码
        String checkCode = (String)request.getSession().getAttribute("code");

        //对两个验证码进行判断n
        if ("" == code){
           // return ResponseEntity.ok("請輸入驗證碼");
        	return "驗證碼不正確";
        }else {
            //equalsIgnoreCase 忽略验证码大小写
            if (code.equalsIgnoreCase(checkCode)){
                //      登录
                AdminEmployee adminEmployee = authService.login(username, md5Password);
                if (null != adminEmployee) {
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", adminEmployee);
                    String id = request.getSession().getId();
                    Cookie cookie = new Cookie("JSESSIONID", id);
                    //对cookie进行持久化操作
                    cookie.setMaxAge(60 * 30);
                    //cookie响应回浏览器
                    response.addCookie(cookie);
                    //return ResponseEntity.ok("200");
                    return HouseEnum.SUCCESS.getValue();
                }
                //return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
                return HouseEnum.SUCCESS.getValue();
            }else {
                //return ResponseEntity.ok("驗證碼不正確");
            	return "驗證碼不正確";
            }
        }
    }
    
   /* public String codecheck(HttpServletResponse response, HttpServletRequest request) throws Exception {
        //设置响应乱码
        response.setContentType("text/html;charset=UTF-8");
        //对验证码进行校验
        //获取用户名、密码、验证码
        String username = request.getParameter(HouseEnum.USERNAME.getName());
        String password = request.getParameter(HouseEnum.PASSWORD.getName());
        String md5Password = MD5.md5(password, HouseEnum.SALT.getName());
        String code = request.getParameter(HouseEnum.VERIFYCODE.getName());
        Cookie[] cookies = request.getCookies();
        String verifycode = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(HouseEnum.VERIFYCODE.getName())) {
                verifycode = cookie.getValue();
            }
        }
            //对两个验证码进行判断n
            if ("".equals(code)) {
                return "請輸入驗證碼";
            }
            //equalsIgnoreCase 忽略验证码大小写
            if (MD5.verify(code.toLowerCase(), HouseEnum.SALT.getName(), verifycode)) {
                //登录
                AdminEmployee adminEmployee = authService.login(username, md5Password);
                if (null != adminEmployee) {
                    // 生成userInfo
                    UserInfo userInfo = new UserInfo(adminEmployee.getEmployeeid(), adminEmployee.getEmployeecode(),adminEmployee.getEmployeeno());
                    // 生成token
                    String token = JwtUtils.generateToken(userInfo, properties.getPrivateKey(), properties.getExpire());
                    //sysLoginlogMapper.insertLogin(adminEmployee.getEmployeecode(),getIPAddress(request),new Date());
                    Cookie cookie = new Cookie(properties.getCookieName(), token);
                    cookie.setMaxAge(properties.getCookieMaxAge());
                    cookie.setHttpOnly(true);
                    cookie.setSecure(false);
                    response.addCookie(cookie);
                    return HouseEnum.SUCCESS.getValue();
                }
                return HouseEnum.ERROR.getValue();
            }
                return "驗證碼不正確";


    }

*/
    /**
     * 注销
     *
     * @param
     * @return
     */
    @GetMapping("**/logout")
    @ResponseBody
    public ResponseEntity<Void> verifyUser(HttpServletResponse response, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object admin = session.getAttribute("admin");
        if (null != admin) {
            session.invalidate();
            return ResponseEntity.status(HttpStatus.CREATED).body(null);
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

    }
    @RequestMapping("redirect")
    public String redirect() {
        return "login";
    }

    @RequestMapping("/index")
    public String method() {
        return "index";
    }

    @RequestMapping("codeServlet")
    @ResponseBody
    public void codeservlet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // gui 生成图片

        // 1 高和宽

        int height = 40;

        int width = 110;

        String data = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";

        Random random = new Random();

        // 2 创建一个图片

        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        // 3 获得画板

        Graphics g = image.getGraphics();

        // 4 填充一个矩形

        // * 设置颜色

        g.setColor(Color.BLACK);

        g.fillRect(0, 0, width, height);

        g.setColor(Color.WHITE);

        g.fillRect(1, 1, width - 2, height - 2);

        // * 设置字体

        g.setFont(new Font("宋体", Font.BOLD | Font.ITALIC, 35));

        StringBuffer sb = new StringBuffer();

        // 5 写随机字

        for (int i = 0; i < 4; i++) {

            // 设置颜色--随机数

            g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));

            // 获得随机字

            int index = random.nextInt(data.length());

            String str = data.substring(index, index + 1);

            // 写入

            g.drawString(str, width / 6 * (i + 1), 30);
            sb.append(str);//  获取验证码数据

        }
        //  验证码保存到session中
        request.getSession().setAttribute("code",sb.toString());


        // 6 干扰线

        for (int i = 0; i < 3; i++) {

            // 设置颜色--随机数

            g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));

            // 随机绘制先

            g.drawLine(random.nextInt(width), random.nextInt(height), random.nextInt(width), random.nextInt(height));

            // 随机点

            g.drawOval(random.nextInt(width), random.nextInt(height), 2, 2);

        }

        // end 将图片响应给浏览器

        ImageIO.write(image, "jpg", response.getOutputStream());

    }
}
