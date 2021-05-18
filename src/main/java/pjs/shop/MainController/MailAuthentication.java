package pjs.shop.MainController;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pjs.shop.user.UserDAO;

import pjs.shop.util.Encoder;
import pjs.shop.util.Gmail;

@Controller
public class MailAuthentication {
    UserDAO us =UserDAO.getIntance();
    @RequestMapping(value = "/sendmail.do", method = {RequestMethod.GET, RequestMethod.POST})
    public void sendmail(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("UTF-8");
        HttpSession session =request.getSession();
        String to =(String) session.getAttribute("id");
        Encoder encode =Encoder.getInstance();
        // String host="192.168.1.41:7070";
        String from="greatparkjs8501@gmail.com";
        String subject="가입인증을 위한 인증메일 입니다.";
        // String content ="<p>다음 링크에 접속하여 이메일 인증을 진행하세요</p><form method='post' action='192.168.1.41:7070/emailcheckAction.do'><input type='hidden' class='code' name='code' value='"+encode.encoding(to)+"'><a href='http://192.168.1.41:7070/emailcheckAction.do'><input type='submit' value='이메일 인증하기'></a></form>";
        // String content ="<p>다음 링크에 접속하여 인증을 진행해 주세요</br> <a href='http://localhost:7070/emailcheckAction.do' rel='noreferrer noopener' target='_blank'>http://localhost:7070/emailcheckAction.do</a> </br> 가입해 주셔서 감사합니다.</p>";
        String content ="<!DOCTYPE html>";
        content +="<html>";
        content +="<h1>Earism 가입 인증 메일입니다 아래 링크를 클릭해서 인증 절차를 진행해 주십시오.</h1>";
        content +="<a style=\"color: #FFF; text-decoration: none; text-align: center;\"href=\"http://localhost:7070/emailcheckAction.do?code=" + encode.encoding(to) + "\" target=\"_blank\">";
        content +="<p style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background: #fa233b; line-height: 45px; vertical-align: middle; font-size: 16px;\">메일 인증</p>";
        content += "</a><div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div></div></body></html>";
        
        
        
        
        Properties p =new Properties();
        p.put("mail.smtp.user", from);
        p.put("mail.smtp.host", "smtp.googlemail.com");
        p.put("mail.smtp.port", "465");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.debug", "true");
        p.put("mail.smtp.socketFactory.port", "465");
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        p.put("mail.smtp.socketFactory.fallback", "false");

        try{
            Authenticator auth =new Gmail();
            Session ses =Session.getInstance(p, auth);
            ses.setDebug(true);
            MimeMessage msg =new MimeMessage(ses);
            msg.setSubject(subject);
            Address fromAddr =new InternetAddress(from);
            msg.setFrom(fromAddr);
            Address toAddr =new InternetAddress(to);
            msg.addRecipient(Message.RecipientType.TO, toAddr);
            msg.setContent(content, "text/html;charset=UTF-8");
            Transport.send(msg);
        }catch(Exception e){e.printStackTrace();}
        response.sendRedirect("/mailsended.do");
    }

    @RequestMapping(value = "/emailcheckAction.do", method = {RequestMethod.GET, RequestMethod.POST})
    public void emailcheckAction(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("UTF-8");
        String code =request.getParameter("code");
        HttpSession session =request.getSession();
        String id =(String)session.getAttribute("id");
        Encoder encode =Encoder.getInstance();
        // System.out.println(id);
        String email =encode.encoding(id);
        if(code.equals(email)){
            us.authDone(id);
            session.setAttribute("message", "이메일 인증이 완료되었습니다");
            session.setAttribute("auth", 'y');
            response.sendRedirect("/listener.do");
        }else{
            response.sendRedirect("/remail.do");
        
        }
    }

}
