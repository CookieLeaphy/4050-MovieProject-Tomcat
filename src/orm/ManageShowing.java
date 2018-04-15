package orm;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.hibernateUtil;
import entity.Showing;

public class ManageShowing {

	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public Integer addShowing(int room, int times, int movie_ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			tx = session.beginTransaction();
			Showing showing = new Showing(room, times, movie_ID);
			ID = (Integer)session.save(showing);
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

	public Showing getStudent(Integer ID)
	{
		Session session = factory.openSession();
		Showing showing = null;
		
		try
		{
			showing = (Showing)session.get(Showing.class, ID);
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return showing;
	}
	
	public void deleteStudent(Integer ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
			Showing showing = (Showing)session.get(Showing.class, ID);
			session.delete(showing);
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