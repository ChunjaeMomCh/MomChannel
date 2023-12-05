package mybatis.mapper;

import java.util.Map;

public interface SubMapper {
    int subCheck(Map<String, String> map);
    int subUp(Map<String, String> map);
    int subDown(Map<String, String> map);
}
