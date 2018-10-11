<%@ page language="java"
	import="java.util.*,java.sql.*,com.wms.db.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>盘点修改</title>

		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
		<script language="javascript" type="text/javascript"
			src="<%=path%>/My97DatePicker/WdatePicker.js">
</script>
		<style type="text/css">
<!--
.STYLE3 {
	font-size: 16px
}
-->
</style>
	</head>

	<body>

		<p>
			&nbsp;


		</p>
		<p>
			&nbsp;


		</p>
		<%
			DBManager dbm = new DBManager();
			Connection conn = dbm.getConnection();
			String id = request.getParameter("id");
			String sql = "select * from pandian where id=" + id + "";
			PreparedStatement stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			rs.next();
		%>
		<form action="ModPandianAction" method="post">
			<table width="43%" border="0" align="center" cellspacing="1"
				bordercolor="#000000" bgcolor="#0000CC">
			 
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							仓库编号 ：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label><input name="id" type="hidden" id="id"
								value="<%=rs.getString("id")%>" readonly="true">
							<input name="cangku" type="text" id=cangku  value="<%=rs.getString("cangku")%>">
						</label>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							盘点时间  ：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="shijian" type="text" id="shijian" value="<%=rs.getString("shijian")%>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"   class="Wdate">
					</td>
				</tr>
				


				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							经办人：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="jingbanren" type="text" value="<%=rs.getString("jingbanren")%>" id="jingbanren">
					</td>
				</tr>


				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							盘点数据：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="pandianshuju" name="pandianshuju" value="<%=rs.getString("pandianshuju")%>" type="text" />

					</td>
				</tr>
				
				
				<tr>
					<td colspan="2" bgcolor="#FFFFFF">
						<label>
							<div align="center">
								<input type="submit" name="Submit" value="提交">
								<input type="reset" name="Submit2" value="重置">
							</div>
						</label>
					</td>
				</tr>
				<%
					if (rs != null)
						rs.close();
					if (stat != null)
						stat.close();
					if (conn != null)
						conn.close();
				%>
			</table>
		</form>
	</body>
</html>
