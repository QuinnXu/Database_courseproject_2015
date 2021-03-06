﻿package com.wms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wms.db.AddLog;
import com.wms.db.DBManager;

/**
 * 添加带出物品
 * @author win7
 *
 */
public class AddCangkuAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddCangkuAction() {
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
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String bianhao = request.getParameter("bianhao");
		String mingcheng = request.getParameter("mingcheng");
		String didian = request.getParameter("didian");
		
		String baoguanyuan = request.getParameter("baoguanyuan");
		
		String beizhu = request.getParameter("beizhu");
		
		DBManager dbm = new DBManager();
		
		String sql = "insert into cangku values('" + bianhao + "','" + mingcheng
				+ "','"+didian+"','" + baoguanyuan + "','"+beizhu+"')";
		System.out.println(sql);

		Statement stat = null;
		Connection conn = null;
		try {
			conn = dbm.getConnection();
			stat = conn.createStatement();
			stat.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (stat != null)
					stat.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		AddLog.addLog(request.getSession().getAttribute("user").toString(), "添加仓库");
		response.sendRedirect("cangku/list.jsp");

		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
