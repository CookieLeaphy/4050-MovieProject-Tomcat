package orm;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.hibernateUtil;
import entity.Auditorium;

public class ManageAuditorium {

	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public Integer addAuditorium(String aName, int capacity, String rowNum, int moviePlaying, String movieQueue)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			tx = session.beginTransaction();
			Auditorium auditorium = new Auditorium(aName, capacity, rowNum, moviePlaying, movieQueue);
			ID = (Integer)session.save(auditorium);
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

	public Auditorium getStudent(Integer ID)
	{
		Session session = factory.openSession();
		Auditorium auditorium = null;
		
		try
		{
			auditorium = (Auditorium)session.get(Auditorium.class, ID);
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return auditorium;
	}
	
	public void deleteStudent(Integer ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
			Auditorium auditorium = (Auditorium)session.get(Auditorium.class, ID);
			session.delete(auditorium);
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