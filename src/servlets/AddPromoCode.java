package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Promo;
import entity.User;
import orm.ManagePromo;
import orm.ManageUser;
/**
 * Servlet implementation class AddPromoCode
 */
@WebServlet("/AddPromoCode")
public class AddPromoCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPromoCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession(); //new session

		ManagePromo promoMngr = new ManagePromo();
		String code = request.getParameter("promoCode");
		String type = request.getParameter("promoType");
		int amount = Integer.parseInt(request.getParameter("promoAmount"));
		
		promoMngr.addPromo(code, type, amount);

		dispatcher = getServletContext().getRequestDispatcher("/AdminSettings.jsp");
		
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
