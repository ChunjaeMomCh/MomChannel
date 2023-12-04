package controller.channel;

import dao.ChannelDAO;
import dao.MemberDAO;
import dao.SubDAO;
import utils.JSFunction;
import vo.ChannelVO;
import vo.MemberVO;

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
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDAO dao = new MemberDAO();
        ChannelDAO cdao = new ChannelDAO();
        SubDAO sdao = new SubDAO();
        HttpSession session = req.getSession();

        String memId = (String) session.getAttribute("memId");
        System.out.println(memId);
        MemberVO mvo = dao.selectMember(memId);
        ChannelVO cvo = cdao.selectChannel(memId);

        Map<String, String> map = new HashMap<>();
        map.put("memId", cvo.getMemId());
        map.put("channelTitle", cvo.getChannelTitle());
        int check = sdao.subCheck(map);

//        String ext = null, fileName =  mvo.getMemImg();
//        if(fileName!=null) {
//            ext = fileName.substring(fileName.lastIndexOf(".")+1);
//        }
//        String[] mimeStr = {"png","jpg","gif"};
//        List<String> mimeList = Arrays.asList(mimeStr);
//        boolean isImage = false;
//        if(mimeList.contains(ext)) {
//            isImage = true;
//        }

        // 게시물(vo) 저장 후 뷰로 포워드
        req.setAttribute("mvo",mvo);
        req.setAttribute("cvo",cvo);
        req.setAttribute("check",check);
//        req.setAttribute("isImage", isImage);
        req.getRequestDispatcher("/view/channel/chView.jsp").forward(req, resp);
    }
}
