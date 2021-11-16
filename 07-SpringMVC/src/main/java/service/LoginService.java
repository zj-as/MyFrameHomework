package service;

import org.springframework.stereotype.Service;

@Service
public class LoginService {

    /**
     * 验证用户登录信息
     *
     * @param username 用户名
     * @param password 用户密码
     * @return 200 登录成功 ；201 用户名错误 ；202 密码错误
     */
    public int login(String username, String password){

        if (username.equals("阿沙")&&password.equals("123456")) {
            return 200;
        } else if (username.equals("阿沙")) {
            return 202;
        } else {
            return 201;
        }
    }

}
