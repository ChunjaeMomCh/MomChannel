package controller.member;

import dao.MemberDAO;
import utils.FileUtil;
import vo.MemberVO;
import utils.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/member/myinfoedit.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)
public class MyPageEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String memId = req.getParameter("memId");
        MemberDAO dao = new MemberDAO();
        MemberVO mvo = dao.selectMember(memId);
        req.setAttribute("mvo", mvo);
        req.getRequestDispatcher("/view/member/myPageEdit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String saveDirectory = req.getServletContext().getRealPath("/Uploads");

        System.out.println(saveDirectory);

        // 파일 업로드
        String originalFileName = "";
        try {
            originalFileName = FileUtil.uploadFile(req, saveDirectory);
        }
        catch (Exception e) {
            JSFunction.alertBack(resp, "파일 업로드 오류입니다.");
            return;
        }

        // 2. 파일 업로드 외 처리 =============================
        // 수정 내용을 매개변수에서 얻어옴
        String prevMemImg = req.getParameter("memImg");
        String prevMemSImg = req.getParameter("memSImg");
        String memId = req.getParameter("memId");
//        String memName = req.getParameter("memName");
        String memRegion = req.getParameter("memRegion");
        String memAddr = req.getParameter("memAddr");
        String memChildGrade = req.getParameter("memChildGrade");
        String memPhone = req.getParameter("memPhone");
        String memEmail = req.getParameter("memEmail");

        String addr = null;
        if (req.getParameter("roadAddr")==null){
            addr = req.getParameter("postCode").concat("/").concat(req.getParameter("roadAddr")).concat("/").concat(req.getParameter("detailAddr"));
        }else {
            addr = req.getParameter("postCode").concat("/").concat(req.getParameter("jibunAddr")).concat("/").concat(req.getParameter("detailAddr"));
        }


        // 로그인 된 아이디는 session에서 가져옴
        HttpSession session = req.getSession();
        String sMemId = (String) session.getAttribute("memId");

        MemberVO mvo = new MemberVO();
//        mvo.setMemImg(memImg);
//        mvo.setMemSImg(memSImg);
        mvo.setMemId(memId);
//        mvo.setMemName(memName);
        mvo.setMemRegion(memRegion);
        mvo.setMemAddr(addr);
        mvo.setMemChildGrade(Integer.parseInt(memChildGrade));
        mvo.setMemPhone(memPhone);
        mvo.setMemEmail(memEmail);


        // 원본 파일명과 저장된 파일 이름 설정
        if (originalFileName != null && !originalFileName.equals("")) {
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);

            mvo.setMemImg(originalFileName);  // 원래 파일 이름
            mvo.setMemSImg(savedFileName);  // 서버에 저장된 파일 이름

            // 기존 파일 삭제
            FileUtil.deleteFile(req, "/Uploads", prevMemSImg);
        }
        else {
            // 첨부 파일이 없으면 기존 이름 유지
            mvo.setMemImg(prevMemImg);
            mvo.setMemSImg(prevMemSImg);
        }


        // DB에 수정 내용 반영
        MemberDAO dao = new MemberDAO();

        //작성자와 현재 로그인된 아이디가 일치하는지 확인후 수정
        if (memId.equals(sMemId)){
            int result = dao.updateMember(mvo);
            // 성공 or 실패?
            if (result == 1) {  // 수정 성공
//            session.removeAttribute("pass");
//                resp.sendRedirect("../member/myinfo.do");
                JSFunction.alertLocation(resp, "채널 수정 완료.",
                        "./member/myinfo.do");
            }
            else {  // 수정 실패
                JSFunction.alertBack(resp, "수정하지 못했습니다.");
            }
        }else {
            JSFunction.alertBack(resp, "이 글의 작성자가 아닙니다.");
        }
    }
}