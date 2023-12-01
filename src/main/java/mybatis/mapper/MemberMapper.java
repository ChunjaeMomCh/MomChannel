package mybatis.mapper;

import vo.MemberVO;
import vo.QNABoardVO;

import java.util.Map;

public interface MemberMapper {
    MemberVO getMember(String memId);
    int memCheck(Map<String, String> map);
    int idCheck(Map<String, String> map);
    int insertMember(MemberVO mvo);
    MemberVO selectMember(String memId);
    int updateMember(MemberVO mvo);
}
