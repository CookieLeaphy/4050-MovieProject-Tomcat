package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Movie;
import orm.ManageMovie;

/**
 * Servlet implementation class MovieListingPage
 */
@WebServlet("/MovieListingPage")
public class MovieListingPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieListingPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String movieID = request.getParameter("param");
		ManageMovie mvmn = new ManageMovie();
		System.out.println("Movie: "+movieID);
		Movie movie = mvmn.getMovie(Integer.parseInt(movieID));
		System.out.println(movie.toString());
		
		request.setAttribute("movie", movie);
		
		request.getRequestDispatcher("MovieListingPage.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
