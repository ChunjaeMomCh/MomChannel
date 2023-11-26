package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.PostVO;

import java.util.List;
import java.util.Map;

@Mapper
public interface PostMapper {
    List<PostVO> showPosts(Map<String, Object> map);  // 게시글 목록을 불러온다.

    PostVO viewPost(String postNo);  // 특정 게시물의 상세 보기 페이지를 불러온다.
}
