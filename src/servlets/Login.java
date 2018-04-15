package servlets;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("loginUser");
		String password = request.getParameter("loginPassword");
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession(); //new session
		
		//SQL Code
		ManageUser userMngr = new ManageUser();
		User user = userMngr.loginInfo(username, password);

		if(user != null){
			request.getSession().setAttribute("user", user.getUserName());
			session.setAttribute("connected", "true");
			dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
		} else{
			session.setAttribute("connected", "false");
			request.setAttribute("error", "Unknown user, please try again");
			dispatcher = getServletContext().getRequestDispatcher("/Login-CreateNewAccount.jsp");
			//request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
		dispatcher.forward(request, response); //forward to correct page
		//response.getWriter().append("Served at: " + username + " " + password).append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
