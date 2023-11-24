package dao;

import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;
import vo.MemberVO;

public class MemberDAO {
    public int memJoin(MemberVO vo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        int result = mapper.memJoin(vo);
        sqlSession.commit();
        sqlSession.close();
        return result;
    }
}
