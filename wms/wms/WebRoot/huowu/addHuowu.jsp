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

		<title>添加货物</title>

		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<script language="javascript" type="text/javascript"
			src="<%=path%>/My97DatePicker/WdatePicker.js">
</script>
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
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
		<form action="AddHuowuAction" method="post">
			<table width="43%" border="0" align="center" cellspacing="1"
				bordercolor="#000000" bgcolor="#0000CC">
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							货物编号 ：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="bianhao" type="text" id="bianhao">
						</label>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							货物名称 ：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="mingcheng" type="text" id="mingcheng">
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							货物类别 ：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="leibie" type="text" id="leibie">
					</td>
				</tr>


				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							货物规格：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="guige" type="text" id="guige">
					</td>
				</tr>


				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							计量单位：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="jiliang" name="jiliang" type="text" />

					</td>
				</tr>
				
				
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							最高限量：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="zuigao" name="zuigao" type="text" />

					</td>
				</tr>
				
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							最低限量 ：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="zuidi" name="zuidi" type="text" />

					</td>
				</tr>
				
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							备注  ：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="beizhu" name="beizhu" type="text" />

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
			</table>
		</form>
	</body>
</html>
