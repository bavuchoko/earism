package pjs.shop.music;

import java.io.File;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class FileUploader{
    private FileUploader(){}
    private static FileUploader instance =new FileUploader();
    public static FileUploader getInstance(){
        return instance;
    }

    MusicDAO dao =MusicDAO.getInstance();
    
    String musicPath ="/music";
    String coverPath ="/cover";
    @RequestMapping(value = "/fileUploader.do")
    public void upload(@RequestParam("songfile") MultipartFile music, @RequestParam("album_artwork") MultipartFile cover, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        HttpSession session =request.getSession();
        String id =(String)session.getAttribute("id");
        String title =request.getParameter("title");
        String album =request.getParameter("album");
        String writer =request.getParameter("writer");
        String lyricist =request.getParameter("lyricist");
        String singer =request.getParameter("singer");
        String genre =request.getParameter("genre");
        int price =Integer.parseInt(request.getParameter("price"));



        ServletContext context =request.getServletContext();
      //  System.out.println(files.get(0).getContentType());   >>  imgae[jped]
        String musicsavePath =context.getRealPath(musicPath);
        String coversavePath =context.getRealPath(coverPath);

        
        //서버에 파일 저장 하기 위한 폴더/파일명 겹치지 않게 만들어주기  
        String musicName = music.getOriginalFilename();
        String coverName = cover.getOriginalFilename();
        URLEncoder.encode(musicName, "UTF-8"); 
        URLEncoder.encode(coverName, "UTF-8"); 
        String savedMusic =fileRename();
        String savedCover =picRename();
        String PathtoMusic = musicsavePath + "/" + savedMusic;
        String PathtoCover = coversavePath + "/" + savedCover;
        File musicFile =new File(PathtoMusic);
        File coverFile =new File(PathtoCover);
        
            //파일 저장.
        music.transferTo(musicFile);  
        cover.transferTo(coverFile);
           
            //DB에 넣기
        MusicVo vo =new MusicVo(); 
        vo.setId(id);
        vo.setTitle(title);
        vo.setAlbum(album);
        vo.setWriter(writer);
        vo.setLyricist(lyricist);
        vo.setPrice(price);
        vo.setSinger(singer);
        vo.setGenre(genre);
        vo.setCover(savedCover);
        vo.setSave_name(savedMusic);
        vo.setOrigin_name(musicName);
        dao.insert(vo);
        response.sendRedirect("/publisher.do");
    }


    public String fileRename(String originalName) throws Exception{
        //uuid 생성< Unique Universal Identifier)
        UUID uuid =UUID.randomUUID();
        //랜덤생성+파일이름
        String savedName =uuid.toString()+"_"+originalName;
        //저장;
        return savedName;
    }


    public String fileRename() throws Exception{
        //uuid 생성< Unique Universal Identifier)
        UUID uuid =UUID.randomUUID();
        //랜덤생성+파일이름
        String savedName =uuid.toString()+"_"+(int)((Math.random()*10000)%10)+".mp3";
        //저장;
        return savedName;
    }
    public String picRename() throws Exception{
        //uuid 생성< Unique Universal Identifier)
        UUID uuid =UUID.randomUUID();
        //랜덤생성+파일이름
        String savedName =uuid.toString()+"_"+(int)((Math.random()*10000)%10);
        //저장;
        return savedName;
    }

}

