package pjs.shop.music;

import java.util.Date;

public class MusicVo {

    private int s_num, count, price;
    private String title, id, writer, lyricist, lyric, singer, save_name, origin_name, cover, genre, play_time,album ; 
    private Date reg_date;

    public int getS_num() {
        return this.s_num;
    }

    public void setS_num(int s_num) {
        this.s_num = s_num;
    }

    public int getCount() {
        return this.count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPrice() {
        return this.price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getWriter() {
        return this.writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
    public String getAlbum() {
        return this.album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public String getLyricist() {
        return this.lyricist;
    }

    public void setLyricist(String lyricist) {
        this.lyricist = lyricist;
    }

    public String getLyric() {
        return this.lyric;
    }

    public void setLyric(String lyric) {
        this.lyric = lyric;
    }

    public String getSinger() {
        return this.singer;
    }

    public void setSinger(String singer) {
        this.singer = singer;
    }

    public String getSave_name() {
        return this.save_name;
    }

    public void setOrigin_name(String origin_name) {
        this.origin_name = origin_name;
    }

    public String getOrigin_name() {
        return this.origin_name;
    }

    public void setSave_name(String save_name) {
        this.save_name = save_name;
    }

    public String getCover() {
        return this.cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getGenre() {
        return this.genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getPlay_time() {
        return this.play_time;
    }

    public void setPlay_time(String play_time) {
        this.play_time = play_time;
    }

    public Date getReg_date() {
        return this.reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
    

}
