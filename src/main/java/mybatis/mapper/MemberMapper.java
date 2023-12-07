package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.ChannelVO;
import vo.MemberVO;

import java.util.List;
import java.util.Map;
@Mapper
public interface MemberMapper {
    MemberVO getMember(String memId);
    int memCheck(Map<String, String> map);
    int idCheck(String memId);
    int insertMember(MemberVO mvo);
    MemberVO selectMember(String memId);
    int updateMember(MemberVO mvo);
    int updateSign(MemberVO mvo);
    List<MemberVO> selectMemList();
}
