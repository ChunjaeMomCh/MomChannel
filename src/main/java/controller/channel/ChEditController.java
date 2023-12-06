package controller.channel;


import dao.ChannelDAO;
import dao.MemberDAO;
import org.apache.catalina.util.ToStringUtil;
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

@WebServlet("/ch/chedit.do")
public class ChEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String memId = req.getParameter("memId");
        ChannelDAO cdao = new ChannelDAO();
        ChannelVO cvo = cdao.selectChannelById(memId);
        req.setAttribute("cvo", cvo);
        req.getRequestDispatcher("/view/channel/chEdit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        String channelTitle = req.getParameter("channelTitle");
        String memId = req.getParameter("memId");
        String channelInfo = req.getParameter("channelInfo");
//        int channelSub = Integer.parseInt(req.getParameter("channelSub"));


        ChannelVO cvo = new ChannelVO();
        cvo.setMemId(memId);
        cvo.setChannelTitle(channelTitle);
        cvo.setChannelInfo(channelInfo);
//        cvo.setChannelSub(channelSub);



        // 로그인 된 아이디는 session에서 가져옴
        HttpSession session = req.getSession();
        String sMemId = (String) session.getAttribute("memId");

        // DB에 수정 내용 반영
        ChannelDAO cdao = new ChannelDAO();


        System.out.println("aaaa"+memId);
        System.out.println("bbbb"+sMemId);
        //작성자와 현재 로그인된 아이디가 일치하는지 확인후 수정
        if (memId.equals(sMemId)){
            int result = cdao.updateChannel(cvo);
            // 성공 or 실패?
            if (result == 1) {  // 수정 성공
//            session.removeAttribute("pass");
//                resp.sendRedirect("./chview.do?channelTitle="+channelTitle);
                JSFunction.alertLocation(resp, "채널 수정 완료.",
//                        "./chview.do?channelTitle="+channelTitle);
                        "./chview.do?memId="+memId);
            }
            else {  // 수정 실패
                JSFunction.alertBack(resp, "수정하지 못했습니다.");
            }
        }else {
            JSFunction.alertBack(resp, "이 채널의 주인이 아닙니다.");
        }

    }
}
