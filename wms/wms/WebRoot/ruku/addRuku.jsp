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

		<title>入库</title>

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
		<form action="RukuAction" method="post">
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
							<input name="huowubianhao" type="text" id="huowubianhao">
						</label>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							经办人 ：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="jingbanren" type="text" id="jingbanren">
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							入库时间 ：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="rukushijian" type="text" id="rukushijian" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"   class="Wdate">
					</td>
				</tr>


				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							入库单价：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="rukudanjia" type="text" id="rukudanjia">
					</td>
				</tr>


				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							入库数量：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="rukushuliang" name="rukushuliang" type="text" />

					</td>
				</tr>
				
				
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							供应商：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="gongyingshang" name="gongyingshang" type="text" />

					</td>
				</tr>
				
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							仓库编号：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="cangkubianhao" name="cangkubianhao" type="text" />

					</td>
				</tr>
				
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							定单状况  ：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="dingdan" name="dingdan" type="text" />

					</td>
				</tr>
				
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							其它金额：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input id="qitajine" name="qitajine" type="text" />

					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							备注   ：
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
