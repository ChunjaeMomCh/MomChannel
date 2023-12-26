package dao;

import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.QNABoardMapper;
import mybatis.mapper.SubMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.Map;

public class SubDAO {
    public int subCheck(Map<String, String> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        SubMapper mapper = sqlSession.getMapper(SubMapper.class);
        int result = mapper.subCheck(map);
        if (result > 0) {
            return 0;
        } else {
            return 1;
        }
    }

    public void subUp(Map<String, String> map){
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        SubMapper mapper = sqlSession.getMapper(SubMapper.class);
        mapper.subUp(map);
        sqlSession.commit();
    }

    public void subDown(Map<String, String> map){
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        SubMapper mapper = sqlSession.getMapper(SubMapper.class);
        mapper.subDown(map);
        sqlSession.commit();
    }
}
