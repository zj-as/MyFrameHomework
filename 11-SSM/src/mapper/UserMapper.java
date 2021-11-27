package mapper;

import entity.User;

public interface UserMapper {

    /**
     * 新增用户
     */
    int insertUser(User user);

    /**
     * 查询用户
     */
    User queryUser(String username);

}
