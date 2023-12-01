<<<<<<< HEAD
/**
 * 파일 업로드, 다운로드 및 삭제를 위한 유틸리티 메서드
 * */

package utils;

=======
package utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
>>>>>>> 0388693b94bcf03c9855a58d20cfe9451f3560a4

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
<<<<<<< HEAD
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileUtil {
    // 파일 업로드
    public static String uploadFile(HttpServletRequest req, String sDirectory)
        throws ServletException, IOException {

        Part part = req.getPart("ofile");  // request 내장 객체의 getPart() 메서드로 file 타입으로 전송된 폼값을 받아 Part 객체에 저장한다.
        String partHeader = part.getHeader("content-disposition");  // Part 객체에서 헤더값을 읽어온다.

        // 헤더의 내용에서 파일명을 추출한다.
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");  // 더블쿼테이션을 제거

        // 파일명이 빈 값이 아니라면 디렉터리에 파일을 저장한다.
        if (!originalFileName.isEmpty()) {
            part.write(sDirectory + File.separator +originalFileName);
        }

        // 저장된 원본파일명을 반환한다.
        return originalFileName;
    }  // uploadFile()

    // 파일명 변경
    public static String renameFile(String sDirectory, String fileName) {
        // 새로운 파일명을 생성한다.
        String ext = fileName.substring(fileName.lastIndexOf("."));  // 원본파일명에서 확장자를 잘라낸다.
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());  // 생성할 문자열의 형식 : "현재날짜_시간"
        String newFileName = now + ext;  // 확장자와 파일명을 연결하여 새로운 파일명을 생성

        // 원본파일과 새로운파일에 대한 File객체를 생성한 후 파일명을 변경한다.
=======

public class FileUtil {

    //파일 업로드
    public static String uploadFile(HttpServletRequest req, String sDirectory)
            throws ServletException, IOException {
        Path saveDirectoryPath = Paths.get(sDirectory);
        Files.createDirectories(saveDirectoryPath);

        System.out.println("aaaaaaaaaaaaaa");

        //Part 객체를 통해 서버로 전송된 파일명 읽어오기
        Part part = req.getPart("memImg");

        System.out.println("bbbbbbbbbbbbb");

        //Part 객체의 헤더값 중 content-disposition 읽어오기
        String partHeader = part.getHeader("content-disposition");
        //출력결과 => form-data; name="attachedFile"; filename="파일명.jpg"
        System.out.println("partHeader="+ partHeader);

        //헤더값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");

        System.out.println("ccccccccc");

        String originalFileName = phArr[1].trim().replace("\"", "");

        System.out.println("dddddddd");


        //전송된 파일이 있다면 디렉토리에 저장
        if (!originalFileName.isEmpty()) {
            part.write(sDirectory+ File.separator +originalFileName);
        }

        System.out.println("eeeeeeeeeee");

        //원본 파일명 반환
        return originalFileName;
    }

    //파일명 변경
    public static String renameFile(String sDirectory, String fileName) {
        //원본파일의 확장자 잘라내기
        String ext = fileName.substring(fileName.lastIndexOf("."));
        //날짜 및 시간을 통해 파일명 생성
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
        //"날짜_시간.확장자" 형태의 새로운 파일명 생성
        String newFileName = now + ext;

        //기존 파일명을 새로운 파일명으로 변경
>>>>>>> 0388693b94bcf03c9855a58d20cfe9451f3560a4
        File oldFile = new File(sDirectory + File.separator + fileName);
        File newFile = new File(sDirectory + File.separator + newFileName);
        oldFile.renameTo(newFile);

<<<<<<< HEAD
        // 변경된 파일명을 반환한다.
        return newFileName;
    }  // renameFile()
    
    /* 파일을 다운로드하는 메서드 */
    // 명시한 파일을 찾아 다운로드한다.
    // request, response 내장 객체와 디렉터리명, 저장된 파일명, 원본 파일명을 매개변수로 전달받는다.
    public static void download(HttpServletRequest req, HttpServletResponse resp,
                                String directory, String sfileName, String ofileName) {
        // 서블릿에서 디렉터리의 물리적 경로를 얻어온다.
        String sDirectory = req.getServletContext().getRealPath(directory);
        
=======
        //변경된 파일명 반환
        return newFileName;
    }

    //파일 다운로드
    public static void download(HttpServletRequest req, HttpServletResponse resp,
                                String directory, String sfileName, String ofileName) {
        String sDirectory = req.getServletContext().getRealPath(directory);
>>>>>>> 0388693b94bcf03c9855a58d20cfe9451f3560a4
        try {
            // 파일을 찾아 입력 스트림 생성
            File file = new File(sDirectory, sfileName);
            InputStream iStream = new FileInputStream(file);
<<<<<<< HEAD
            
            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");  // 클라이언트의 웹 브라우저의 종류를 알아온다.
            
            if (client.indexOf("WOW64") == -1) {  // 클라이언트의 웹 브라우저가 IE일 경우
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
                
            } else {  // IE 이외의 웹 브라우저일 경우
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }
            
=======

            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }

>>>>>>> 0388693b94bcf03c9855a58d20cfe9451f3560a4
            // 파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition",
                    "attachment; filename=\"" + ofileName + "\"");
            resp.setHeader("Content-Length", "" + file.length() );

<<<<<<< HEAD
//            out.clear();  // 출력 스트림 초기화
=======
            //out.clear();  // 출력 스트림 초기화
>>>>>>> 0388693b94bcf03c9855a58d20cfe9451f3560a4

            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream oStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
<<<<<<< HEAD
            byte b[] = new byte[(int) file.length()];

            int readBuffer = 0;

=======
            byte b[] = new byte[(int)file.length()];
            int readBuffer = 0;
>>>>>>> 0388693b94bcf03c9855a58d20cfe9451f3560a4
            while ( (readBuffer = iStream.read(b)) > 0 ) {
                oStream.write(b, 0, readBuffer);
            }

<<<<<<< HEAD
            // 입/출력 스트림 닫기
            iStream.close();
            oStream.close();

        } catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();

        } catch (Exception e) {
            System.out.println("예외가 발생하였습니다.");
            e.printStackTrace();

        }  // try ~ catch
    }  // download()   

    // 지정한 위치의 파일을 삭제한다.
    public static void deleteFile(HttpServletRequest req,
                                  String directory, String filename) {
        // 파일이 저장된 디렉터리의 물리적 경로를 얻어온다.
        String sDirectory = req.getServletContext().getRealPath(directory);
        // 경로와 파일명을 결합하여 파일 객체를 생성한다.
        File file = new File(sDirectory + File.separator + filename);

        // 경로에 파일이 존재하면 삭제한다.
=======
            // 입/출력 스트림 닫음
            iStream.close();
            oStream.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();
        }
        catch (Exception e) {
            System.out.println("예외가 발생하였습니다.");
            e.printStackTrace();
        }
    }

    //파일 삭제
    public static void deleteFile(HttpServletRequest req,
                                  String directory, String filename) {
        String sDirectory = req.getServletContext().getRealPath(directory);
        File file = new File(sDirectory + File.separator + filename);
>>>>>>> 0388693b94bcf03c9855a58d20cfe9451f3560a4
        if (file.exists()) {
            file.delete();
        }
    }
<<<<<<< HEAD

}  // class
=======
}
>>>>>>> 0388693b94bcf03c9855a58d20cfe9451f3560a4
