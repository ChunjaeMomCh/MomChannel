package utils;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import java.io.PrintWriter;

public class JSFunction {

    // 메시지 알림창을 띄운 후 명시한 URL로 이동한다.
    /* 매개변수
     * msg : 알림창에 띄울 메시지
     * url : 알림창을 닫은 후 이동할 페이지의 URL
     * out : 자바스크립트 코드를 삽입할 출력 스트림
     * */
    public static void alertLocation(String msg, String url, JspWriter out) {
        try {
            String script = "<script>"  // 삽입할 자바스크립트 코드
                    + "    alert('" + msg + "');"
                    + "    location.href='" + url + "';"
                    + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }

    public static void alertLocation(HttpServletResponse resp, String msg, String url) {
        try {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();
          
            String script = "<script>"
                    + "    alert('" + msg + "');"
                    + "    location.href='" + url + "';"
                    + "</script>";
            writer.print(script);

            writer.flush();
            writer.close();
        }
        catch (Exception e) {}
    }

  // 메시지 알림창을 띄운 후 이전 페이지로 돌아간다.
  // 호출자가 URL을 지정할 수 없고, 무조건 이전 페이지로 이동한다.  
  public static void alertBack(HttpServletResponse resp, String msg) {
        try {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            String script = "<script>"
                    + "    alert('" + msg + "');"
                    + "    history.back();"
                    + "</script>";
            writer.print(script);
        }
        catch (Exception e) {}
    }
    public static void idCheck(HttpServletResponse resp, String msg) {
        try {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            String script = "<script>"
                    + "    alert('" + msg + "');"
                    + "    history.back();"
                    + "</script>";
            writer.print(script);
        }
        catch (Exception e) {}
    }
}

