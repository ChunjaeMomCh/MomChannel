package mybatis.config;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MyBatisConfig {

    private SqlSessionFactory sqlSessionFactory = null;

    public MyBatisConfig() {
        String resource = "config/mybatis-config.xml"; // resource 디렉토리부터 경로 잡음
        InputStream inputStream = null;
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
