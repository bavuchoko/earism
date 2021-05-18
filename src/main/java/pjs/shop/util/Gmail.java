package pjs.shop.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
    
    @Override
    protected PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication("greatparkjs8501@gmail.com", "shjs*850105");
    }
}
