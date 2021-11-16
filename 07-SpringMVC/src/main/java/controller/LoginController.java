package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import service.LoginService;

@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;

    @PostMapping(value = "/login.do")
    public ModelAndView login(String username, String password){

        ModelAndView modelAndView = new ModelAndView();

        int loginResult = loginService.login(username, password);

        switch (loginResult) {
            case 200:
                modelAndView.addObject("message", "登录成功");
                modelAndView.addObject("username", username);
                modelAndView.addObject("password", password);
                modelAndView.setViewName("login_success");
                break;
            case 201:
                modelAndView.addObject("message", "用户名错误！");
                modelAndView.setViewName("login_fail");
                break;
            case 202:
                modelAndView.addObject("message", "密码错误！");
                modelAndView.setViewName("login_fail");
                break;
        }

        return modelAndView;
    }

    @PostMapping(value = "/loginByAjax.do", produces = "text/plain;charset=utf-8")
    public String loginByAjax(String username, String password){

        String message = "";

        int loginResult = loginService.login(username, password);

        switch (loginResult) {
            case 200:
                message = username + "登录成功";
                break;
            case 201:
                message = "用户名错误";
                break;
            case 202:
                message = "密码错误";
                break;
        }

        return message;
    }

}
