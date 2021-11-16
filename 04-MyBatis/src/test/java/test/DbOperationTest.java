package test;

import entity.Student;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import util.MyBatisUtil;

import java.util.ArrayList;
import java.util.List;

public class DbOperationTest {
    
    private SqlSession sqlSession;
    
    @BeforeEach
    public void init(){
        sqlSession = MyBatisUtil.getSqlSession();
    }

    /**
     * if-choose-where标签的使用
     */
    @Test
    public void testSelectStudentByIfChooseWhere(){

        Student student = new Student();
        student.setNo("1");
        student.setName("阿沙");
        student.setClassNo("1");

        List<Student> studentList = sqlSession.selectList("selectStudentByIfChooseWhere", student);
        studentList.forEach(stu -> System.out.println(stu));
    }

    /**
     * foreach标签的使用
     */
    @Test
    public void testSelectStudentByForeach(){

        List<String> nameList = new ArrayList<>();
        nameList.add("阿沙");
        nameList.add("页老师");

        List<Student> studentList = sqlSession.selectList("selectStudentByForeach", nameList);
        studentList.forEach(stu -> System.out.println(stu));
    }

    @AfterEach
    public void destroy(){
        sqlSession.clearCache();
    }
    
}
