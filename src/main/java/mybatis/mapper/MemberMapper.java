package mybatis.mapper;

import vo.MemberVO;

import java.util.Map;

public interface MemberMapper {
    MemberVO getMember(String memId);
    int memCheck(Map<String, String> map);
}
