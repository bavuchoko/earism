package pjs.shop.music;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pjs.shop.dbmanager.DBManager;
import pjs.shop.playlist.Playlist;

public class MusicDAO {
    private MusicDAO(){}
    private static MusicDAO instance =new MusicDAO();
    public static MusicDAO getInstance (){
        return instance;
    }
    DBManager dbm =DBManager.getInstance();

    //음악 업로드
    public int insert(MusicVo vo){
        int result =0;
        Connection conn =null;
        PreparedStatement pstmt = null;
        String sql="";
        if(vo.getLyricist()!=null||!vo.getLyricist().equals("")){
             sql="insert into music (title, id, writer, lyricist, singer, save_name, cover, genre, price, origin_name, album) values (?,?,?,?,?,?,?,?,?,?,?)";       
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getId());
            pstmt.setString(3, vo.getWriter());
            pstmt.setString(4, vo.getLyricist());
            pstmt.setString(5, vo.getSinger());
            pstmt.setString(6, vo.getSave_name());
            pstmt.setString(7, vo.getCover());
            pstmt.setString(8, vo.getGenre());
            pstmt.setInt(9, vo.getPrice());
            pstmt.setString(10, vo.getOrigin_name());
            pstmt.setString(11, vo.getAlbum());
            result =pstmt.executeUpdate();

        }catch(Exception e){e.printStackTrace();}
        finally{dbm.close(conn, pstmt);}
        }else{
            sql="insert into music (title, id, writer, singer, save_name, cover, genre, price, origin_name, album) values (?,?,?,?,?,?,?,?,?,?) ";  
            try{
                conn =dbm.getConnection();
                pstmt =conn.prepareStatement(sql);
                pstmt.setString(1, vo.getTitle());
                pstmt.setString(2, vo.getId());
                pstmt.setString(3, vo.getWriter());
                pstmt.setString(4, vo.getSinger());
                pstmt.setString(5, vo.getSave_name());
                pstmt.setString(6, vo.getCover());
                pstmt.setString(7, vo.getGenre());
                pstmt.setInt(8, vo.getPrice());
                pstmt.setString(9, vo.getOrigin_name());
                pstmt.setString(10, vo.getAlbum());
                result =pstmt.executeUpdate();
    
            }catch(Exception e){e.printStackTrace();
            }finally{dbm.close(conn, pstmt);}     
        }
        return result;
    }

//최신 곡 리스트

public ArrayList<MusicVo> selectList(HttpServletRequest request, HttpServletResponse response){
    Connection conn =null;
    PreparedStatement pstmt =null;
    ResultSet rs =null;
    String sql ="select * from music order by reg_date desc";
    ArrayList<MusicVo> voa =new ArrayList<MusicVo>();
    try{
        conn =dbm.getConnection();
        pstmt =conn.prepareStatement(sql);
        rs =pstmt.executeQuery();
        while(rs.next()){
            MusicVo vo =new MusicVo();
            vo.setS_num(rs.getInt("s_num"));
            vo.setTitle(rs.getString("title"));
            vo.setWriter(rs.getString("writer"));
            vo.setSinger(rs.getString("singer"));
            vo.setCover(rs.getString("cover"));
            vo.setGenre(rs.getString("genre"));
            vo.setAlbum(rs.getString("album"));
            vo.setSave_name(rs.getString("save_name"));
            vo.setPrice(rs.getInt("price"));
            voa.add(vo);
        }
    }catch(Exception e){e.printStackTrace();
    }finally{dbm.close(conn, pstmt, rs);}
    return voa;
}


//본인이 업로드한 곡 리스트

public ArrayList<MusicVo> selectMyList(HttpServletRequest request, HttpServletResponse response){
    Connection conn =null;
    PreparedStatement pstmt =null;
    ResultSet rs =null;
    HttpSession session =request.getSession();
    String id =(String)session.getAttribute("id");
    String sql ="select * from music where id ='"+id+"'  order by s_num desc ";
    ArrayList<MusicVo> voa =new ArrayList<MusicVo>();
    try{
        conn =dbm.getConnection();
        pstmt =conn.prepareStatement(sql);
        rs =pstmt.executeQuery();
        while(rs.next()){
            MusicVo vo =new MusicVo();
            vo.setS_num(rs.getInt("s_num"));
            vo.setTitle(rs.getString("title"));
            vo.setWriter(rs.getString("writer"));
            vo.setSinger(rs.getString("singer"));
            vo.setCover(rs.getString("cover"));
            vo.setGenre(rs.getString("genre"));
            vo.setAlbum(rs.getString("album"));
            vo.setPrice(rs.getInt("price"));
            voa.add(vo);
        }
    }catch(Exception e){e.printStackTrace();
    }finally{dbm.close(conn, pstmt, rs);}
    return voa;
}



// 구매한곡 리스트
    public ArrayList<MusicVo> selectPurchased(HttpServletRequest request, HttpServletResponse response){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        HttpSession session =request.getSession();
        String id =(String)session.getAttribute("id");
        String sql ="select a.s_num, a.purchase_time, b.title, b.writer,b.genre, b.singer, b.album, b.cover from purchase as a, music as b where a.id ='"+id+"' and a.s_num = b.s_num order by a.purchase_time desc ";
        ArrayList<MusicVo> voa =new ArrayList<MusicVo>();
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            while(rs.next()){
                MusicVo vo =new MusicVo();
                vo.setS_num(rs.getInt("s_num"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setSinger(rs.getString("singer"));
                vo.setCover(rs.getString("cover"));
                vo.setGenre(rs.getString("genre"));
                vo.setAlbum(rs.getString("album"));
                voa.add(vo);
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        return voa;
    }


    //단곡 구매하기
    public int insertPurchase(String id, int s_num){
        Connection conn =null;
        PreparedStatement pstmt =null;
        String sql ="insert into purchase (id, s_num) values (?,?)";
        int result =0;
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setInt(2, s_num);
            result =pstmt.executeUpdate();
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt);}
        return result;
    }

    //일괄 구매하기///////////////////////////////////////
    public void allPurchase(String id,  ArrayList<Integer> s_num){
        Connection conn =null;
        PreparedStatement pstmt =null;
        String sql ="insert into purchase (id, s_num) values ('"+id+"', ?)";
        for(int i=0; i<s_num.size(); i++){
            try{
                conn =dbm.getConnection();
                pstmt =conn.prepareStatement(sql);
                pstmt.setInt(1, s_num.get(i));
                pstmt.executeUpdate();
            }catch(Exception e){e.printStackTrace();
            }finally{dbm.close(conn, pstmt);}
        }
    }

    //장바구니 등록
    public int insertCart(String id, int s_num){
        
        
        Connection conn =null;
        PreparedStatement pstmt =null;
        String sql ="insert into cart (id, s_num) values (?,?)";
        int result =0;
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setInt(2, s_num);
            result =pstmt.executeUpdate();
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt);}
        return result;
    }

    //장바구니 출력
    public ArrayList<MusicVo> selectCart(String id){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select a.id, a.s_num, b.title, b.singer, b.album, b.cover, b.genre, b.price from cart as a, music as b where a.id ='"+id+"' and a.s_num = b.s_num order by a.cart_date desc";
        ArrayList<MusicVo> voa =new ArrayList<MusicVo>();
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            while (rs.next()){
                MusicVo vo =new MusicVo();
                vo.setId(rs.getString("id"));
                vo.setS_num(rs.getInt("s_num"));
                vo.setTitle(rs.getString("title"));
                vo.setSinger(rs.getString("singer"));
                vo.setAlbum(rs.getString("album"));
                vo.setCover(rs.getString("cover"));
                vo.setGenre(rs.getString("genre"));
                vo.setPrice(rs.getInt("price"));
                voa.add(vo);
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        return voa;
    }

    //장바구니 삭제
    public void deletCart(String id, ArrayList<Integer> s_num){
        Connection conn =null;
        PreparedStatement pstmt =null;
        String sql ="delete from cart where id = '"+id+"' and s_num = ?";
        for(int i=0; i<s_num.size(); i++){
            try{
                conn =dbm.getConnection();
                pstmt =conn.prepareStatement(sql);
                pstmt.setInt(1, s_num.get(i));
                pstmt.executeUpdate();
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt);}}
 
    }

    //음악검색
    public ArrayList<MusicVo> selectTitle(String search){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select s_num, title, singer, save_name, cover, genre, reg_date, album, price from music where title like '%"+search+"%' ";
        ArrayList<MusicVo> voa =new ArrayList<MusicVo>();
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            while (rs.next()){
                MusicVo vo =new MusicVo();
                vo.setS_num(rs.getInt("s_num"));
                vo.setTitle(rs.getString("title"));
                vo.setSinger(rs.getString("singer"));
                vo.setSave_name(rs.getString("save_name"));
                vo.setCover(rs.getString("cover"));
                vo.setGenre(rs.getString("genre"));
                vo.setReg_date(rs.getDate("reg_date"));
                vo.setAlbum(rs.getString("album"));
                vo.setPrice(rs.getInt("Price"));
                voa.add(vo);
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        return voa;
    }

            
    //가수검색
    public ArrayList<MusicVo> selectSinger(String search){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select s_num, title, singer, save_name, cover, genre, reg_date, album from music where title like '%"+search+"%' ";
        ArrayList<MusicVo> voa =new ArrayList<MusicVo>();
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            while (rs.next()){
                MusicVo vo =new MusicVo();
                vo.setS_num(rs.getInt("s_num"));
                vo.setTitle(rs.getString("title"));
                vo.setSinger(rs.getString("singer"));
                vo.setSave_name(rs.getString("save_name"));
                vo.setCover(rs.getString("cover"));
                vo.setGenre(rs.getString("genre"));
                vo.setReg_date(rs.getDate("reg_date"));
                vo.setAlbum(rs.getString("album"));
                voa.add(vo);
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        return voa;
    }


    //음원 파일명 받아오기
    public String getSaveName(int s_num){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select save_name from music where s_num = "+s_num;
        String save_name="";
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            while (rs.next()){
                save_name =rs.getString("save_name");
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        System.out.println(save_name);
        return save_name;
    }

    
    //추천 아티스트
    public ArrayList<MusicVo> recoArticstName(String id){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select count(*), singer from music where s_num in( select s_num from purchase where id = '"+id+"') group by singer order by count desc limit 5";
        ArrayList<MusicVo> voa =new ArrayList<MusicVo>();
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            while (rs.next()){
                MusicVo vo =new MusicVo();
                 vo.setSinger(rs.getString("singer"));
                
                 voa.add(vo);
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt, rs);}
        
        return voa;
    }

    public ArrayList<MusicVo> artist(ArrayList<MusicVo> voaa){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        ArrayList<MusicVo> voa =new ArrayList<MusicVo>();
        for(int i=0; i<voaa.size(); i++){
            String sql ="select cover, singer from music where singer = '"+voaa.get(i).getSinger()+"'order by reg_date desc limit 1";
            try{
                conn =dbm.getConnection();
                pstmt =conn.prepareStatement(sql);
                rs =pstmt.executeQuery();
                while (rs.next()){
                    MusicVo vo =new MusicVo();
                    vo.setSinger(rs.getString("singer"));
                    vo.setCover(rs.getString("cover"));
                    voa.add(vo);
                }
            }catch(Exception e){e.printStackTrace();
            }finally{dbm.close(conn, pstmt, rs);}
        }return voa;

    }

    //재생목록 만들기
    public void addList(String id, String listname){
        Connection conn =null;
        PreparedStatement pstmt =null;
        String sql ="insert into playlist (id, list_name) values (? ,?)";
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, listname);
            pstmt.executeUpdate();
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt);}
    }

    //재생목록 출력
    public ArrayList<Playlist> selectList(String id){
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs =null;
        String sql ="select a.list_name, a.id, a.s_num, a.reg_date, b.cover from playlist as a, music as b where a.id = '"+id+" ' and a.s_num=b.s_num order by reg_date desc";
        ArrayList<Playlist> pla =new ArrayList<Playlist>();
        try{
            conn =dbm.getConnection();
            pstmt =conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            while(rs.next()){
                Playlist pl =new Playlist();
                pl.setList_name(rs.getString("list_name"));
                pl.setId(rs.getString("id"));
                pl.setS_num(rs.getInt("s_num"));
                pl.setReg_date(rs.getDate("reg_date"));
                pl.setCover(rs.getString("cover"));
                pla.add(pl);
            }
        }catch(Exception e){e.printStackTrace();
        }finally{dbm.close(conn, pstmt);}
        System.out.println(pla.size());
        return pla;
    }

}