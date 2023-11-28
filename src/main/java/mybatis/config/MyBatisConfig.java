package mybatis.config;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MyBatisConfig {
    private SqlSessionFactory factory = null;

    public MyBatisConfig() {
        String resource = "config/mybatis-config.xml";
        InputStream iStream = null;

        try {
            iStream = Resources.getResourceAsStream(resource);

        } catch (IOException e) {
            e.printStackTrace();
        }

        this.factory = new SqlSessionFactoryBuilder().build(iStream);
    }  // MyBatisConfig()

    public SqlSessionFactory getSqlSessionFactory() {
        return this.factory;
    }  // getSqlSessionFactory()
}
