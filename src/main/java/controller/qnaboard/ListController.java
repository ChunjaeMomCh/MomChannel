package controller.qnaboard;


import dao.QNABoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/qnaboard/list.do")
public class ListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QNABoardDAO qnadao = new QNABoardDAO();
        Map<String, Object> map = new HashMap<String, Object>();

        int totalCount = qnadao.selectCount(map);
        map.put("totalCount", totalCount);
        req.setAttribute("map", map);

        req.getRequestDispatcher("/view/QNABoard/qnaList.jsp").forward(req, resp);
    }
}
