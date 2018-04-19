package entity;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class hibernateUtil 
{
	/* There should only be one SessionFactory object during the lifetime of the program. */
	private static SessionFactory factory = cfgSession();
	
	private static SessionFactory cfgSession()
	{
		SessionFactory sf = null;
		
		try
		{
			if(factory == null)
			{
				sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		
			}
		}
		catch(Throwable ex)
		{
			System.err.println("Failed to create sessionFactory object." + ex);
			throw new ExceptionInInitializerError(ex);
		}
		
		return sf;
	}
	
	public static SessionFactory getSessionFactory() 
	{
		if(factory==null)
		{
			factory = cfgSession();
		}
		return factory;
	}
	
	/**
	 * SessionFactory object should be closed after all db operations completed.
	 * This method destroys the object and releases all resources.
	 */
	public static void closeSessionFactory()
	{
		if(factory != null)
		{
			factory.close();
		}
	}
}