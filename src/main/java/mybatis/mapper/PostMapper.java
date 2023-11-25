package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.PostVO;

import java.util.ArrayList;
import java.util.Map;

@Mapper
public interface PostMapper {
    List<PostVO> showPosts(Map<String, Object> map);
}
