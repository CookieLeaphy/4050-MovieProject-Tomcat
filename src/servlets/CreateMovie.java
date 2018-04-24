package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import orm.ManageMovie;

/**
 * Servlet implementation class CreateMovie
 */
@WebServlet("/CreateMovie")
public class CreateMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession(); //new session
		String title = request.getParameter("title");
		Date release = request.getParameter("release");
		String link = request.getParameter("link");
		String trailor = request.getParameter("trailor");
		String summary = request.getParameter("summary");
		String rating = request.getParameter("rating");
		String genre = request.getParameter("genre");
		String director = request.getParameter("director");
		String producer = request.getParameter("producer");
		String cast = request.getParameter("cast");
		ManageMovie mngr = new ManageMovie();
		if(mngr.addMovie())
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
