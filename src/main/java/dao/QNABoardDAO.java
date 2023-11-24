package dao;


import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.QNABoardMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.Map;

public class QNABoardDAO {
    public int selectCount(Map<String, Object> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        QNABoardMapper mapper = sqlSession.getMapper(QNABoardMapper.class);
        int result = mapper.selectCount(map);
        System.out.println("selectCount - 행 개수 = " + result);
        sqlSession.close();
        return result;
    }
}
