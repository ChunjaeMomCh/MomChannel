package dao;


import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.ChannelMapper;
import mybatis.mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;
import vo.ChannelVO;
import vo.MemberVO;


import java.util.HashMap;
import java.util.List;
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
    public boolean idCheck(String memId) {
        Map<String, String> map = new HashMap<>();
        System.out.println("memId :"+ memId);
        map.put("memId", memId);
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        int result = mapper.idCheck(memId);
        if (result == 1) {
            return true;
        } else {
            return false;
        }
    }
    public int insertMember(MemberVO mvo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        int result = mapper.insertMember(mvo);
        if (result == 1) {
            sqlSession.commit();
            System.out.println("새로운 mvcboard 저장 성공");
        } else {
            System.out.println("새로운 mvcboard 저장 실패");
        }
        sqlSession.close();
        return result;
    }
    public MemberVO selectMember(String memId) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        MemberVO mvo = mapper.selectMember(memId);
        sqlSession.close();
        return mvo;
    }
    public int updateMember(MemberVO mvo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        int result = mapper.updateMember(mvo);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("member update 중 오류 발생...");
        }
        sqlSession.commit();
        return result;
    }

    public List<MemberVO> selectMemList() {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        List<MemberVO> result = mapper.selectMemList();
        sqlSession.close();
        return result;
    }

    public int updateSign(MemberVO mvo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
        int result = mapper.updateSign(mvo);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("member update 중 오류 발생...");
        }
        sqlSession.commit();
        return result;
    }
}
