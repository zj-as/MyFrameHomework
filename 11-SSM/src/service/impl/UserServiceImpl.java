package service.impl;

import common.ReturnJson;
import entity.User;
import mapper.UserMapper;
import org.springframework.stereotype.Service;
import service.UserService;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public ReturnJson userLogin(String username, String password) {

        User user = userMapper.queryUser(username);

        // 先判断该用户是否存在
        if (user == null) {
            return new ReturnJson("202", "该用户不存在", null);
        }

        // 如果该用户存在，比对密码
        if (user.getPassword().equals(password)) {
            user.setHobbies(user.getHobby().split("_"));
            return new ReturnJson("200", "登录成功", user);
        } else {
            return new ReturnJson("201", "密码错误", null);
        }
    }

    @Override
    public ReturnJson userRegister(User user) {

        User selectUser = userMapper.queryUser(user.getUsername());

        // 先判断该用户是否存在，不存在时才能进行注册
        if (selectUser == null) {
            int insertUser = userMapper.insertUser(user);

            // 判断新增一条用户记录是否成功
            if (insertUser > 0) {
                return new ReturnJson("200", "注册成功", null);
            }
            return new ReturnJson("203", "注册失败", null);
        }

        return new ReturnJson("204" , "该用户已存在", null);
    }

}
