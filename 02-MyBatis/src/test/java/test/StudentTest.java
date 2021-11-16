package test;

import entity.Student;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import util.MyBatisUtil;

public class StudentTest {

    private SqlSession sqlSession;

    @BeforeEach
    public void init() {
        sqlSession = MyBatisUtil.getSqlSession();
    }

    /**
     * 查询student表中学号为1001、姓名为阿沙的学生的记录，并把学号单独输出
     */
    @Test
    public void testSelectStudent(){

        Student student = new Student();
        student.setNo("1001");
        student.setName("阿沙");

        Student selectStudent = sqlSession.selectOne("selectStudent", student);

        System.out.println("查询学生的学号为：" + selectStudent.getNo());
    }

    /**
     * 向student表中新增一条学生记录，该学生学号为1006，姓名为李四
     */
    @Test
    public void testInsertStudent(){

        Student student = new Student();
        student.setNo("1006");
        student.setName("李四");

        int rows = sqlSession.insert("insertStudent", student);
        System.out.println("insert student result ：" + (rows>0?"新增成功":"新增失败"));

        sqlSession.commit(); // 提交事务
    }

    /**
     * 将student表中学号为1006的学生记录的姓名修改为李斯
     */
    @Test
    public void testUpdateStudent(){

        Student student = new Student();
        student.setNo("1006");
        student.setName("李斯");

        int rows = sqlSession.insert("updateStudent", student);
        System.out.println("update student result ：" + (rows>0?"更新成功":"更新失败"));

        sqlSession.commit(); // 提交事务
    }

    /**
     * 删除student表中姓名为李四的记录
     */
    @Test
    public void testDeleteStudent(){

        int rows = sqlSession.insert("deleteStudent", "李斯");
        System.out.println("delete student result ：" + (rows>0?"删除成功":"删除失败"));

        sqlSession.commit(); // 提交事务
    }

    @AfterEach
    public void destroy(){
        sqlSession.clearCache();
    }

}
