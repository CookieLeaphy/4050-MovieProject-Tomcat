package orm;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.Movie;
import entity.Promo;
import entity.Ticket;
import entity.User;
import entity.hibernateUtil;

public class ManagePromo {
	
	public ManagePromo(){
		System.out.print("ManagePromos constructor accessed.");
	}
	
	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public Integer addPromo(String code, String type, int amount)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			tx = session.beginTransaction();
			Promo promo = new Promo(code, type, amount);
			ID = (Integer)session.save(promo);
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
	
	public Promo getPromo(String code)
	{
		Session session = factory.openSession();
		Promo promo = null;
		
		try
		{
			@SuppressWarnings("unchecked")
			List<Promo> promoList = session.createQuery("from Promo s where s.code='"+code+"'").getResultList();
			for(Promo tmpPromo : promoList) 
			{
				promo = tmpPromo;
			}
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return promo;
	}
	
	public List<Promo> getAllPromos(){
		Session session = factory.openSession();
		//@SuppressWarnings("unchecked")
		List<Promo> promoList = null;
		Transaction tx = null;
		try
		{
			String query = "FROM Promo";
			tx = session.beginTransaction();
			promoList = session.createQuery(query).getResultList();
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
		return promoList;
	}
	
	public void deletePromo(Integer ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
			Promo promo= (Promo)session.get(Promo.class, ID);
			session.delete(promo);
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
