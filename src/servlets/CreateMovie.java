package servlets;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import orm.ManageMovie;
import entity.Movie;

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
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminEditMovie.jsp");
		HttpSession session = request.getSession(); //new session
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
		ManageMovie mngr = new ManageMovie();
		Integer id = mngr.addMovie(rating, title, producer, director, genre, trailor, link, description, releaseDate);
		if(id == -1) {
			request.setAttribute("created", "false");
			request.setAttribute("error", "FailedMovieCreation");
			dispatcher = getServletContext().getRequestDispatcher("/AdminCreateMovie.jsp");
		} else {
			request.setAttribute("created", "true");
			Movie m = mngr.getMovie(id);
			request.setAttribute("movie", m);
		}
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
