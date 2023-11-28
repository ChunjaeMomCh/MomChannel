package mybatis.mapper;

import vo.MemberVO;

import java.util.Map;

public interface MemberMapper {
    int memJoin(MemberVO vo);
    MemberVO memLogin(Map<String, String> map);
}
