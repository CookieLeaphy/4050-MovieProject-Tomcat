package orm;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.hibernateUtil;
import entity.Seat;

public class ManageSeat {

	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public Integer addSeat(int rowNum, int seatNum, int availability, int buyer)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			tx = session.beginTransaction();
			Seat seat = new Seat(rowNum, seatNum, availability, buyer);
			ID = (Integer)session.save(seat);
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

	public Seat getStudent(Integer ID)
	{
		Session session = factory.openSession();
		Seat seat = null;
		
		try
		{
			seat = (Seat)session.get(Seat.class, ID);
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return seat;
	}
	
	public void deleteStudent(Integer ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
			Seat seat = (Seat)session.get(Seat.class, ID);
			session.delete(seat);
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