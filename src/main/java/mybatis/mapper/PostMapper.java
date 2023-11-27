package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.PostVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface PostMapper {
    int selectCount(Map<String, Object> map);  // 검색 조건에 맞는 게시글을 불러온다.
    List<PostVO> selectListPage(Map<String, Object> map);  // 게시글 페이지 목록을 불러온다.
    List<PostVO> showPosts(Map<String, Object> map);  // 게시글 목록을 불러온다.
    PostVO viewPost(String postNo);  // 특정 게시물의 상세 보기 페이지를 불러온다.
    int writePost(HashMap<String, Object> map);  // 새 게시물을 작성한다.
}
