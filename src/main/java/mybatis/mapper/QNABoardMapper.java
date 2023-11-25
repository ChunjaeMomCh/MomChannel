package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.QNABoardVO;

import java.util.List;
import java.util.Map;

@Mapper
public interface QNABoardMapper {
    int selectCount(Map<String, Object> map);

    List<QNABoardVO> selectListPageWithPaging(Map<String, Object> map);

    int insertWrite(QNABoardVO vo);

    QNABoardVO selectView(String qnoNo);

    int confirmPassword(Map<String, String> map);

    int deletePost(String qnoNo);

    int updatePost(QNABoardVO vo);
}
