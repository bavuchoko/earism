package pjs.shop.user;

import java.sql.Date;

public class UserVO {
    private String id, pw, credit1, credit2, credit3, nickname, pwc,auth, pic;
    private int reco;
    private Date join_date;



    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return this.pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getCredit1() {
        return this.credit1;
    }

    public void setCredit1(String credit1) {
        this.credit1 = credit1;
    }

    public String getCredit2() {
        return this.credit2;
    }

    public void setCredit2(String credit2) {
        this.credit2 = credit2;
    }

    public String getCredit3() {
        return this.credit3;
    }

    public void setCredit3(String credit3) {
        this.credit3 = credit3;
    }

    public String getNickname() {
        return this.nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPwc() {
        return this.pwc;
    }

    public void setPwc(String pwc) {
        this.pwc = pwc;
    }

    public String getAuth() {
        return this.auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public String getPic() {
        return this.pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getReco() {
        return this.reco;
    }

    public void setReco(int reco) {
        this.reco = reco;
    }

    public Date getJoin_date() {
        return this.join_date;
    }

    public void setJoin_date(Date join_date) {
        this.join_date = join_date;
    }

}
