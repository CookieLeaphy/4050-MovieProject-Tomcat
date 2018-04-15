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

		/*
		//SQL Code
		ManageUser userMngr = new ManageUser();
		User user = userMngr.loginInfo(username, password);

		if(user != null)
		{
		request.getSession().setAttribute("user", user);
		response.sendRedirect("/Home.jsp");
		}
		else
		{
		request.setAttribute("error", "Unknown user, please try again");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		}
		*/
		
		response.getWriter().append("Served at: " + username + " " + password).append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
