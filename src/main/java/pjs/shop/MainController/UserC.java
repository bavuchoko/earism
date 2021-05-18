package pjs.shop.MainController;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pjs.shop.user.UserDAO;
import pjs.shop.user.UserVO;
import pjs.shop.util.REC;

@Controller
public class UserC {
    UserDAO dao =UserDAO.getIntance();
    REC rc =REC.getInstance();

    public UserVO getData(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
        request.setCharacterEncoding("UTF-8");
        UserVO vo =new UserVO();
        String id =request.getParameter("inputid");    
        if(rc.isEmail(id)){
            vo.setId(id);
            vo.setPw(request.getParameter("pw"));
            vo.setNickname(request.getParameter("nickname"));
            vo.setPwc(request.getParameter("pwc"));
        return vo;
        }
        else{return null;}
    }

    @RequestMapping(value = "login.do")
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException{
        UserVO vo =getData(request, response);
        HttpSession session =request.getSession();
        int result=0;
        if(vo!=null){

            //아이디나 비번 입력 안하거나 공백일 경우
            if( vo.getId()==null ||  vo.getPw()==null|| vo.getId().equals("")|| vo.getPw().equals("")){
                session.setAttribute("message", "아이디와 비밀번호를 확인해주세요");
                response.sendRedirect("/");
            }else{
                result =dao.login(vo);  // 1:로그인성공, 0:비밀번호 오류, -1:아이디 없음
                if(result==1){
                    session.setAttribute("id" , vo.getId());
                    session.setAttribute("auth" , "n");
                    response.sendRedirect("play.do");
                }else if(result==2){
                    session.setAttribute("id" , vo.getId());
                    session.setAttribute("auth" , "y");
                    response.sendRedirect("play.do");
                }else{
                    session.setAttribute("message","아이디와 비밀번호를 확인해주세요");
                    response.sendRedirect("/");
                }
            }
        }else{
            session.setAttribute("message", "아이디는 이메일 형식이어야 합니다.");
            response.sendRedirect("/");
        }
    }   
    
    @RequestMapping(value = "join.do")
    public void join(HttpServletRequest request, HttpServletResponse response) throws IOException{
        UserVO vo =getData(request, response);
        HttpSession session =request.getSession();
        int result=0;
        if(vo!=null){
            if( vo.getId()==null||vo.getId().equals("") ){
                session.setAttribute("message", "아이디를 입력해주세요");
                response.sendRedirect("/");
                
            }else if(vo.getPw()==null || vo.getPw().equals("")){
                session.setAttribute("message", "비밀번호를 입력해주세요");
                response.sendRedirect("/");

            }else if( vo.getPwc()==null||vo.getPwc().equals("")){
                session.setAttribute("message", "비밀번호 확인이 잘못되었습니다");
                response.sendRedirect("/");

            }else{
                result =dao.join(vo);
                if(result==1){
                    session.setAttribute("id", vo.getId());
                    response.sendRedirect("play.do");
                }else if(result==-1){
                    session.setAttribute("message", "이미 존재하는 아이디 입니다");
                    response.sendRedirect("/");
                }else{
                    session.setAttribute("message", "처리중 오류가 발생했습니다.");
                    response.sendRedirect("/");
                }
            }
        }else{
            session.setAttribute("message", "아이디는 이메일 형식이어야 합니다.");
            response.sendRedirect("/");
        }
  
    }
    
    @RequestMapping(value = "repw.do")
    public void repw(){

    }
    
    @RequestMapping(value = "logout.do")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session =request.getSession();
        session.invalidate();
        response.sendRedirect("/");
    }
    
    @RequestMapping(value = "resign.do")
    public void resign(){

    }

}
