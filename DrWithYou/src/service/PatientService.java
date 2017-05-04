package service;

import java.util.ArrayList;

import dao.PatientDao;
import dao.UserDao;
import impl.PatientDaoImpl;
import impl.UserDaoImpl;
import model.Patient;

public class PatientService {
	
	private PatientDao patientDao;
	private UserDao userDao;
	
	public PatientService(){
		patientDao = new PatientDaoImpl();
		userDao = new UserDaoImpl();
	}
	
	/**
	 * 获取所有病人信息列表
	 * @return
	 */
	public ArrayList<Patient> getAllPatient(){
		ArrayList<Patient> list = patientDao.getAllPatients();
		
		return list;
	}
	
	/**
	 * 添加医患关系
	 * @param token
	 * @param patientname
	 * @return
	 */
	public boolean addPatient(String token, String patientname){
		
		boolean result = false;
		
		// 根据token 获取医生用户名
		String doctorusr = userDao.getUsername(token);
		if(doctorusr != "")
			result = patientDao.addPatient(doctorusr, patientname);
		return result;
		
	}
	
	/**
	 * 获取医生的所有患者
	 * @param token 
	 * @return
	 */
	public ArrayList<Patient> getDoctorPatients(String token){
		
		ArrayList<Patient> list = null;
		
		// 根据token 获取医生用户名
		String username = userDao.getUsername(token);
		if(username != ""){
			list = patientDao.getDocPatients(username);
		}
		
		return list;
	}
	
	

}
