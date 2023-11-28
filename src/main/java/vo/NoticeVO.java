package vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Getter
@Setter
@ToString
public class NoticeVO {
    private int noticeNo;
    private String noticeCategory;
    private String noticeTitle;
    private String noticeContent;
    private LocalDate noticeDate;
    private int noticeHit;
}
