package orm;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entity.hibernateUtil;
import entity.Movie;
import entity.Ticket;
import entity.User;

public class ManageUser {
	public ManageUser() {
		System.out.println("Manage User Constructor Accessed");
	}
	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public Integer addUser(int user_type, String userName, String firstName, String lastName, String pass, String address,
			String city, int zip, String country, String email, String phone, int newsSub, int promoSub,
			int confirmation)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		Integer ID = null;	
		
		try
		{
			boolean emailExists = false;
			tx = session.beginTransaction();
			User user = new User(user_type, userName, firstName, lastName, pass, address,
					city, zip, country, email, phone, newsSub, promoSub, confirmation);
			List<User> userList = (List<User>) session.createQuery("from User s where s.email='"+user.getEmail()+"'"
													+ " or s.userName='" + user.getUserName() + "'").getResultList();
			if(userList.size() == 0)
			{
				ID = (Integer)session.save(user);
				tx.commit();
			}else
			{
				//Invalid Account Parameters
				ID = -1;
				tx.rollback();
			}
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
	
	public List<User> getAllUsers(){
		Session session = factory.openSession();
		//@SuppressWarnings("unchecked")
		List<User> userList = null;
		Transaction tx = null;
		try
		{
			String query = "FROM User";
			tx = session.beginTransaction();
			userList = session.createQuery(query).getResultList();
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
		return userList;
	}
	
	public List<User> getNewsPromosUsers(String np){
		Session session = factory.openSession();
		//@SuppressWarnings("unchecked")
		List<User> userList = null;
		Transaction tx = null;
		try
		{
			String query = "";
			if(np.equals("N&P"))
			{
				query = "FROM User s where s.newsSub=1 or s.promoSub=1";
			}
			else if(np.equals("N"))
			{
				query = "FROM User s where s.newsSub=1";			
			}
			else if(np.equals("P"))
			{
				query = "FROM User s where s.promoSub=1";				
			}	
			else
			{
				query = "FROM User";
			}

			tx = session.beginTransaction();
			userList = session.createQuery(query).getResultList();
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
		return userList;
	}
	
	public User getUserByUsername(String username)
	{
		Session session = factory.openSession();
		User user = null;
		
		try
		{
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.userName='"+username+"'").getResultList();
			for(User tmpuser : userList) 
			{
				user = tmpuser;
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
	
	public User getUserByEmail(String email)
	{
		Session session = factory.openSession();
		User user = null;
		
		try
		{
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.email='"+email+"'").getResultList();
			for(User tmpuser : userList) 
			{
				user = tmpuser;
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
	
	public void deleteUser(Integer ID)
	{
		Session session = factory.openSession();
		List<Ticket> ticketList = null;
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
			User user = (User)session.get(User.class, ID);
			String query = "FROM Ticket s where s.purchaser='"+user.getEmail()+"'";
			ticketList = session.createQuery(query).getResultList();
			for(Ticket t : ticketList)
			{
				Ticket ticket = (Ticket)session.get(Ticket.class, t.getID());
				session.delete(ticket);
			}
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
		User user = new User();
		
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
			return null;
		}
		finally
		{
			session.close();
		}
		return user;
	}
	
	public User setPassword(String email, String pass)
	{
		Session session = factory.openSession();
		User user = new User();
		Transaction tx = null;
		try
		{
			
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.email='"+email+"'").getResultList();
			for(User tmpuser : userList) 
			{	
				user = tmpuser; 
				user.setPass(pass);
				session.update(user);
				break; 
			}
			tx.commit();
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
	
	public User setUsername(User user, String newUsername)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		try
		{
			
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.userName='"+user.getUserName()+"'").getResultList();
			for(User tmpuser : userList) 
			{	
				user = tmpuser; 
				user.setUserName(newUsername);
				session.update(user);
				break; 
			}
			tx.commit();
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
	
	public User setName(User user, String newFirstName, String newLastName)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		try
		{
			
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.userName='"+user.getUserName()+"'").getResultList();
			for(User tmpuser : userList) 
			{	
				user = tmpuser; 
				user.setFirstName(newFirstName);
				user.setLastName(newLastName);
				session.update(user);
				break; 
			}
			tx.commit();
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
	
	public User setPassword(User user, String newPassword)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		try
		{
			
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.userName='"+user.getUserName()+"'").getResultList();
			for(User tmpuser : userList) 
			{	
				user = tmpuser; 
				user.setPass(newPassword);
				session.update(user);
				break; 
			}
			tx.commit();
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
	
	public User setPromos(User user, int news, int promos)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		try
		{
			
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.userName='"+user.getUserName()+"'").getResultList();
			for(User tmpuser : userList) 
			{	
				user = tmpuser; 
				user.setNewsSub(news);
				user.setPromoSub(promos);
				session.update(user);
				break; 
			}
			tx.commit();
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
	
	public User setContact(User user, String phone, String email)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		try
		{
			
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.userName='"+user.getUserName()+"'").getResultList();
			for(User tmpuser : userList) 
			{	
				user = tmpuser; 
				user.setPhone(phone);
				user.setEmail(email);
				session.update(user);
				break; 
			}
			tx.commit();
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
	
	public User randomConfirmation(User user)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		try
		{
			
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.userName='"+user.getUserName()+"'").getResultList();
			for(User tmpuser : userList) 
			{	
				user = tmpuser; 
				user.setConfirmation((int) Math.ceil(Math.random()*89999 + 10000));
				session.update(user);
				break; 
			}
			tx.commit();
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
	
	public User setConfirmation(User user, int n)
	{
		Session session = factory.openSession();
		Transaction tx = null;
		try
		{
			
			tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<User> userList = session.createQuery("from User s where s.userName='"+user.getUserName()+"'").getResultList();
			for(User tmpuser : userList) 
			{	
				user = tmpuser; 
				user.setConfirmation(n);
				session.update(user);
				break; 
			}
			tx.commit();
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