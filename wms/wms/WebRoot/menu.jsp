<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
   String isadmin=(String)request.getSession().getAttribute("isadmin");
 %>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
		<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
	</HEAD>
	<BODY>
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width=170
			background=images/menu_bg.jpg border=0>
			<TR>
				<TD vAlign=top align=middle>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>

						<TR>
							<TD height=10></TD>
						</TR>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>

						<TR height=22>
							<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
								<A class=menuParent onclick=expand(1) href="javascript:void(0);">仓库管理</A>
							</TD>
						</TR>
						<TR height=4>
							<TD></TD>
						</TR>
					</TABLE>
					<TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0
						width=150 border=0>
						
						<TR height=20>
							<TD align=middle width=30>
								<IMG height=9 src="images/menu_icon.gif" width=9>
							</TD>
							<TD>
								<A class=menuChild href="cangku/list.jsp" target=main>仓库管理</A>
							</TD>
						</TR>
						
					
					
						<TR height=4>
							<TD colSpan=2></TD>
						</TR>
					</TABLE>
					
					
					
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>

						<TR height=22>
							<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
								<A class=menuParent onclick=expand(2) href="javascript:void(0);">货物信息管理</A>
							</TD>
						</TR>
						<TR height=4>
							<TD></TD>
						</TR>
					</TABLE>
					<TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0
						width=150 border=0>
						
						<TR height=20>
							<TD align=middle width=30>
								<IMG height=9 src="images/menu_icon.gif" width=9>
							</TD>
							<TD>
								<A class=menuChild href="huowu/list.jsp" target=main>货物信息管理</A>
							</TD>
						</TR>
						
					
						
						<TR height=4>
							<TD colSpan=2></TD>
						</TR>
					</TABLE>
					
					
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>

						<TR height=22>
							<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
								<A class=menuParent onclick=expand(3) href="javascript:void(0);">货物管理</A>
							</TD>
						</TR>
						<TR height=4>
							<TD></TD>
						</TR>
					</TABLE>
					<TABLE id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0
						width=150 border=0>
						<TR height=20>
							<TD align=middle width=30>
								<IMG height=9 src="images/menu_icon.gif" width=9>
							</TD>
							<TD>
								<A class=menuChild href="ruku/list.jsp" target=main>入库管理</A>
							</TD>
						</TR>
						
					 
						<TR height=20>
							<TD align=middle width=30>
								<IMG height=9 src="images/menu_icon.gif" width=9>
							</TD>
							<TD>
								<A class=menuChild href="chuku/list.jsp" target=main>出库管理</A>
							</TD>
						</TR>
						
						<TR height=20>
							<TD align=middle width=30>
								<IMG height=9 src="images/menu_icon.gif" width=9>
							</TD>
							<TD>
								<A class=menuChild href="kucun/list.jsp" target=main>库存状况查看</A>
							</TD>
						</TR>
					 
						
					
						
						<TR height=4>
							<TD colSpan=2></TD>
						</TR>
					</TABLE>
					
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>

						<TR height=22>
							<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
								<A class=menuParent onclick=expand(8) href="javascript:void(0);">盘点管理</A>
							</TD>
						</TR>
						<TR height=4>
							<TD></TD>
						</TR>
					</TABLE>
					<TABLE id=child8 style="DISPLAY: none" cellSpacing=0 cellPadding=0
						width=150 border=0>
						
						<TR height=20>
							<TD align=middle width=30>
								<IMG height=9 src="images/menu_icon.gif" width=9>
							</TD>
							<TD>
								<A class=menuChild href="pandian/list.jsp" target=main>月盘点</A>
							</TD>
						</TR>
						
					
					
						<TR height=4>
							<TD colSpan=2></TD>
						</TR>
					</TABLE>
					
					
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>

						<TR height=22>
							<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
								<A class=menuParent onclick=expand(18) href="javascript:void(0);">操作日志</A>
							</TD>
						</TR>
						<TR height=4>
							<TD></TD>
						</TR>
					</TABLE>
					<TABLE id=child18 style="DISPLAY: none" cellSpacing=0 cellPadding=0
						width=150 border=0>
						
						<TR height=20>
							<TD align=middle width=30>
								<IMG height=9 src="images/menu_icon.gif" width=9>
							</TD>
							<TD>
								<A class=menuChild href="log/list.jsp" target=main>操作日志查看</A>
							</TD>
						</TR>
						
					
					
						<TR height=4>
							<TD colSpan=2></TD>
						</TR>
					</TABLE>
					
					
					
					
					
					
					
					
					<%
						   if(isadmin.equals("y")){
						   
						 %>
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>

						<TR height=22>
							<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
								<A class=menuParent onclick=expand(5) href="javascript:void(0);">系统维护</A>
							</TD>
						</TR>
						<TR height=4>
							<TD></TD>
						</TR>
					</TABLE>
					<TABLE id=child5 style="DISPLAY: none" cellSpacing=0 cellPadding=0
						width=150 border=0>
						<TR height=20>
							<TD align=middle width=30>
								<IMG height=9 src="images/menu_icon.gif" width=9>
							</TD>
							<TD>
								<A class=menuChild href="admin/list.jsp" target=main>管理员信息维护</A>
							</TD>
						</TR>
					
						
					
						
						<TR height=4>
							<TD colSpan=2></TD>
						</TR>
					</TABLE>
					
					<%} %>
					<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>

						<TR height=22>
							<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
								<A class=menuParent onclick=expand(0) href="javascript:void(0);">退出系统</A>
							</TD>
						</TR>
						<TR height=4>
							<TD></TD>
						</TR>
					</TABLE>
					<TABLE id=child0 style="DISPLAY: none" cellSpacing=0 cellPadding=0
						width=150 border=0>

						
						<TR height=20>
							<TD align=middle width=30>
								<IMG height=9 src="images/menu_icon.gif" width=9>
							</TD>
							<TD>
								<A class=menuChild
									onclick="if (confirm('确定要退出吗？')) return true; else return false;"
									href="login.jsp" target=_top>退出系统</A>
							</TD>
						</TR>
					</TABLE>
				</TD>
				<TD width=1 bgColor=#d1e6f7>&nbsp; <br></TD>
			</TR>
		</TABLE>
	</BODY>
</HTML>