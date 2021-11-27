package common;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * 这是专门用于返回给浏览器（客户端）的对象
 */
@Data // 生成get和set方法
@AllArgsConstructor // 生成全参构造器
public class ReturnJson implements Serializable {

    // 状态码
    private String code;

    // 信息
    private String message;

    // 数据
    private Object data;

}
