package entity;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

@Data // 生成get和set方法
@ToString // 生成toString方法
public class User implements Serializable {

    // 用户ID
    private Integer userId;

    // 用户名
    private String username;

    // 密码
    private String password;

    // 性别
    private String sex;

    // 职业
    private String profession;

    // 爱好（数据库存储的值）
    private String hobby;

    // 爱好（返回给浏览器的值）
    private String[] hobbies;

    // 个人简介
    private String personalDescription;

}
