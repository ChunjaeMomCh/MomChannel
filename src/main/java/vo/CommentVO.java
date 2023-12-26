package vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@ToString
public class CommentVO {
    private int commentNo;
    private int postNo;
    private String memId;
    private Date commentDate;
    private String commentTxt;
}
