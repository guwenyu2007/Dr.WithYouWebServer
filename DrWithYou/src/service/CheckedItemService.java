package service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import dao.CheckedItemDao;
import impl.CheckedItemDaoImpl;
import model.CheckedItem;
import net.sf.json.JSONArray;
import util.TimeUtil;

public class CheckedItemService {
	
	private CheckedItemDao checkedItemDao;
	private static int WEEK = 604800000;
	private static int DAY = 86400000;
	
	public CheckedItemService()
	{
		checkedItemDao = new CheckedItemDaoImpl();
	}
	
	/**
	 * 获取本周内用户提交数据
	 * @param username
	 * @param id
	 * @return
	 */
	public String getData(String username, int id)
	{
		ArrayList<CheckedItem> list = checkedItemDao.getData(username, id);
		JSONArray json = new JSONArray();
		
		// 获取当前时间&一周前时间(stamp形式)
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		String now = d.toString();
		int week_before = Integer.parseInt(now) - WEEK;
		
		// 获取本周内数据
		for(int i = 0; i < list.size(); i ++)
		{
			CheckedItem temp = list.get(i);
			int time = Integer.parseInt(temp.getSubmittime());
			
			if(time < week_before)
				continue;
			
			int day = (time - week_before) / DAY;
			Map map = new HashMap();
			map.put("day", day);
			map.put("value", temp.getValue());
			json.add(map);
		}
	
		System.out.println(json.toString());
		return json.toString();
	}

}
