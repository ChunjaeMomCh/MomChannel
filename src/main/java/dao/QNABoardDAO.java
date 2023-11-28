package dao;


import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.QNABoardMapper;
import org.apache.ibatis.session.SqlSession;
import vo.QNABoardVO;

import java.util.HashMap;
import java.util.List;
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

    public int insertWrite(QNABoardVO vo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        QNABoardMapper mapper = sqlSession.getMapper(QNABoardMapper.class);
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
    public int insertWriteAnswer(QNABoardVO vo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        QNABoardMapper mapper = sqlSession.getMapper(QNABoardMapper.class);
        int result = mapper.insertWriteAnswer(vo);
        if (result == 1) {
            sqlSession.commit();
            System.out.println("새로운 mvcboard 저장 성공");
        } else {
            System.out.println("새로운 mvcboard 저장 실패");
        }
        sqlSession.close();
        return result;
    }

    public List<QNABoardVO> selectListPageWithPaging(Map<String, Object> map) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        QNABoardMapper mapper = sqlSession.getMapper(QNABoardMapper.class);
        List<QNABoardVO> result = mapper.selectListPageWithPaging(map);
        sqlSession.close();
        return result;
    }

    public QNABoardVO selectView(String qnoNo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        QNABoardMapper mapper = sqlSession.getMapper(QNABoardMapper.class);
        QNABoardVO vo = mapper.selectView(qnoNo);
        sqlSession.close();
        return vo;
    }

    public boolean confirmPassword(String pass, String qnoNo) {
        Map<String, String> map = new HashMap<>();
        map.put("pass", pass);
        map.put("qnoNo", qnoNo);
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        QNABoardMapper mapper = sqlSession.getMapper(QNABoardMapper.class);
        int result = mapper.confirmPassword(map);
        if (result == 1) {
            return true;
        } else {
            return false;
        }
    }

    public int deletePost(String qnoNo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        QNABoardMapper mapper = sqlSession.getMapper(QNABoardMapper.class);
        int result = mapper.deletePost(qnoNo);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("board 삭제 중 오류 발생...");
        }
        return result;
    }

    public int updatePost(QNABoardVO vo) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        QNABoardMapper mapper = sqlSession.getMapper(QNABoardMapper.class);
        int result = mapper.updatePost(vo);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("board update 중 오류 발생...");
        }
        sqlSession.commit();
        return result;
    }
}
