package dao;

import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;
import vo.MemberVO;

import java.util.Map;

public class MemberDAO {
    public int memJoin(MemberVO vo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        try {
            int result = mapper.memJoin(vo);
            sqlSession.commit();
            return result;
        } finally {
            sqlSession.close();
        }
    }

    public MemberVO memLogin(Map<String, String> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        MemberVO vo = mapper.memLogin(map);

        System.out.println("로그인 시도 결과1: " + vo);
        return vo;
    }
}
