package pjs.shop.util;

import java.security.MessageDigest;

public class Encoder {
    private Encoder(){};
    private static Encoder instance =new Encoder();
    public static Encoder getInstance(){
        return instance;
    }
    
    public String encoding(String str){
        String  encodingString ="";
        try{  //암호 알고리즘 선택하여 객체 생성
            MessageDigest md =MessageDigest.getInstance("SHA-256");
            md.update(str.getBytes());  //바이트 타입으로 읽어온 pw를 sha-256 알고리즘을 통해 md 객체생성
            byte[] encode =md.digest();  //암호화 시켜서 byte형태의 배열의 변수에 담음.

            for(int i=0; i<encode.length; i++){
                encodingString +=Integer.toHexString(encode[i]&0xff);
            }

        }catch(Exception e){
            e.printStackTrace();
        }return encodingString;
    }
    
}