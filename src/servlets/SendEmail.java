package servlets;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import entity.User;

public class SendEmail {
	final String username = "test69905@gmail.com";
	final String password = "pa55word1234";
	
	
	public SendEmail() {
		
	}
	
	public void sendMessage(User user, int emailType ) { //int 1 = Account Confirmation int 2 = Ticket Conf. 

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			//message.setFrom(new InternetAddress("coke@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(user.getEmail())); //Change 
			
			if(emailType == 1) {	 	//New Account Email
				message.setSubject("Congratulations " + user.getFirstName() + "!");
				message.setText("Your account has been created !");
			}
			else if(emailType == 2) { 	//Forgot Password Email
				message.setSubject(user.getFirstName() + ", your account has received a new password.");
				message.setText("New Password: " + user.getPass());
			}
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	
	}
}
