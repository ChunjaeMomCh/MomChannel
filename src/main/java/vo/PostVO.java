package vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter @Setter
@ToString
public class PostVO {

    private int postNo;  // 게시글 번호
    private String memId;  // 작성자 아이디
    private String postTitle;  // 게시글 제목
    private String postContent;  // 게시글 내용
    private Date postDate;  // 게시글 작성일
    private String postRegion;  // 게시글의 지역별 태그
    private int postGrade;  // 게시글의 학년별 태그
    private String postThumbnail;  // 게시글 썸네일
    private int postHit;  // 게시글 조회수
    private int postLikes;  // 게시글 좋아요 수
    private String ofile;  // 원본 파일명
    private String sfile;  // 저장된 파일명
}
