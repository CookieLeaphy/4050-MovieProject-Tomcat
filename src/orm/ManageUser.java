package orm;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.hibernateUtil;
import entity.User;

public class ManageUser {

	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public Integer addUser(int user_type, String userName, String firstName, String lastName, String pass, String address,
			String city, int zip, String country, int subStatus, String email, String phone, int newsSub, int promoSub,
			int orders)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			tx = session.beginTransaction();
			User user = new User(user_type, userName, firstName, lastName, pass, address,
					city, zip, country, subStatus, email, phone, newsSub, promoSub, orders);
			ID = (Integer)session.save(user);
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

	public User getUser(Integer ID)
	{
		Session session = factory.openSession();
		User user = null;
		
		try
		{
			user = (User)session.get(User.class, ID);
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		
		return user;
	}
	
	public void deleteUser(Integer ID)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
			User user = (User)session.get(User.class, ID);
			session.delete(user);
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
	
	public User loginInfo(String userName, String pass)
	{
		Session session = factory.openSession();
		User user = null;
		
		try
		{
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.userName='"+userName+"'").getResultList();
			for(User tmpuser : userList) 
			{
				if(tmpuser.getPass().equals(pass)) 
				{
					user = tmpuser;
				}
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
		return user;
	}
}