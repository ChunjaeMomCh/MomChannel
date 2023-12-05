package vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Getter
@Setter
@ToString
public class CommentVO {
    private int commentNo;
    private int postNo;
    private String memId;
    private LocalDate commentDate;
    private String commentTxt;
}
