package controller.post;

import dao.PostDAO;
import utils.FileUtil;
import utils.JSFunction;
import vo.PostVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/view/post/update.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)
public class UpdateController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /* 요청명/서블릿 매핑 */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String postNo = req.getParameter("postNo");  // 수정할 게시물의 일련번호

        PostDAO dao = new PostDAO();
        PostVO vo = dao.viewPost("postNo");  // 기존 게시물 내용을 담은 DTO 객체
        req.setAttribute("vo", vo);  // 게시물 일련번호를 DTO 객체의 request 영역에 저장
        req.getRequestDispatcher(req.getContextPath() + "../post/Update.jsp").forward(req, resp);  // Edit.jsp로 포워드
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 1. 파일 업로드 처리
        // 업로드 디렉터리의 물리적 경로 확인
        String saveDirectory = req.getServletContext().getRealPath("/Uploads");

        // 파일 업로드
        String originalFileName = "";

        try {
            originalFileName = FileUtil.uploadFile(req, saveDirectory);

            // 업로드 중 예외가 발생하면 경고창을 띄우고 글쓰기 페이지로 이동한다.
        } catch (Exception e) {
            JSFunction.alertBack(resp, "파일 업로드 오류입니다.");
            return;
        }

        // 2. 파일 업로드 외 처리 =====================================================
        // 매개변수로부터 수정 내용을 얻어 온다.
        String postNo = req.getParameter("postNo");
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");

//        String memId = req.getParameter("memId");
        String memId = "tester";
        String postTitle = req.getParameter("postTitle");
        String postContent = req.getParameter("postContent");
        String postRegion = req.getParameter("postRegion");
        String postGrade = req.getParameter("postGrade");

        // DTO에 저장
        PostVO vo = new PostVO();
        vo.setPostNo(Integer.parseInt(postNo));
        vo.setMemId(memId);
        vo.setPostTitle(postTitle);
        vo.setPostContent(postContent);
        vo.setPostRegion(postRegion);
        vo.setPostGrade(Integer.parseInt(postGrade));

        // 첨부 파일이 있는 경우 원본 파일명과 저장된 파일 이름 설정
        if (originalFileName != "" && !originalFileName.equals("")) {
            String savedFileName = FileUtil.renameFile(saveDirectory,
                    originalFileName);

            vo.setOfile(originalFileName);  // 원래 파일 이름
            vo.setSfile(savedFileName);  // 서버에 저장된 파일 이름

            // 기존 파일 삭제
            FileUtil.deleteFile(req, "/Uploads", prevSfile);

        } else {
            // 첨부 파일이 없으면 기존 이름 유지
            vo.setOfile(prevOfile);
            vo.setSfile(prevSfile);
        }  // if ~ else

        // DB에 수정 내용 반영
        PostDAO dao = new PostDAO();
        int result = dao.updatePost(vo);


        // 성공/실패 여부에 따라 진행
        if (result == 1) {  // 수정 성공
            resp.sendRedirect(req.getContextPath() + "/post/postview.do?postNo=" + postNo);  // 상세 보기 뷰로 이동해 수정된 내용을 확인시킨다.

        } else {  // 수정 실패
            JSFunction.alertLocation(resp, "내용 수정에 실패했습니다. 수정 화면으로 돌아갑니다.",
                    req.getContextPath() + "/post/update.do?postNo=" + postNo);  // 수정 폼에서 다시 작성하도록 한다.

        }  // if ~ else
    }  // doPost()
}
