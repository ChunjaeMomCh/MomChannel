package dao;


import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.NoticeMapper;
import org.apache.ibatis.session.SqlSession;
import vo.NoticeVO;

import java.util.List;
import java.util.Map;

public class NoticeDAO {
    public int selectCount(Map<String, Object> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        int result = mapper.selectCount(map);
        System.out.println("selectCount - 행 개수 = " + result);
        sqlSession.close();
        return result;
    }

    public List<NoticeVO> selectNoticeListWithPaging(Map<String, Object> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        List<NoticeVO> result = mapper.selectNoticeListWithPaging(map);
        sqlSession.close();
        return result;
    }

    public NoticeVO selectNoticeView(String noticeNo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        NoticeVO vo = mapper.selectNoticeView(noticeNo);
        sqlSession.close();
        return vo;
    }

    public int deleteNotice(String noticeNo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        int result = mapper.deleteNotice(noticeNo);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("notice 삭제 중 오류 발생...");
        }
        return result;
    }

}
