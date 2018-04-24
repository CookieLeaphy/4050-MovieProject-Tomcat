package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Movie;
import entity.User;
import orm.ManageTicket;

/**
 * Servlet implementation class PurchaseTicket
 */
@WebServlet("/PurchaseTicket")
public class PurchaseTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		
		//String movieID = request.getParameter("param");
		//System.out.println("MovieID:"+movieID);
		
		String [] seats = request.getParameterValues("seatSelect");
		String ticketType = request.getParameter("ticketType");
		
		int ticketPrice = Integer.parseInt(ticketType);
		String screenTime = request.getParameter("screeningTime");
		ManageTicket mngTicket = new ManageTicket();
		User user = (User) session.getAttribute("User");
		//Movie movie = (Movie)session.getAttribute("");
		//For users who didn't create an account
		if(user == null)
		{	
			String email = request.getParameter("email");
			
			for (String i: seats)
				mngTicket.addTicket(1, ticketPrice, email, ticketType, 1, i);
			//NOTE movieID IS CONTAINED IN THE showing_ID of the db
				//				System.out.println("Seat: "+i);
		}else {
			//Extract information from user
			System.out.println(user.toString());
			String email = user.getEmail();
			for (String i: seats)
				mngTicket.addTicket(1, ticketPrice, email, ticketType, 1, i);
			//Since we don't store cc information --just for show
			
			
		}
			
//		try {
//			
//		}
		for (String i: seats)
			System.out.println("Seat: "+i);
		System.out.println("Ticket Type: "+ticketType);
		System.out.println("Screen Time: "+screenTime);

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
