package servlets;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import orm.ManageUser;
/**
 * Servlet implementation class SendNewsPromos
 */
@WebServlet("/SendNewsPromos")
public class SendNewsPromos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	final String username = "test69905@gmail.com";
	final String password = "pa55word1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendNewsPromos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManageUser mngUser = new ManageUser();
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
		
		String np = request.getParameter("type");
		List<User> userResults = mngUser.getNewsPromosUsers(np);
		for(User u : userResults) {
			System.out.println(u.toString());
			System.out.println(np);
			System.out.println(request.getParameter("subject"));
			System.out.println(request.getParameter("text"));
			try {
			Message message = new MimeMessage(session);
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(u.getEmail())); //Change 
			
			message.setSubject(request.getParameter("subject"));
			message.setText(request.getParameter("text"));
			
			Transport.send(message);
			
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminSettings.jsp");
		dispatcher.forward(request, response); //forward to correct page
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
