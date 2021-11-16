package test;

import dao.StudentDao;
import entity.Student;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import util.MyBatisUtil;

public class StudentDaoTest {

    private SqlSession sqlSession;
    private StudentDao studentDao;

    @BeforeEach
    public void init() {
        sqlSession = MyBatisUtil.getSqlSession();
        studentDao = sqlSession.getMapper(StudentDao.class);
    }

    /**
     * 使用接口配置增删改的数据库执行语句完成对应的基本操作
     */
    @Test
    public void testStudentOperationByDao(){

        Student student1 = new Student();
        student1.setNo("1006");
        student1.setName("李四");
        // 新增一条记录
        int rows1 = studentDao.insertStudent(student1);
        System.out.println("insert student result ：" + (rows1>0?"新增成功":"新增失败"));

        Student student2 = new Student();
        student2.setNo("1006");
        student2.setName("李斯");
        // 修改一条记录
        int rows2 = studentDao.updateStudent(student2);
        System.out.println("update student result ：" + (rows2>0?"更新成功":"更新失败"));

        // 删除一条记录
        int rows3 = studentDao.deleteStudent("李斯");
        System.out.println("delete student result ：" + (rows3>0?"删除成功":"删除失败"));

        sqlSession.commit(); // 提交事务
    }

    @AfterEach
    public void destroy(){
        sqlSession.clearCache();
    }

}
