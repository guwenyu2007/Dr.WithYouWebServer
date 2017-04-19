package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.AppException;
import util.DBUtil;

import dao.UserDao;

public class UserDaoImpl implements UserDao{

	/**
	 * 医生登录
	 * @return -1  登录失败
	 *          1  医生登录
	 *          0  患者登录
	 */
	public int login(String name, String password) throws AppException {

        int id = -1;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {

            // 创建数据库连接
            conn = DBUtil.getConnection();

            // 定义及预处理sql语句
            String str = "SELECT bedoctor FROM user WHERE username = ? AND password = ?";
            st = conn.prepareStatement(str);

            // 设置参数
            st.setString(1, name);
            st.setString(2, password);

            // ִ执行sql语句
            rs = st.executeQuery();

            // 判断处理结果
            if(rs.next()){
                id = rs.getInt("bedoctor");
                //id = rs.getConcurrency();
            }


        } catch (SQLException e) {
            e.printStackTrace();
            throw new AppException("/impl/UserDaoImpl/login");
        }finally
        {
            // 关闭连接
            DBUtil.closeResultSet(rs);     // 关闭数据集
            DBUtil.closeStatement(st);     //     sql语句
            DBUtil.closeConection(conn);   //     连接
        }
        return id;
	}
	
	/**
	 * 患者注册
	 * @param password(已加密)
	 * @return 注册成功 true
	 *         注册失败 false 
	 */
	public String register(String username, String password) throws AppException{
		
		String message = "";
		Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {

            // 创建数据库连接
            conn = DBUtil.getConnection();

            // 定义及预处理sql语句
            String str = "INSERT INTO user VALUES(?, ?, 0)";
            st = conn.prepareStatement(str);

            // 设置参数
            st.setString(1, username);
            st.setString(2, password);

            // ִ执行新增语句
            int result = -1;
            result = st.executeUpdate();

            // 判断处理结果
            if(result > 0)
            	message = "true";
            else
            	message = "false";

        } catch (SQLException e) {
            e.printStackTrace();
            throw new AppException("/impl/UserDaoImpl/register");
        }finally
        {
            // 关闭连接
            DBUtil.closeResultSet(rs);     // 关闭数据集
            DBUtil.closeStatement(st);     //     sql语句
            DBUtil.closeConection(conn);   //     连接
        }
		
		return message;
	}
	
	/**
	 * 患者登录
	 * @return "true""false"
	 */
	public String adLogin(String name, String password) throws AppException{
		String message = "";
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {

            // 创建数据库连接
            conn = DBUtil.getConnection();

            // 定义及预处理sql语句
            String str = "SELECT * FROM user WHERE username = ? AND password = ? AND bedoctor = 0";
            st = conn.prepareStatement(str);

            // 设置参数
            st.setString(1, name);
            st.setString(2, password);

            // ִ执行sql语句
            rs = st.executeQuery();

            // 判断处理结果
            if(rs.next())
            	message = "true";
            else
            	message = "false";               

        } catch (SQLException e) {
            e.printStackTrace();
            throw new AppException("/impl/UserDaoImpl/adLogin");
        }finally
        {
            // 关闭连接
            DBUtil.closeResultSet(rs);     // 关闭数据集
            DBUtil.closeStatement(st);     //     sql语句
            DBUtil.closeConection(conn);   //     连接
        }
        return message;
	}
}
