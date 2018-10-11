package com.wms.action;

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
public class ChukuAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChukuAction() {
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
		String chukushijian = request.getParameter("chukushijian");
		String chukudanjian = request.getParameter("chukudanjian");
		String chukushuliang = request.getParameter("chukushuliang");
		String kehu = request.getParameter("kehu");
		String cangkubianhao = request.getParameter("cangkubianhao");
		String dingdan = request.getParameter("dingdan");
		String qitajine = request.getParameter("qitajine");
		String beizhu = request.getParameter("beizhu");
		
		DBManager dbm = new DBManager();
		
		
		String sql = "insert into chuku values('" + huowubianhao + "','" + jingbanren
				+ "','"+chukushijian+"','" + chukudanjian + "','"+chukushuliang+"','"+kehu+"','"+cangkubianhao+"','"+dingdan+"','"+qitajine+"','"+beizhu+"')";
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
		
		AddLog.addLog(request.getSession().getAttribute("user").toString(), "货物出库");
		
		
		try {
			String qSql="select * from kucun where bianhao='"+huowubianhao+"' and cangkuhao='"+cangkubianhao+"'";
			conn = dbm.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(qSql);
			stat = conn.createStatement();
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				sql="update kucun set shuliang=shuliang-"+chukushuliang+" where  bianhao='"+huowubianhao+"' and cangkuhao='"+cangkubianhao+"'";
				stat.execute(sql);
			} 
			System.out.println(sql);
			
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
		
		
		response.sendRedirect("chuku/list.jsp");

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
