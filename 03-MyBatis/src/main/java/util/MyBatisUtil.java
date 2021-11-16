package util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * @Title DbUtil
 * @Author 阿沙
 * @Description MyBatis工具类
 * @Date 2021-05-12 15:33
 * @Version 1.0
 **/
public class MyBatisUtil {

    private static SqlSessionFactory factory = null;

    static{
        String config = "mybatis-config.xml"; // 需要和当前项目中的MyBatis主配置文件名一致
        InputStream resourceAsStream = null;
        try {
            resourceAsStream = Resources.getResourceAsStream(config);
            // 创建SqlSessionFactory
            factory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            if (resourceAsStream != null) {
                try {
                    resourceAsStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 获取SqlSessionFactory对象
     */
    public static SqlSessionFactory getSqlSessionFactory(){
        return factory;
    }

    /**
     * 获取SqlSession对象
     */
    public static SqlSession getSqlSession(){
        SqlSession sqlSession = null;
        if (factory != null) {
            sqlSession = factory.openSession(); // 默认为开启事务，且需要手动提交事务
        }
        return sqlSession;
    }

    /**
     * 工具类中的构造方法都是私有的，因为工具类当中的方法都是静态的，不需要new对象，直接采用类名调用
     */
    private MyBatisUtil(){ }

}
