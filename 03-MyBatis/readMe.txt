
03-MyBatis复杂查询课后作业

  1、联合查询（多对一）
    ⑴ 查询学生信息表student所有记录
      ① 表名student（学生信息表），3个字段
         no 学号 字符串 10位 主键
         name 姓名 字符串 8位 非空
         class_no 班级编号 字符串 10位 外键
      ② 表名class（班级信息表），2个字段
         class_no 编辑编号 字符串 10位 主键
         class_name 班级名称 字符串 10位 非空
    ⑵ 要求
      ① 使用MyBatis框架编程，MySQL数据库
      ② 查询student表中的所有记录，输出学生姓名和该生所在的班级名称
      ③ 使用多对一查询

  2、集合查询（一对多）
    ⑴ 查询学生信息表student所有记录
      ① 表名student（学生信息表），3个字段
         no 学号 字符串 10位 主键
         name 姓名 字符串 8位 非空
         class_no 班级编号 字符串 10位 外键
      ② 表名class（班级信息表），2个字段
         class_no 编辑编号 字符串 10位 主键
         class_name 班级名称 字符串 10位 非空
    ⑵ 要求
      ① 使用MyBatis框架编程，MySQL数据库
      ② 查询student表中的所有记录，输出学生姓名和该生所在的班级名称
      ③ 使用一对多查询

  3、综合查询（多对多）
    ⑴ 查询订单数据
      ① 订单表（orders），4个字段
         order_id 订单编号 字符串 10位 主键
         employee_id 经办人编号 字符串 10位 外键=employee.employee_id
         customer_id 客户编号 字符串 10位 外键=customer.customer_id
         order_time 下单时间 datetime 非空
      ② 订单明细表（order_detail），5个字段
         order_detail_id 订单明细表编号 字符串 10位 主键
         order_id 订单编号 字符串 10位 主键 外键=orders.order_id
         goods_id 商品编号 字符串 10位 主键 外键=goods.goods_id
         amount 数量 整型 非空
         sum 金额 decimal(10,2) 非空
      ③ 员工表（employee），2个字段
         employee_id 员工编号 字符串 10位 主键
         employee_name 员工名称 字符串 10位 非空
      ④ 商品表（goods），3个字段
         goods_id 商品编号 字符串 10位 主键
         goods_name 商品名称 字符串 10位 非空
         goods_price 单击 decimal(10,2) 非空
      ⑤ 客户表（customer），2个字段
         customer_id 客户编号 字符串 10位 主键
         customer_name 客户名称 字符串 10位 非空
    ⑵ 要求
      ① 使用MyBatis框架编程，MySQL数据库
      ② 使用MyBatis联合查询的方式，查询订单表（order）的所有数据，输出每一条订单的订单号、经办人名字、客户名字、订单时间、
         以及每张订单中购买的所有商品的名字、单价、数量、金额。
      ③ 使用多对多查询