﻿package com.wms.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class RukuAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RukuAction() {
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

		String huowubianhao = request.getParameter("huowubianhao");
		String jingbanren = request.getParameter("jingbanren");
		String rukushijian = request.getParameter("rukushijian");
		String rukudanjia = request.getParameter("rukudanjia");
		String rukushuliang = request.getParameter("rukushuliang");
		String gongyingshang = request.getParameter("gongyingshang");
		String cangkubianhao = request.getParameter("cangkubianhao");
		String dingdan = request.getParameter("dingdan");
		String qitajine = request.getParameter("qitajine");
		String beizhu = request.getParameter("beizhu");
		
		DBManager dbm = new DBManager();
		
		
		String sql = "insert into ruku values('" + huowubianhao + "','" + jingbanren
				+ "','"+rukushijian+"','" + rukudanjia + "','"+rukushuliang+"','"+gongyingshang+"','"+cangkubianhao+"','"+dingdan+"','"+qitajine+"','"+beizhu+"')";
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
		AddLog.addLog(request.getSession().getAttribute("user").toString(), "货物入库");
		
		
		//huowubianhao cangkubianhao
		try {
			String qSql="select * from kucun where bianhao='"+huowubianhao+"' and cangkuhao='"+cangkubianhao+"'";
			conn = dbm.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(qSql);
			stat = conn.createStatement();
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				sql="update kucun set shuliang=shuliang+"+rukushuliang+" where  bianhao='"+huowubianhao+"' and cangkuhao='"+cangkubianhao+"'";
				
			}else{
				sql="insert into kucun values('"+huowubianhao+"',"+rukushuliang+",'"+cangkubianhao+"')";
				 
			}
			System.out.println(sql);
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
		response.sendRedirect("ruku/list.jsp");

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
