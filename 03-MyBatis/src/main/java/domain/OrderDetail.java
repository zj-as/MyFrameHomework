package domain;

import lombok.Data;

@Data
public class OrderDetail {

    private String orderDetailId;
    private String orderId;
    private String goodsId;
    private int amount;
    private double sum;
    // 一条商品交易信息对应一条订单
    private Orders orders;
    // 多条商品交易信息对应一件商品
    private Goods goods;

}
