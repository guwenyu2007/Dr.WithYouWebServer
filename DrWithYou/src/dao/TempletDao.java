package dao;

import java.util.ArrayList;

import model.Templet;

public interface TempletDao {
	
	// 获取该医生创建的所有模板
	public ArrayList<Templet> getTempletList(String username);
	
	// 删除模板
	public int deleteTemplet(int tid);
	
	// 添加模板
	public int addTemplet(String username, String templetname, String suitable, String description);
	
	// 获取模板细则
	public Templet getTemplet(int tid);
	
	// 修改模板
	public int saveTemplet(int tid, String templetname, String suitable, String description);
	
	// 删除模板和检查项对应关系
	public int deleteTempletCheck(int tid);
	
	// 添加模板和检查项关系
	public int addTempletCheck(int tid, int cid);

}
