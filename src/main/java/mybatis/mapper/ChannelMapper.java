package mybatis.mapper;

import vo.ChannelVO;
import vo.MemberVO;

import java.util.Map;

public interface ChannelMapper {
    int insertChannel(String memId);

    ChannelVO selectChannel(String memId);

    void subPlus(String memId);
    void subMinus(String memId);

}
