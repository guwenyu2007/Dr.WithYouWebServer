package dao;

import util.AppException;

public interface UserDao {
	
	/**
	 * 医生登录
	 * @param name
	 * @param password(已加密)
	 * @return
	 */
    public int login(String name, String password) throws AppException;

    /**
     * 
     * @Title: register 
     * @Description: TODO
     * @param username
     * @param password(已加密)
     * @param @return
     * @return String
     */
    public String register(String username, String password) throws AppException;
    
    public String adLogin(String name, String password) throws AppException;
}
