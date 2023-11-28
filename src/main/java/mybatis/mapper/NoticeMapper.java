package mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import vo.NoticeVO;

import java.util.List;
import java.util.Map;

@Mapper
public interface NoticeMapper {
    int selectCount(Map<String, Object> map);
    List<NoticeVO> selectNoticeListWithPaging(Map<String, Object> map);
    NoticeVO selectNoticeView(String noticeNo);
    int insertNoticeWrite(NoticeVO vo);
    int deleteNotice(String noticeNo);
    int deleteNotice(NoticeVO vo);
}
