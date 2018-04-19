package orm;

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
	
	public Integer addMovie(String showing, String rating, String title, String producer, String director, String genre,
			String trailor)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			tx = session.beginTransaction();
			Movie movie = new Movie(showing, rating, title, producer, director, genre, trailor);
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
	
	public List<Movie> lookUpMovies(String title){
		Session session = factory.openSession();
		//List<Movie> movieList;
		Transaction tx = null;
		try
		{
			
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<Movie> movieList = session.createQuery("FROM Movie").getResultList();
			return movieList;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		//return movieList;
	}

	public Movie getStudent(Integer ID)
	{
		Session session = factory.openSession();
		Movie movie = null;
		
		try
		{
			movie = (Movie)session.get(Movie.class, ID);
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
	
	public void deleteStudent(Integer ID)
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