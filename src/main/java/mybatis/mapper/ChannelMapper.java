package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.ChannelVO;

@Mapper
public interface ChannelMapper {
    int insertChannel(String memId);

    ChannelVO selectChannel(String memId);

    void subPlus(String memId);
    void subMinus(String memId);

}
