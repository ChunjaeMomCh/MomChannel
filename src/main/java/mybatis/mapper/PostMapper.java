package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.PostVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface PostMapper {
    int selectCount(Map<String, Object> map);  // 검색 조건에 맞는 게시글을 불러온다.
    int selectCountGrade(Map<String, Object> map);  // 검색 조건에 맞는 게시글을 불러온다.
    List<PostVO> selectListPage(Map<String, Object> map);  // 게시글 페이지 목록을 불러온다.
    List<PostVO> showPosts(Map<String, Object> map);  // 게시글 목록을 불러온다.

    List<PostVO> showPostsByRegion(Map<String, Object> map);  // 지역별 게시글 목록을 불러온다.
    List<PostVO> showPostsByGrade(Map<String, Object> map);  // 학년별 게시글 목록을 불러온다.
    PostVO viewPost(String postNo);  // 특정 게시물의 상세 보기 페이지를 불러온다.
    int updateVisitCount(String postNo);  // 상세 보기 시 조회수를 1 더한다.
    int writePost(PostVO vo);  // 새 게시물을 작성한다.
    int updatePost(PostVO vo);  // 게시물을 수정한다.
    int deletePost(String postNo);  // 게시물을 삭제한다.
    List<Integer> selectChPost(String memId);
    List<PostVO> showPostsByCh(String channelTitle);
    List<PostVO> showLatestPosts();
    List<PostVO> showTopPosts();
}
