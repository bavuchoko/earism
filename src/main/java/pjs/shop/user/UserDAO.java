package pjs.shop.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import pjs.shop.dbmanager.DBManager;

import pjs.shop.util.Encoder;


public class UserDAO {
    private UserDAO(){}
    private static UserDAO instance =new UserDAO();
    public static UserDAO getIntance(){
        return instance;
    }
    DBManager dbm =DBManager.getInstance();
    Encoder encode =Encoder.getInstance();

    
    
    //아이디 중복확인
    public int duplicateChecker(String id){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select id from user where id = '"+id+"'";
        int result =0;
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            if(rs.next()){
               result =-1;
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        return result;
    }


    //가입
    public int join(UserVO vo){
        int result =0;
            if(duplicateChecker(vo.getId())!=-1){ //아이디 중복확인
                Connection conn =null;
                PreparedStatement pstmt = null;
                String sql ="insert into user (id, pw, nickname) values (?,?,?)";
                try{
                    conn =dbm.getConnection();
                    pstmt =conn.prepareStatement(sql);
                    pstmt.setString(1, vo.getId());
                    String passwd =encode.encoding(vo.getPw());//비밀번호 암호화
                    pstmt.setString(2, passwd);
                    pstmt.setString(3, vo.getNickname());
                    result =pstmt.executeUpdate();  //가입성공 1  기존재 아이디 -1   에러  0
                }catch(Exception e){result =0; e.printStackTrace(); 
                }finally{dbm.close(conn, pstmt);}
            }return result;
    }
    

    //로그인
    public int login(UserVO vo){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String inputpw =encode.encoding(vo.getPw());
        String id =vo.getId();
        int result =0;
        String sql ="select pw from user where id ='"+id+"'";
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString("pw")!=null){
                    if(rs.getString("pw").equals(inputpw)){
                        if(authChecker(id)==1){
                            result=2;  //로그인성공, 이메일인증완료
                        }else{
                            result=1;}  //로그인 성공
                }else{result =0;}}   //비밀번호 틀림
            }else{result = -1;}   //아이디 없음
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        return result;
    }

    //수정
    public void updateUser(String column, String value, String id){
        Connection conn =null;
        PreparedStatement pstmt = null;
        String sql ="update user set "+column+"=? where id = '"+id+"'";
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            if(column.equals("pw")){
                value =encode.encoding(value);
            }
            pstmt.setString(1, value);
            pstmt.executeUpdate();
        }catch(Exception e){e.printStackTrace();}
        finally{dbm.close(conn, pstmt);}
    }
    
    //메일인증
    public void authDone(String id){
        Connection conn =null;
        PreparedStatement pstmt = null;
        String sql ="update user set auth = 'y' where id = '"+id+"'";
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            pstmt.executeUpdate();
        }catch(Exception e){e.printStackTrace();}
        finally{dbm.close(conn, pstmt);}
    }

    //메일인증확인
    public int authChecker(String id){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select auth from user where id = '"+id+"'";
        int result =0;
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            if(rs.next()){
               if(rs.getString("auth").equals("y")){result=1;
                }else{result=0;}
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        return result;
    }

    //탈퇴
    public void deleteUser(UserVO vo){
        Connection conn =null;
        PreparedStatement pstmt =null;
        String sql ="delete from user where id ='"+vo.getId()+"'";

        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            pstmt.executeUpdate();
        }catch(Exception e){e.printStackTrace();}
    }

    //전체조회
    public UserVO selectUser(String id){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select * from user where id = '"+id+"'";
        UserVO  vo =new UserVO();
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            while(rs.next()){
                vo.setId(rs.getString("id"));
                vo.setPw(rs.getString("pw"));
                vo.setJoin_date(rs.getDate("join_date"));
                vo.setAuth(rs.getString("auth"));
                vo.setCredit1(rs.getString("credit1"));
                vo.setCredit2(rs.getString("credit2"));
                vo.setCredit3(rs.getString("credit3"));
                vo.setReco(rs.getInt("reco"));
                vo.setNickname(rs.getString("nickname"));
            }
        }catch(Exception e){e.printStackTrace();}
        
        return vo;
    }


    //신용카드 등록
    public int registcredit(String id, String cardnum){
        String target ="";
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select credit1, credit2, credit3 from user where id = '"+id+"'";
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            while(rs.next()){
              if(rs.getString("credit1").equals("미등록")){
                  target ="credit1";
              }else if(!rs.getString("credit1").equals("미등록") && rs.getString("credit2").equals("미등록")){
                  target ="credit2";
              }else if(!rs.getString("credit1").equals("미등록") && !rs.getString("credit2").equals("미등록") && !rs.getString("credit1").equals("미등록") && rs.getString("credit3").equals("미등록")){
                  target ="credit3";
              }
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        updateUser(target, cardnum, id);
        return 0;
    }

}
