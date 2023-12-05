package dao;

import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.ChannelMapper;
import mybatis.mapper.MemberMapper;
import mybatis.mapper.SubMapper;
import org.apache.ibatis.session.SqlSession;
import vo.ChannelVO;
import vo.MemberVO;

import java.util.List;
import java.util.Map;

public class ChannelDAO {
    public int insertChannel(String memId) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        ChannelMapper mapper = sqlSession.getMapper(ChannelMapper.class);
        int result = mapper.insertChannel(memId);
        if (result == 1) {
            sqlSession.commit();
            System.out.println("새로운 channel 저장 성공");
        } else {
            System.out.println("새로운 channel 저장 실패");
        }
        sqlSession.close();
        return result;
    }
    public ChannelVO selectChannel(String memId) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        ChannelMapper mapper = sqlSession.getMapper(ChannelMapper.class);
        ChannelVO cvo = mapper.selectChannel(memId);
        sqlSession.close();
        return cvo;
    }
    public void subPlus(String channelTitle){
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        ChannelMapper mapper = sqlSession.getMapper(ChannelMapper.class);
        mapper.subPlus(channelTitle);
        sqlSession.commit();

    }
    public void subMinus(String channelTitle){
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        ChannelMapper mapper = sqlSession.getMapper(ChannelMapper.class);
        mapper.subMinus(channelTitle);
        sqlSession.commit();
    }

    public int selectChCount(Map<String, Object> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        ChannelMapper mapper = sqlSession.getMapper(ChannelMapper.class);
        int result = mapper.selectChCount(map);
        System.out.println("selectCount - 행 개수 = " + result);
        sqlSession.close();
        return result;
    }

    public List<ChannelVO> selectChList(Map<String, Object> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        ChannelMapper mapper = sqlSession.getMapper(ChannelMapper.class);
        List<ChannelVO> result = mapper.selectChList(map);
        sqlSession.close();
        return result;
    }

}
