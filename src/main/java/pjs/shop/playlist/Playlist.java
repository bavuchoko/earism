package pjs.shop.playlist;

import java.sql.Date;

public class Playlist {
    private String id, list_name, cover;
    private int s_num;
    private Date reg_date;


    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getList_name() {
        return this.list_name;
    }

    public void setList_name(String list_name) {
        this.list_name = list_name;
    }

    public String getCover() {
        return this.cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public int getS_num() {
        return this.s_num;
    }

    public void setS_num(int s_num) {
        this.s_num = s_num;
    }

    public Date getReg_date() {
        return this.reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

}
