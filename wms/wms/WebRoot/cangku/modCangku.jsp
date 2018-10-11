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

		<title>仓库信息修改</title>

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
			String sql = "select * from cangku where id=" + id + "";
			PreparedStatement stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			rs.next();
		%>
		<form action="ModCangkuAction" method="post">
			<table width="43%" border="0" align="center" cellspacing="1"
				bordercolor="#000000" bgcolor="#0000CC">
			 
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							编号 ：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label><input name="id" type="hidden" id="id"
								value="<%=rs.getString("id")%>" readonly="true">
							<input name="bianhao" type="text" id=bianhao  value="<%=rs.getString("bianhao")%>">
						</label>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							仓库名称  ：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="mingcheng" type="text" id="mingcheng" value="<%=rs.getString("mingcheng")%>">
					</td>
				</tr>
				


				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							仓库地点：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="didian" type="text" value="<%=rs.getString("didian")%>" id="didian">
					</td>
				</tr>


				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							保管员：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="baoguanyuan" name="baoguanyuan" value="<%=rs.getString("baoguanyuan")%>" type="text" />

					</td>
				</tr>
				
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							备注：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="beizhu" name="beizhu" value="<%=rs.getString("beizhu")%>" type="text"
							
							 />

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
