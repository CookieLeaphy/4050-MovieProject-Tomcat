package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;
import orm.ManageUser;

/**
 * Servlet implementation class ChangeContactInfo
 */
@WebServlet("/ChangeContactInfo")
public class ChangeContactInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeContactInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession(); //new session

		ManageUser userMngr = new ManageUser();
		User user = (User) session.getAttribute("User");
		user = userMngr.setContact(user, request.getParameter("phone"), request.getParameter("email"));
		session.setAttribute("user", user.getUserName());
		session.setAttribute("User", user);
		dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
		
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
