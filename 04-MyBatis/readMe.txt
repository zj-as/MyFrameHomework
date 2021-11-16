
04-MyBatis动态SQL课后作业

  1、if-choose-where标签使用
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
      ② 根据["学号"和"姓名"]和["班级编号"]两个条件查询student表中的所有记录，输出学生姓名
      ③ "学号"和"姓名"是二选一，"学号"和"姓名"支持模糊查询
      ④ 使用条件查询，没有条件时查询所有

  2、foreach标签的应用
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
      ② 查询"阿沙"和"页老师"所在的班级名称
      ③ 使用foreach循环查询