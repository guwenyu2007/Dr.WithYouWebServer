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
	public ArrayList<Patient> getNonAddPatient(String username){
		ArrayList<Patient> list = patientDao.getAllPatients(); // 所有病人
		ArrayList<Patient> mylist = patientDao.getDocPatients(username);
		
		ArrayList<Patient> result = new ArrayList<Patient>();
		for(Patient temp: list){
			boolean flag = false;
			for(Patient compare: mylist){
				if(temp.getPatient_name().equals(compare.getPatient_name())){
					flag = true;
					break;
				}		
			}	
			
			if(!flag)
				result.add(temp);
		}
	           
		return result;
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
	 * @param username 医生用户名
	 * @return
	 */
	public ArrayList<Patient> getDoctorPatients(String username){
		
		ArrayList<Patient> list = patientDao.getDocPatients(username);		
		return list;
	}
	
	

}
