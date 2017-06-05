package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Checklist;
import service.CheckedItemService;
import service.ChecklistService;
import service.UserService;

/**
 * Servlet implementation class DataServlet
 */
@WebServlet("/data")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// 获取token
		String token = (String)request.getSession().getAttribute("token");
		if(token == "" || token == null)
			request.getRequestDispatcher("/login").forward(request, response);
		
		// token -> username
		String username = new UserService().getUsername(token);
		if(username == "" || username == null)
			request.getRequestDispatcher("/login").forward(request, response);
		
		// 获取病人用户名
		String usr = request.getParameter("usr");
		request.setAttribute("usr", usr);
			
		// 获取医生创建的所有检查项
		ChecklistService chservice = new ChecklistService();
		ArrayList<Checklist> list = chservice.getCheckList(username);
		
		// 获取该病人检查项列表id
		ArrayList<Integer> idlist = chservice.getPatientChecklist(usr);
		
		// 检查项id - 检查项名称
		
		
		
		
		request.getRequestDispatcher("/data.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
