package dao;


import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.MemberMapper;

import org.apache.ibatis.session.SqlSession;
import vo.MemberVO;


import java.util.HashMap;
import java.util.Map;

public class MemberDAO {
    public MemberVO getMember(String memId) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        MemberVO vo = mapper.getMember(memId);
        sqlSession.close();
        return vo;
    }
    public boolean memCheck(String memId,String memPw) {
        Map<String, String> map = new HashMap<>();
        System.out.println("memId :"+ memId);
        map.put("memId", memId);
        map.put("memPw", memPw);
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        int result = mapper.memCheck(map);
//        sqlSession.close();
        if (result == 1) {
            return true;
        } else {
            return false;
        }
    }
}
