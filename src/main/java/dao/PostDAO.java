package dao;

import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.PostMapper;
import org.apache.ibatis.session.SqlSession;
import vo.PostVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PostDAO {


    // 게시글 목록 불러오기
    // 검색 기능 구현
    public int selectCount(Map<String, Object> map) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        int result = mapper.selectCount(map);

        System.out.println("selectCount - 행 개수 = " + result);
        session.close();
        return result;

    }
    // 페이징 처리
    public List<PostVO> selectListPage(Map<String, Object> map) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        List<PostVO> result = mapper.selectListPage(map);

        session.close();
        return result;

    }

    public List<PostVO> showPosts(Map<String, Object> map) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        List<PostVO> postList = mapper.showPosts(map);

        session.close();
        return postList;
    }

    // 게시글 상세 보기 화면 불러오기
    public PostVO viewPost(String postNo) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        PostVO result = mapper.viewPost(postNo);

        session.close();
        return result;
    }

    // 게시물 상세 보기 시 조회수 업데이트
    public int updateVisitCount(String postNo) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        int result = mapper.updateVisitCount(postNo);

        session.close();
        return result;
    }

    // 게시물 작성 페이지
    public int writePost(HashMap<String, Object> map) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        int result = mapper.writePost(map);

        session.close();
        return result;
    }

    // 게시물 수정 기능
    public int updatePost(PostVO vo) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        int result = mapper.updatePost(vo);

        session.close();
        return result;
    }
}
