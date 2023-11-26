package dao;

import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.PostMapper;
import org.apache.ibatis.session.SqlSession;
import vo.PostVO;

import java.util.List;
import java.util.Map;

public class PostDAO {


    // 게시글 목록 불러오기
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
}
