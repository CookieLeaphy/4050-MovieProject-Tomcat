package orm;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.hibernateUtil;
import entity.Ticket;

public class ManageTicket {
	
	public ManageTicket() {
		
	}
	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public Integer addTicket(int showing_ID, int price, String purchaser, String ticketType, int auditorium, String seat_ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			tx = session.beginTransaction();
			Ticket ticket = new Ticket(showing_ID, price, purchaser, ticketType, auditorium, seat_ID);
			session.save(ticket);
			tx.commit();
		}
		catch(HibernateException e)
		{	
			System.out.println("Ticket commit failed");
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return ID;
	}

	public Ticket getTicket(Integer ID)
	{
		Session session = factory.openSession();
		Ticket ticket = null;
		
		try
		{
			ticket = (Ticket)session.get(Ticket.class, ID);
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return ticket;
	}
	
	public void deleteTicket(Integer ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
			Ticket ticket = (Ticket)session.get(Ticket.class, ID);
			session.delete(ticket);
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