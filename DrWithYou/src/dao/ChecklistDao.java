package dao;

import java.util.ArrayList;

import model.Checklist;

public interface ChecklistDao {
	
	// 获取该医生创建的所有检查项
	public ArrayList<Checklist> getChecklist(String username);
	
	// 添加检查项
	public int addChecklist(String username, String itemname, String checktime, String description);

	// 获取检查项细则
	public Checklist getCheckitem(int cid);
	
	// 修改检查项
	public int saveCheckitem(int cid, String itemname, String checktime, String description);
	
	// 删除检查项
	public int deleteCheckitem(int cid);
}
