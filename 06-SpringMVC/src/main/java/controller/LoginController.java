package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import service.LoginService;

@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;

    @PostMapping(value = "/login.do", produces = "text/plain;charset=utf-8")
    public String login(String username, String password){

        String message = loginService.login(username, password);

        return message;
    }

}
