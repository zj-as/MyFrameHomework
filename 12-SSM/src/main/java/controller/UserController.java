package controller;

import common.ReturnJson;
import entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Resource
    private UserService userService;

    @GetMapping("/login")
    public String returnLoginPage(){
        return "login";
    }

    @GetMapping("/index")
    public String goToIndexPage(){
        return "index";
    }

    @PostMapping(value = "/login")
    @ResponseBody
    public ReturnJson userLogin(String username, String password, HttpSession session) {

        ReturnJson returnJson = userService.userLogin(username, password);

        if (returnJson.getData() != null) {
            // 登录成功时将用户信息存入Session域中
            session.setAttribute("user", returnJson.getData());
        }

        return returnJson;
    }

    @PostMapping("/register")
    @ResponseBody
    public ReturnJson userRegister(User user){
        return userService.userRegister(user);
    }

    @GetMapping("/changeLocale")
    public String changeLocale(HttpServletRequest request) {
        request.getSession().setAttribute("locale", request.getParameter("locale"));
        return "login";
    }

}
