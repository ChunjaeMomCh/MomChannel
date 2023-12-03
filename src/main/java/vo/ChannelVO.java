package vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChannelVO {
    private String memId;
    private String channelTitle;
    private String channelInfo;
    private int postNo;
    private int channelSub;

}
