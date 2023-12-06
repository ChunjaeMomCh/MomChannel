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
        session.close();
        return result;

    }
    public int selectCountGrade(Map<String, Object> map) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        int result = mapper.selectCountGrade(map);
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

    // 전체 게시판 페이지 불러오기
    public List<PostVO> showPosts(Map<String, Object> map) {
        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        List<PostVO> postList = mapper.showPosts(map);

        session.close();
        return postList;
    }
    // 학년별 게시판 페이지 불러오기
    public List<PostVO> showPostsByGrade(Map<String, Object> map) {
        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        List<PostVO> postList = mapper.showPostsByGrade(map);

        session.close();
        return postList;
    }

    // 지역별 게시판 페이지 불러오기
    public List<PostVO> showPostsByRegion(Map<String, Object> map) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        List<PostVO> postList = mapper.showPostsByRegion(map);

        session.close();
        return postList;
    }

    // 학년별 게시판 페이지 불러오기

    public List<PostVO> showPostsByCh(String channelTitle) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        List<PostVO> postList = mapper.showPostsByCh(channelTitle);

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
        session.commit();

        session.close();
        return result;
    }

    // 게시물 작성 페이지
    public int writePost(PostVO vo) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        int result = mapper.writePost(vo);

        if (result == 1) {
            session.commit();
            System.out.println("새 게시물 저장 성공");

        } else {
            System.out.println("새 게시물 저장 실패");
        }

        session.close();
        return result;
    }

    // 게시물 수정 기능
    public int updatePost(PostVO vo) {

        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        int result = mapper.updatePost(vo);
        
        if (result == 1) {
            session.commit();
            System.out.println("게시물 수정 성공");
            
        } else {
            System.out.println("게시물 수정 실패");
        }

        session.close();
        return result;
    }
    
    public int deletePost(String postNo) {
        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        int result = mapper.deletePost(postNo);

        if (result == 1) {
            session.commit();
            System.out.println("게시물 삭제 성공");

        } else {
            System.out.println("게시물 삭제 실패");
        }

        session.close();
        return result;
    }

    public List<Integer> selectChPost(String memId) {
        SqlSession session = MyBatisSessionFactory.getSqlSession();
        PostMapper mapper = session.getMapper(PostMapper.class);

        List<Integer> chPost = mapper.selectChPost(memId);

        session.close();
        return chPost;
    }
}
