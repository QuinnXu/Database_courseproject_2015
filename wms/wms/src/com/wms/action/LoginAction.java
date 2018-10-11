package com.wms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wms.db.AddLog;
import com.wms.db.DBManager; 

/**
 * 管理员登陆
 * @author win7
 *
 */
public class LoginAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		this.doPost(request, response);
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username=request.getParameter("username");
		String userpwd=request.getParameter("userpwd");
		
		DBManager dbm=new DBManager();
		boolean login=dbm.login(username, userpwd);
		Connection conn=null;
		ResultSet rs=null;
		if(login){
			request.getSession().setAttribute("user", username);
			
			
			PreparedStatement pstmt = null;
			try {
				conn=dbm.getConnection();
				pstmt = conn
						.prepareStatement("select isadmin from admin where name='"
								+ username + "' and pwd='" + userpwd + "'");

				rs = pstmt.executeQuery();
				while (rs.next()) {
					 String isadmin=rs.getString("isadmin");
					 if(isadmin.equals("y")){
						 request.getSession().setAttribute("isadmin", "y");
					 }else{
						 request.getSession().setAttribute("isadmin", "n");
					 }
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (rs != null)
						rs.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		   AddLog.addLog(username, "登陆系统");
		   response.sendRedirect("index.jsp");
			
		}else{
			out.println("<script>alert('用户名或密码有误!');window.location.href='login.jsp'</script>");
		}
		
		
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
