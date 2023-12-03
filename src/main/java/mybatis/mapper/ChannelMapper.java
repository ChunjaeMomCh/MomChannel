package mybatis.mapper;

import vo.ChannelVO;
import vo.MemberVO;

public interface ChannelMapper {
    int insertChannel(String memId);

    ChannelVO selectChannel(String memId);
}
