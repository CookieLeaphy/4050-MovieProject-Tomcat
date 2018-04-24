package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orm.ManageMovie;
import entity.Movie;

/**
 * Servlet implementation class SearchMovie
 */
@WebServlet("/SearchMovie")
public class SearchMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Search Accessed");
		String title = request.getParameter("title");
		String genre = request.getParameter("genre");
		String rating = request.getParameter("rating");
		String releaseStatus = request.getParameter("releaseStatus");
		ManageMovie movies = new ManageMovie();
		List<Movie> results;
		if(title.equals("") && genre.equals("") && rating.equals("") && releaseStatus.equals(""))
		{
			results = movies.getAllMovies();
		}
		else
		{
			results = movies.lookUpMovies(title, genre, rating, releaseStatus);
		}
		request.setAttribute("movieList", results);
		request.setAttribute("searchTerm", title);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
		dispatcher.forward(request, response); //forward to correct page
	}

}
