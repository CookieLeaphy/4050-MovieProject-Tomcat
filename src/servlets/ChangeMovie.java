package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Movie;
import orm.ManageMovie;

/**
 * Servlet implementation class ChangeMovie
 */
@WebServlet("/ChangeMovie")
public class ChangeMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/MovieListingPage.jsp");
		//HttpSession session = request.getSession(); //new session
		String title = request.getParameter("title");
		Date releaseDate = null;
		try {
			releaseDate = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("release"));
		} catch(ParseException e) {
		
		}
		String link = request.getParameter("link");
		String trailor = request.getParameter("trailor");
		String description = request.getParameter("description");
		String rating = request.getParameter("rating");
		String genre = request.getParameter("genre");
		String director = request.getParameter("director");
		String producer = request.getParameter("producer");
		Movie m = (Movie) request.getAttribute("movie");
		ManageMovie mngr = new ManageMovie();
		Integer i = mngr.editMovie(m, m.getID(), rating, title, producer, director, genre, trailor, link, description, releaseDate);
		if(i == -1) {
			request.setAttribute("edited", "false");
			request.setAttribute("error", "FailedMovieChange");
			dispatcher = getServletContext().getRequestDispatcher("/AdminEditMovie.jsp");
		} else {
			request.setAttribute("edited", "true");
		}
		dispatcher.forward(request, response);
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
