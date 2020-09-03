package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuth extends Authenticator {

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		String id="asdqw13@naver.com";
		String pwd="AZXS3258!!";
		
		return new PasswordAuthentication(id, pwd);
	}
}