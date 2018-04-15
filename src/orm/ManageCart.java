package orm;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.hibernateUtil;
import entity.Cart;

public class ManageCart {

	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public Integer addCart(String cartCode, double totalPrice, int ticket_ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			tx = session.beginTransaction();
			Cart cart = new Cart(cartCode, totalPrice, ticket_ID);
			ID = (Integer)session.save(cart);
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

	public Cart getStudent(Integer ID)
	{
		Session session = factory.openSession();
		Cart cart = null;
		
		try
		{
			cart = (Cart)session.get(Cart.class, ID);
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return cart;
	}
	
	public void deleteStudent(Integer ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
			Cart cart = (Cart)session.get(Cart.class, ID);
			session.delete(cart);
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