package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.CommentVO;
import vo.QNABoardVO;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommentMapper {

    List<CommentVO> selectCommentList(String postNo);

    int insertWrite(CommentVO vo);
    int insertWriteAnswer(QNABoardVO vo);

    QNABoardVO selectView(String qnoNo);

    int confirmPassword(Map<String, String> map);

    int deletePost(String qnoNo);

    int updatePost(QNABoardVO vo);
}
