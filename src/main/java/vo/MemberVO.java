package vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
    private String memId;
    private String memName;
    private String memPw;
    private String memRegion;
    private String memAddr;
    private String memChildGrade;
    private String memPhone;
    private String memEmail;
    private String memImg;
}
