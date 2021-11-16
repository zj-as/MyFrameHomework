package controller;

import entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class RegisterController {

    @GetMapping("/register.do")
    public String goToRegisterPage(){
        return "register";
    }

    @PostMapping("/register.do")
    public String registerUser(@Valid User user, Errors errors){

        if (errors.getErrorCount() > 0) {
            for (FieldError error : errors.getFieldErrors()) {
                System.out.println(error.getField() + "：" + error.getDefaultMessage());
            }
            return "register";
        } else {
            return "register_success";
        }
    }

}
