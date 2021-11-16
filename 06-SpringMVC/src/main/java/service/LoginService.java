package service;

import org.springframework.stereotype.Service;

@Service
public class LoginService {

    /**
     * 验证用户登录信息
     *
     * @param username 用户名
     * @param password 用户密码
     * @return 登录结果
     */
    public String login(String username, String password){

        if (username.equals("阿沙")&&password.equals("123456")) {
            return "登录成功";
        } else if (username.equals("阿沙")) {
            return "密码错误";
        } else {
            return "用户名错误";
        }
    }

}
