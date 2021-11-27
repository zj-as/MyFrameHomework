package service;

import common.ReturnJson;
import entity.User;

public interface UserService {

    /**
     * 用户登录
     */
    ReturnJson userLogin(String username, String password);

    /**
     * 用户注册
     */
    ReturnJson userRegister(User user);

}
