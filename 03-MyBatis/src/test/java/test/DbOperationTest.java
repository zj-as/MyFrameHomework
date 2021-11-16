package test;

import domain.OrderDetail;
import domain.Orders;
import entity.Clazz;
import entity.Student;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import util.MyBatisUtil;

import java.util.List;

public class DbOperationTest {
    
    private SqlSession sqlSession;
    
    @BeforeEach
    public void init(){
        sqlSession = MyBatisUtil.getSqlSession();
    }

    /**
     * 多对一查询
     */
    @Test
    public void testManyToOne(){
        List<Student> studentList = sqlSession.selectList("manyToOne");
        studentList.forEach(student -> System.out.println(student));
    }

    /**
     * 一对多查询
     */
    @Test
    public void testOneToMany(){
        List<Clazz> clazzList = sqlSession.selectList("oneToMany");
        clazzList.forEach(clazz -> System.out.println(clazz));
    }

    /**
     * 综合查询
     */
    @Test
    public void testComprehensiveQuery(){
        List<Orders> ordersList = sqlSession.selectList("comprehensiveQuery");
        ordersList.forEach(orders -> {
            System.out.println("订单编号：" + orders.getOrderId() +
                               "  顾客：" + orders.getCustomer().getCustomerName() +
                               "  负责员工：" + orders.getEmployee().getEmployeeName());
            List<OrderDetail> orderDetailList = orders.getOrderDetailList();
            orderDetailList.forEach(orderDetail -> {
                System.out.println("  商品交易编号：" + orderDetail.getOrderDetailId() +
                                   "  商品名称：" + orderDetail.getGoods().getGoodsName() +
                                   "  商品单价：" + orderDetail.getGoods().getGoodsPrice() +
                                   "  购买数量：" + orderDetail.getAmount() +
                                   "  总价：" + orderDetail.getSum() +
                                   "  交易时间：" + orders.getOrderTime());
            });
            System.out.println();
        });
    }

    @AfterEach
    public void destroy(){
        sqlSession.clearCache();
    }
    
}
