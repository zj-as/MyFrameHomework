package domain;

import lombok.Data;

import java.util.List;

@Data
public class Orders {

    private String orderId;
    private String employeeId;
    private String customerId;
    private String orderTime;
    // 多条订单对应一个顾客
    private Customer customer;
    // 多条订单对应一个员工
    private Employee employee;
    // 一条订单可以有多条商品交易信息
    private List<OrderDetail> orderDetailList;

}
