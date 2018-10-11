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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>货物管理</title>
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="Js/CheckActivX.js">
</script>
		<script language="javascript">

function doPrint() {

	LODOP.PRINT_INIT("打印");
	LODOP.ADD_PRINT_HTM(88, 20, 700, 600,
			document.getElementById("printTable").innerHTML);
	LODOP.PREVIEW();
};
</script>
		<object id="LODOP"
			classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
		</object>
		<script language="javascript">
CheckLodop();</script>
<script language="javascript" type="text/javascript"
			src="<%=path%>/My97DatePicker/WdatePicker.js"></script>
	</head>
	<body leftmargin="8" topmargin="8"'>

		<!--  快速转换位置按钮  -->
		<!--  内容列表   -->
		<form name="form2">
			<div id="printTable">
				<table width="98%" border="0" cellpadding="2" cellspacing="1"
					bgcolor="#3333FF" align="center" style="margin-top: 8px">
					<tr bgcolor="#E7E7E7">
						<td height="24" colspan="10" background="skin/images/tbg.gif">
							&nbsp;货物管理&nbsp;
						</td>
					</tr>
					<tr align="center" bgcolor="#FAFAF1" height="22">
						<td width="5%">
							编号
						</td>
						<td width="10%">
							货物名称
						</td>
						<td width="10%">
							货物类别
						</td>

						<td width="10%">
							货物规格
						</td>
						
						<td width="10%">
							计量单位
						</td>
						<td width="10%">
							最高限量
						</td>
						
						<td width="10%">
							最低限量
						</td>
						
						<td width="10%">
							备注
						</td>
						
						

						<td width="13%">
							操作
						</td>
					</tr>


					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						
					 
						
						
						
						String sql = "select * from huowu p  where 1=1";
						if (queryName != null && queryName.length() > 0) {
							sql = sql + " and p.mingcheng like '%" + queryName + "%'";
						}
						
						
					 
						
					
						
						

						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						int count = 0;

						while (rs.next()) {
							count++;
							String id = rs.getString("id");
					%>

					<tr align='center' bgcolor="#FFFFFF"
						onMouseMove="javascript:this.bgColor='#FCFDEE';"
						onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						
						<td><%=rs.getString("bianhao")%>

						</td>
						<td align="left">
							<div align="center">
								<%=rs.getString("mingcheng")%>

							</div>
						</td>

						<td>
							<%=rs.getString("leibie")%>
						</td>
						
						<td>
							<%=rs.getString("guige")%>
						</td>
						<td>
							<%=rs.getString("jiliang")%>
						</td>
						
						<td>
							<%=rs.getString("zuigao")%>
						</td>
						
						<td>
							<%=rs.getString("zuidi")%>
						</td>
						
						<td>
							<%=rs.getString("beizhu")%>
						</td>
						
						

						<td>
							<a href="huowu/modHuowu.jsp?id=<%=id%>">编辑</a> |
							<a href="DelHuowuAction?id=<%=id%>">删除</a>
						</td>
					</tr>

					<%
						}
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					%><tr bgcolor="#E7E7E7">
						<td height="24" colspan="10" background="skin/images/tbg.gif">
							&nbsp;共有记录<%=count%>条&nbsp;
						</td>
					</tr>

					<tr bgcolor="#FAFAF1">
						<td height="28" colspan="10">
							&nbsp;
							<input type="button" onClick="doPrint();" border="0" class="np"
								value='打印' />
							&nbsp;&nbsp;
							<a href="huowu/addHuowu.jsp"><strong>添加货物</strong> </a>
						</td>

					</tr>

				</table>
			</div>
		</form>

		<!--  搜索表单  -->
		<form action="huowu/list.jsp" method="post">

			<table width='98%' border='0' cellpadding='1' cellspacing='1'
				bgcolor='#CBD8AC' align="center" style="margin-top: 8px">
				<tr bgcolor='#EEF4EA'>
					<td align='center'>

						<table width="624" border='0' cellpadding='0' cellspacing='0'>
							<tr>
								<td width='129'>
									货物名：
								</td>
								<td width='367'>
									<input type='text' name='queryName' value=''
										style='width: 150px' />
								</td>
								<td width='64'>

								</td>
								<td width="64">
									&nbsp;

								</td>
							</tr>
							
							<tr>
							  
								<td width='64'>
									<input name="imageField" type="submit" border="0" class="np"
										value='查询' />
								</td>
								<td width="64">&nbsp;
									
								</td>
							</tr>

							
						</table>

					</td>
				</tr>
			</table>
		</form>
	</body>
</html>