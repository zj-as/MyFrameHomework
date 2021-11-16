package test;

import entity.Student;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import util.MyBatisUtil;

import java.io.IOException;
import java.util.List;

public class StudentTest {

    private SqlSession sqlSession;

    @BeforeEach
    public void init() {
        sqlSession = MyBatisUtil.getSqlSession();
    }

    /**
     * 查询student表中所有学生记录
     */
    @Test
    public void testSelectAllStudent() throws IOException {

        List<Student> studentList = sqlSession.selectList("selectAllStudent");

        studentList.forEach(student -> System.out.println(student));

        // 输出一些日志信息
        Logger logger = Logger.getLogger(StudentTest.class);
        logger.info(studentList);
    }

    @AfterEach
    public void destroy(){
        sqlSession.clearCache();
    }

}
