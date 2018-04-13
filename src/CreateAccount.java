

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		String username = 	request.getParameter("username"); 
		String firstname =	request.getParameter("firstname");
		String lastname= 	request.getParameter("lastname");
		String phone = 		request.getParameter("email");
		String newPass0 = 	request.getParameter("newPass0");
		String newPass1 = 	request.getParameter("newPass1");
		String news =	 	request.getParameter("news");	   //True = "on" False = "null"
		String promotions = request.getParameter("promotions");//True = "on" False = "null"
		String address = 	request.getParameter("address");
		String city = 		request.getParameter("city");
		String stateSelect =request.getParameter("stateSelect");
		String zip = 		request.getParameter("zip");
		String country = 	request.getParameter("country");
		String ccno = 		request.getParameter("ccno");
		String ccType = 	request.getParameter("ccType");
		String expMonth = 	request.getParameter("expMonth");
		String expYear = 	request.getParameter("expYear");
		String all = username + " " + firstname + " " + lastname + " " + phone+ " " + newPass0 + " " + newPass1 + " " + news + " " + promotions + " " + address + " " + city + " " + stateSelect + " " + zip + " " + country + " " + 
				ccno + " " + ccType + " " + expMonth + " " + expYear;
		System.out.print(all);
		response.getWriter().append("Served at: " + all).append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
