package mybatis.config;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MyBatisConfig {

    private SqlSessionFactory sqlSessionFactory = null;

    public MyBatisConfig() {
<<<<<<< HEAD
        String resource = "config/mybatis-config.xml";
        InputStream iStream = null;

=======
        String resource = "config/mybatis-config.xml"; // resource 디렉토리부터 경로 잡음
        InputStream inputStream = null;
>>>>>>> 45e46782bebd9da789e797dc8a788fbb3b25d4a0
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }

    public SqlSessionFactory getSqlSessionFactory() {
        return this.sqlSessionFactory;
    }
}
