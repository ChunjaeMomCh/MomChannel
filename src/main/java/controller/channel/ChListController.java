package controller.channel;

import dao.ChannelDAO;
import dao.MemberDAO;
import dao.QNABoardDAO;
import utils.BoardPage;
import vo.ChannelVO;
import vo.MemberVO;
import vo.QNABoardVO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/ch/chlist.do")
public class ChListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ChannelDAO cdao = new ChannelDAO();
        MemberDAO dao = new MemberDAO();
        // 뷰에 전달할 매개변수 저장용 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();


        int totalCount = cdao.selectChCount(map);  // 게시물 개수

        List<ChannelVO> chLists = cdao.selectChList(map);  // 게시물 목록 받기
//        dao.close(); // DB 연결 닫기
        List<MemberVO> memLists = dao.selectMemList();

        map.put("totalCount", totalCount);


        // 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
        req.setAttribute("memLists",memLists);
        req.setAttribute("chLists", chLists);
        req.setAttribute("map", map);
        req.getRequestDispatcher("/view/channel/chList.jsp").forward(req, resp);
    }
}
