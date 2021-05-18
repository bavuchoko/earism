package pjs.shop.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Pattern;

import pjs.shop.dbmanager.DBManager;



public class REC {
    private REC(){}
    private static REC instance =new REC();
    public static REC getInstance(){
        return instance;
    }   
    // 숫자 검사기
    public boolean isNumeric(String str) {
        return Pattern.matches("^[0-9]*$", str);
    }
    
    // 영어 검사기
    public boolean isAlpha(String str) {
        return Pattern.matches("^[a-zA-Z]*$", str);
    }
    
    // 숫자 혹은 영어 검사기
    public boolean isAlphaNumeric(String str) {
        return Pattern.matches("[a-zA-Z0-9]*$", str);
    }
    
    // 한국어 검사기
    public boolean isKorean(String str) {
        return Pattern.matches("[가-힣]*$", str);
    }
    
    // 대문자 검사기
    public boolean isUpper(String str) {
        return Pattern.matches("^[A-Z]*$", str);
    }
    
    // 소문자 검사기
    public boolean isDowner(String str) {
        return Pattern.matches("^[a-z]*$", str);
    }
    
    // 이메일 검사기
    public boolean isEmail(String str) {
        return Pattern.matches("^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$", str);
    }
    
    // URL 검사기 (Http, Https 제외)
    public boolean isURL(String str) {
        return Pattern.matches("^[^((http(s?))\\:\\/\\/)]([0-9a-zA-Z\\-]+\\.)+[a-zA-Z]{2,6}(\\:[0-9]+)?(\\/\\S*)?$",
                str);
    }  
    public int isExistID(String str){
        int result=0;
        DBManager dbm =DBManager.getInstance();
        Connection conn  =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select id from member where id ='"+str+"'";
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            if(rs.next()){
                result=1;
            }else{result=0;}
        }catch(Exception e){e.printStackTrace();}
        return result;
    }
}
