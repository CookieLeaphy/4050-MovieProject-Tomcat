package orm;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.hibernateUtil;
import entity.Movie;
import entity.User;

public class ManageMovie {

	public ManageMovie(){
		System.out.print("ManageMovie constructor accessed.");
	}
	
	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public Integer addMovie(String rating, String title, String producer, String director, String genre,
			String trailor, String link, String description, Date releaseDate)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			tx = session.beginTransaction();
			Movie movie = new Movie(rating, title, producer, director, genre, trailor, link, description, releaseDate);
			ID = (Integer)session.save(movie);
			tx.commit();
		}
		catch(HibernateException e)
		{
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return ID;
	}
	
	public Integer editMovie(Movie m, Integer id, String rating, String title, String producer, String director, String genre,
			String trailor, String link, String description, Date releaseDate) {
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<Movie> movieList = session.createQuery("from Movie s where s.ID='"+id+"'").getResultList();
			for(Movie temp : movieList) 
			{	
				m = temp; 
				m.setRating(rating);
				m.setTitle(title);
				m.setProducer(producer);
				m.setDirector(director);
				m.setGenre(genre);
				m.setTrailor(trailor);
				m.setLink(link);
				m.setDescription(description);
				m.setReleaseDate(releaseDate);
				session.update(m);
				break; 
			}
			tx.commit();
		} catch(HibernateException e) {
			if(tx != null) tx.rollback();
			e.printStackTrace();
			id = -1;
		} finally {
			session.close();
		}
		return id;
	}
	
	@SuppressWarnings("deprecation")
	public List<Movie> lookUpMovies(String title, String genre, String rating, String releaseStatus){
		Session session = factory.openSession();
		//@SuppressWarnings("unchecked")
		List<Movie> movieList = null;
		Transaction tx = null;
		try
		{
			Date date = new Date();
			StringBuilder query = new StringBuilder(
					"FROM Movie s where (s.title like '%"+title+"%'"
							+ " or s.producer like '%"+title+"%'"
							+ " or s.director like '%"+title+"%')"
							+ " and s.genre like '%"+genre+"%'"
							+ " and s.rating like '%"+rating+"'");
			
			if(releaseStatus.equals("Showing"))
			{
				query.append(" and s.releaseDate <= :date");
			}
			else if(releaseStatus.equals("Coming Soon"))
			{
				query.append(" and s.releaseDate > :date");
			}
			if(releaseStatus.equals("Showing") || releaseStatus.equals("Coming Soon"))
			{
				tx = session.beginTransaction();
				movieList = session.createQuery(query.toString()).setDate("date", date).getResultList();
			}
			else
			{
				tx = session.beginTransaction();
				movieList = session.createQuery(query.toString()).getResultList();
			}
//			return movieList;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		return movieList;
	}

	public List<Movie> getAllMovies(){
		Session session = factory.openSession();
		//@SuppressWarnings("unchecked")
		List<Movie> movieList = null;
		Transaction tx = null;
		try
		{
			String query = "FROM Movie";
			tx = session.beginTransaction();
			movieList = session.createQuery(query).getResultList();
//			return movieList;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		return movieList;
	}
	
	public Movie getMovie(int ID)
	{
		Session session = factory.openSession();
		Movie movie = null;
		Transaction tx;
		try
		{	
			//String query = "FROM Movie s where s.ID '"+ID+"'";
			//tx = session.beginTransaction();
			movie = (Movie) session.get(Movie.class, ID);//session.createQuery(query).getResultList();
			//movie = (Movie) session.get(Movie.class, ID); //idk if this is correct. we may need to use a sql query?
			return movie;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return movie;
	}
	
	public String getMovieTitle(int ID)
	{
		Session session = factory.openSession();
		Movie movie = null;
		Transaction tx;
		try
		{	
			//String query = "FROM Movie s where s.ID '"+ID+"'";
			//tx = session.beginTransaction();
			movie = (Movie) session.get(Movie.class, ID);//session.createQuery(query).getResultList();
			//movie = (Movie) session.get(Movie.class, ID); //idk if this is correct. we may need to use a sql query?
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return movie.getTitle();
	}
	
	public void deleteMovie(Integer ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
			Movie movie = (Movie)session.get(Movie.class, ID);
			session.delete(movie);
			tx.commit();
		}
		catch(HibernateException e)
		{
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
	}
}