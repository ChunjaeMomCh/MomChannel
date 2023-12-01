package dao;


import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.NoticeMapper;
import mybatis.mapper.QNABoardMapper;
import org.apache.ibatis.session.SqlSession;
import vo.NoticeVO;
import vo.QNABoardVO;

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

    public int insertWrite(NoticeVO vo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        int result = mapper.insertWrite(vo);
        if (result == 1) {
            sqlSession.commit();
            System.out.println("새로운 mvcboard 저장 성공");
        } else {
            System.out.println("새로운 mvcboard 저장 실패");
        }
        sqlSession.close();
        return result;
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
