package controller.channel;

import dao.ChannelDAO;
import dao.SubDAO;
import vo.ChannelVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/ch/subdown.do")
public class SubDownController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ChannelDAO cdao = new ChannelDAO();
        SubDAO sdao = new SubDAO();
        HttpSession session = req.getSession();

        String memId = (String) session.getAttribute("memId");
        ChannelVO cvo = cdao.selectChannel(memId);

        Map<String, String> map = new HashMap<>();
        map.put("memId", cvo.getMemId());
        map.put("channelTitle", cvo.getChannelTitle());

        cdao.subMinus(memId);
        sdao.subDown(map);

        resp.sendRedirect("../ch/chview.do");

    }
}
