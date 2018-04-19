package servlets;

import java.io.IOException;
import java.util.List;

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
		String title = request.getParameter("title");
		ManageMovie movies = new ManageMovie();
		List<Movie> results = movies.lookUpMovies(title);
		String strlist = "";
		for (Movie tmp: results) {
			System.out.println(tmp.toString());
			strlist += tmp.toString() + "\n";
		}
		System.out.println(results.toString());
		response.getWriter().append("Served at: "+strlist).append(request.getContextPath());
	}

}
