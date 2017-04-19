package service;

import util.AppException;
import util.MD5Util;
import impl.UserDaoImpl;
import dao.UserDao;

public class UserService {
	
	 private UserDao userDao;

	    public UserService()
	    {
	        userDao = new UserDaoImpl();
	    }


	    /**
	     * �û���¼
	     * @param name
	     * @param password(δ����)
	     * @return -1 ��¼ʧ��   
	     *          1 ҽ����¼
	     *          2 ���ߵ�¼
	     * @throws AppException
	     */
	    public int login(String name, String password) 
	    {
	        int id = -1;
	        
            try {
            	String encode = MD5Util.MD5(password);
				id = userDao.login(name, encode);
			} catch (AppException e) {
				e.printStackTrace();
			}

	        return id;
	    }
	    

	   /**
	    * 
	    * @Title: register 
	    * @Description: ����ע��
	    * @param username
	    * @param password(δ����)
	    * @return String
	    */
	    public String register(String username, String password)
	    {
	    	String message = "";
	    	
	    	try {
	    		String encode = MD5Util.MD5(password);
				message = userDao.register(username, encode);
			} catch (AppException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	    	return message;
	    }
	    
	    /**
	     * 
	     * @Title: adLogin 
	     * @Description: ���ߵ�¼
	     * @param username
	     * @param password(δ����)
	     * @return String
	     */
	    public String adLogin(String username, String password)
	    {
	    	String message = "";
	    	
	    	try {
            	String encode = MD5Util.MD5(password);
				message = userDao.adLogin(username, encode);
			} catch (AppException e) {
				e.printStackTrace();
			}
			
			return message;
	    }

}
