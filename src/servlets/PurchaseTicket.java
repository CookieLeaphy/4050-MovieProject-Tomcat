package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Movie;
import entity.User;
import orm.ManageTicket;
import entity.Promo;
import orm.ManagePromo;

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
		SendEmail send = new SendEmail();
		//String movieID = request.getParameter("param");
		//System.out.println("MovieID:"+movieID);
		
		String [] seats = request.getParameterValues("seatSelect");
		String ticketType = request.getParameter("ticketType");
		String email;
		
		double ticketPrice = (double)Integer.parseInt(ticketType);
		String promoCode = request.getParameter("promoCode");
		ManagePromo mngPromo = new ManagePromo();
		Promo promo = mngPromo.getPromo(promoCode);
		if(promo != null)
		{
			double amount = promo.getAmount();
			if(promo.getType().equals("%"))
			{
				amount = (100-amount)/100;
				ticketPrice *= amount;
			}
			else
			{
				ticketPrice -= amount;
			}
		}
		
		String screenTime = request.getParameter("screeningTime");
		ManageTicket mngTicket = new ManageTicket();
		User user = (User) session.getAttribute("User");
		Movie movie = (Movie)session.getAttribute("movie");
		System.out.println("Ticket Purchase: "+movie.toString());
		//For users who didn't create an account
		if(user == null)
		{	
			 email = request.getParameter("email");
			
			for (String i: seats)
				mngTicket.addTicket(1, movie.getID(), ticketPrice, email, ticketType, 1, i);
			//NOTE movieID IS CONTAINED IN THE showing_ID of the db
				//				System.out.println("Seat: "+i);
		}else {
			//Extract information from user
			System.out.println(user.toString());
			 email = user.getEmail();
			for (String i: seats)
				mngTicket.addTicket(1, movie.getID(), ticketPrice, email, ticketType, 1, i);
			//Since we don't store cc information --just for show	
			
		}
		
		//Append Message
		String message = "Thank you for your purchase! "
				+ "\n Your order of the "+movie.getTitle()+" has been confirmed.";
		for(String k: seats) {
			message+= "\n\tSeat: "+k + ": $"+ticketPrice; 
		}
		double sum = ticketPrice * seats.length;
		message += "\n----------"
				+ "\n For a total of $"+ sum; 
		send.sendMessage(email,message,3);	
//		try {
//			
//		}
		for (String i: seats)
			System.out.println("Seat: "+i);
		System.out.println("Ticket Type: "+ticketType);
		System.out.println("Screen Time: "+screenTime);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Confirmation.jsp");
		dispatcher.forward(request, response); //forward to correct page
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
