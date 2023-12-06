package controller.channel;

import dao.*;
import utils.JSFunction;
import vo.ChannelVO;
import vo.MemberVO;
import vo.PostVO;
import vo.QNABoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/ch/chview.do")
public class ChViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 게시물 불러오기
        ChannelDAO cdao = new ChannelDAO();
//        String channelTitle = req.getParameter("channelTitle");
        String chMemId = req.getParameter("memId");


//        ChannelVO cvo = cdao.selectChannel(channelTitle);
        ChannelVO cvo = cdao.selectChannelById(chMemId);
//        String chMemId = cvo.getMemId();
        String channelTitle = cvo.getChannelTitle();
        PostDAO pdao = new PostDAO();


        SubDAO sdao = new SubDAO();
        HttpSession session = req.getSession();
        String memId = (String) session.getAttribute("memId");
//        List<Integer> chPosts = pdao.selectChPost(channelTitle);

        List<PostVO> postLists = pdao.showPostsByCh(chMemId);

        Map<String, String> map = new HashMap<>();
        map.put("memId", memId);
        map.put("channelTitle", channelTitle);

        req.setAttribute("cvo", cvo);
        req.setAttribute("postLists", postLists);

        if (memId == null||memId.equals(chMemId)){
            req.getRequestDispatcher("/view/channel/chView.jsp").forward(req, resp);
        }else {
            int check = sdao.subCheck(map);
            req.setAttribute("check",check);
            req.getRequestDispatcher("/view/channel/chView.jsp").forward(req, resp);
        }

//        if (memId!= null){
//
//        } else {
//            req.getRequestDispatcher("/view/channel/chView.jsp").forward(req, resp);
//        }




    }
}
