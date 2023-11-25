package dao;

import mybatis.mapper.PostMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.PostVO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class PostDAO {

    SqlSessionFactory factory;

    // 게시글 목록 불러오기
    public List<PostVO> showPosts(Map<String, Object> map) {

        SqlSession session = factory.openSession();
            PostMapper mapper = session.getMapper(PostMapper.class);
            List<PostVO> postList = mapper.showPosts(map);

        return postList;
    }

}
