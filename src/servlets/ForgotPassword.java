package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import orm.ManageUser;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private String genString(int count)
	{
		String ALPHA_NUM = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		StringBuilder builder = new StringBuilder();
		while (count -- > 0)
		{
			int character = (int)(Math.random()*ALPHA_NUM.length());
			builder.append(ALPHA_NUM.charAt(character));
		}
		return builder.toString();
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		SendEmail send = new SendEmail();
		RequestDispatcher dispatcher;
		//String password = request.getParameter("newPassword0");
		//if(password.equals(request.getParameter("newPassword1")))
		//	System.out.println("Password Failed: This needs to be implemented");
		ManageUser mnguser = new ManageUser();
		
		String password = genString(10);
		User user = mnguser.setPassword(email, password);
		send.sendMessage(user, 2);
		dispatcher = getServletContext().getRequestDispatcher("/ForgotPassword1.jsp");
		dispatcher.forward(request, response);
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}


}
