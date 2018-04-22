package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOut
 */
@WebServlet("/LogOut")
public class LogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//Instantiate Variables
		HttpSession session=request.getSession();  
		RequestDispatcher dispatcher;
		PrintWriter out=response.getWriter();  
		//Invalidate session
		session.invalidate();
		
		//Send user to Log Out Confirmation
        dispatcher = getServletContext().getRequestDispatcher("/LogoutConfirmation.html");
        dispatcher.forward(request, response);
        
        out.print("You are successfully logged out!");  
        
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}



}
