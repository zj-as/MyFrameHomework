import entity.QueryCriteria;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.StudentService;

import java.util.List;

public class StudentServiceTest {

    private ApplicationContext applicationContext;
    private StudentService studentService;
    private QueryCriteria queryCriteria;

    @BeforeEach
    public void init(){
        
        // 加载Spring配置文件
        applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

        // 获取Spring容器中的对象
        studentService = applicationContext.getBean(StudentService.class);
        queryCriteria = applicationContext.getBean(QueryCriteria.class);
    }

    @Test
    public void testQueryStudentClassByArray(){
        
        // 执行查询操作
        List<String> classNames = studentService.queryStudentClassByArray(queryCriteria.getStudentNames());

        // 输出结果
        classNames.forEach(className -> System.out.println(className));
    }

    @Test
    public void testQueryStudentClassByList(){

        // 执行查询操作
        List<String> classNames = studentService.queryStudentClassByList(queryCriteria.getStudentList());

        // 输出结果
        classNames.forEach(className -> System.out.println(className));
    }

}
