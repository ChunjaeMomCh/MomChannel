package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.ChannelVO;
import vo.MemberVO;
import vo.QNABoardVO;

import java.util.List;
import java.util.Map;

@Mapper
public interface ChannelMapper {
    int insertChannel(String memId);

    ChannelVO selectChannel(String memId);

    void subPlus(String memId);
    void subMinus(String memId);

    int selectChCount(Map<String, Object> map);

    List<ChannelVO> selectChList(Map<String, Object> map);

}
