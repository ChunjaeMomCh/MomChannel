package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface QNABoardMapper {
    int selectCount(Map<String, Object> map);
}
