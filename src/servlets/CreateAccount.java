package servlets;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.mail.smtp.SMTPAddressFailedException;

import entity.User;
import orm.ManageUser;

/**
 * Servlet implementation class CreateAccount
 */
@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public CreateAccount() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession(); //new session
		
		// TODO Auto-generated method stub
		String username = 	request.getParameter("username"); 
		String firstname =	request.getParameter("firstname");
		String lastname= 	request.getParameter("lastname");
		String phone = 		request.getParameter("phone");
		String email = 		request.getParameter("email");
		
		//Implement 
		String newPass0	 = 	request.getParameter("newPass0");
		String newPass1 = 	request.getParameter("newPass1");
		if (!newPass0.equals(newPass1)) {
		//Throw error/ send user to incorrect form page 
		}
		
		int news = 1;	   //True = "on" False = "null"
		if(request.getParameter("news")==null)
			news = 0;
		int promotions = 1;
		if(request.getParameter("promotions")==null)//True = "on" False = "null"
			promotions = 0;
		
		String address = 	request.getParameter("address");
		String city = 		request.getParameter("city");
		String stateSelect =request.getParameter("stateSelect");
		int zip = 			Integer.parseInt(request.getParameter("zip"));
		String country = 	request.getParameter("country");
		String ccno = 		request.getParameter("ccno");
		String ccType = 	request.getParameter("ccType");
		String expMonth = 	request.getParameter("expMonth");
		String expYear = 	request.getParameter("expYear");
		
		//int user_type, String userName, String firstName, String lastName, String pass, String address,
		//String city, int zip, String country, int subStatus, String email, String phone, int newsSub, int promoSub,
		//int orders
		
		ManageUser userMngr = new ManageUser();
		userMngr.addUser(0, username, firstname, lastname, newPass0, address, city, zip, country, 1, email, phone, news, promotions, 0);
		SendEmail send = new SendEmail();
		User user = userMngr.loginInfo(username, newPass0);
		
		if( user.getUser_type() != -1){
				request.getSession().setAttribute("user", user.getUserName());
				send.sendMessage(user, 1); //Send a confirmation email
				session.setAttribute("User", user);
				session.setAttribute("connected", "true");
				dispatcher = getServletContext().getRequestDispatcher("/AccountConfirmation.jsp");
		} else{
			session.setAttribute("connected", "false");
			request.setAttribute("error", "Error creating account, please try again");
			dispatcher = getServletContext().getRequestDispatcher("/Login-CreateNewAccount.html"); //.jsp");
			//request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
		dispatcher.forward(request, response); //forward to correct page
		
		//Test cases
		String all = username + " " + firstname + " " + lastname + " " + email +  " "+ phone+ " " + newPass0 +
				" " + newPass1 + " " + news + " " + promotions + " " + address + " " + city + " " + stateSelect +
				" " + zip + " " + country + " " + ccno + " " + ccType + " " + expMonth + " " + expYear;
		System.out.print(all);
		//response.getWriter().append("Served at: " + all).append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	*/

}
