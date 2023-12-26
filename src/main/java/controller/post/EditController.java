package controller.post;

import dao.PostDAO;
import utils.FileUtil;
import utils.JSFunction;
import vo.MemberVO;
import vo.PostVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/view/post/edit.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)
public class EditController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /* 요청명/서블릿 매핑 */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String postNo = req.getParameter("postNo");  // 수정할 게시물의 일련번호
        PostDAO dao = new PostDAO();
        PostVO vo = dao.viewPost(postNo);  // 기존 게시물 내용을 담은 DTO 객체
        HttpSession session = req.getSession();
        String sessionMemId = (String)session.getAttribute("memId");
        System.out.println("sessionMemId"+sessionMemId);
        System.out.println("getPostSFile"+vo.getPostSFile());


        // 현재 로그인된 아이디와 작성자가 일치하는지 확인
        if (sessionMemId.equals(vo.getMemId())) {
            req.setAttribute("vo", vo);  // 게시물 일련번호를 DTO 객체의 request 영역에 저장
            req.getRequestDispatcher(req.getContextPath() + "./Edit.jsp").forward(req, resp);  // Edit.jsp로 포워드
        }
        else {
            JSFunction.alertBack(resp, "이 글의 작성자가 아닙니다.");
        }
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
            System.out.println("originalFileName"+originalFileName);

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
        /*String prevThumbnail = req.getParameter("prevThumbnail");*/
        System.out.println("prevOfile"+prevOfile);
        System.out.println("prevSfile"+prevSfile);

        String memId = req.getParameter("memId");
        String postTitle = req.getParameter("postTitle");
        String postContent = req.getParameter("postContent");
        String postRegion = req.getParameter("postRegion");
        String postGrade = req.getParameter("postGrade");
        String postOFile = req.getParameter("postOFile");
        String postSFile = req.getParameter("postSFile");
        /*String postThumbnail = req.getParameter("postThumbnail");*/

        // 세션에서 로그인된 아이디를 받아온다.
        HttpSession session = req.getSession();
        MemberVO mvo = (MemberVO) session.getAttribute("loginMember");
        System.out.println(mvo);

        // DTO에 저장
        PostVO vo = new PostVO();
        vo.setMemId(memId);
        vo.setPostNo(Integer.parseInt(postNo));
        vo.setPostTitle(postTitle);
        vo.setPostContent(postContent);
        vo.setPostRegion(postRegion);
        vo.setPostGrade(postGrade);
        vo.setPostOFile(postOFile);
        vo.setPostSFile(postSFile);
        /*vo.setPostThumbnail(postThumbnail);*/

        // 첨부 파일이 있는 경우 원본 파일명과 저장된 파일 이름 설정
        if (originalFileName != "" && !originalFileName.equals("")) {
            String savedFileName = FileUtil.renameFile(saveDirectory,
                    originalFileName);

            vo.setPostOFile(originalFileName);  // 원래 파일 이름
            vo.setPostSFile(savedFileName);  // 서버에 저장된 파일 이름

            // 기존 파일 삭제
            FileUtil.deleteFile(req, "/Uploads", prevSfile);

        }
        /*
        else {
            if(prevOfile.equals("null")){
                prevOfile = "default_thumbnail.jpg";
                prevSfile = "default_thumbnail.jpg";
            }
            // 첨부 파일이 없으면 기존 이름 유지
            vo.setPostOFile(prevOfile);
            vo.setPostSFile(prevSfile);
            *//*vo.setPostThumbnail(prevThumbnail);*//*

        }
         */ // if ~ else

        // DB에 수정 내용 반영
        PostDAO dao = new PostDAO();
//        System.out.println(memId);
//        System.out.println(mvo.getMemId());

        int result = dao.updatePost(vo);
        // 성공/실패 여부에 따라 진행
        if (result == 1) {  // 수정 성공 => 해당 게시물의 상세 페이지에서 수정된 내용을 확인

            resp.sendRedirect(req.getContextPath() + "./view.do?postNo=" + postNo);  // 상세 보기 뷰로 이동해 수정된 내용을 확인시킨다.

        } else {  // 수정 실패
            JSFunction.alertBack(resp, "내용 수정에 실패했습니다. 수정 화면으로 돌아갑니다.");  // 수정 폼에서 다시 작성하도록 한다.
        }


    }  // doPost()
}
