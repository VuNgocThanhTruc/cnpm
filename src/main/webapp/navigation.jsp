<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.xxbb.dao.impl.ManagerDaoImpl"%>
<%@ page import="com.xxbb.dao.ManagerDao"%>
<%@ page import="com.xxbb.actionform.ManagerForm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String navigationUserName = (String)session.getAttribute("username");
	ManagerDao mgd = new ManagerDaoImpl();
	ManagerForm temp=new ManagerForm();
	temp.setName(navigationUserName);
	List<ManagerForm> mgfs = mgd.query(temp);
	ManagerForm mgf = (ManagerForm) mgfs.get(0);
	request.setAttribute("manager", mgf);
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="JS/onclock.JS"></script>
<script src="JS/menu.JS"></script>
<div class=menuskin id=popmenu
	onmouseover="clearhidemenu();highlightmenu(event,'on')"
	onmouseout="highlightmenu(event,'off');dynamichide(event)"
	style="Z-index: 100; position: absolute;"></div>
<table width="778" border="0" align="center" cellpadding="0"
	cellspacing="0" bgcolor="#FFFFFF">
	<tr bgcolor="#DFA40C">
		<td width="3%" height="27" bgcolor="#c69a0a">&nbsp;</td>
		<td width="29%" bgcolor="#c69a0a"><div id="bgclock"
				class="word_white"></div></td>
		<script language="javascript">
			function quit() {
				if (confirm("Bạn có chắc muốn đăng xuất khỏi hệ thống?")) {
					window.location.href = "logout.jsp";
				}
			}
		</script>
		<td width="66%" align="right" bgcolor="#ad7c28" class="word_white"><a
			href="main.jsp" class="word_white">Trang chủ</a> | <%
			if (mgf.getSystemSet() == 1) {
		%><a
			onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu()
			class="word_white" style="CURSOR: hand">Cài đặt hệ thống</a> | <%
			}
		%>
			<%
				if (mgf.getReaderSet() == 1) {
			%><a onmouseover=showmenu(event,readermenu)
			onmouseout=delayhidemenu() style="CURSOR: hand" class="word_white">Quản lý độc giả</a>
			| <%
				}
			%>
			<%
				if (mgf.getBookSet() == 1) {
			%><a onmouseover=showmenu(event,bookmenu)
			onmouseout=delayhidemenu() class="word_white" style="CURSOR: hand">Quản lý thư viện</a>
			| <%
				}
			%>
			<%
				if (mgf.getBorrowSet() == 1) {
			%><a onmouseover=showmenu(event,borrowmenu)
			onmouseout=delayhidemenu() class="word_white" style="CURSOR: hand">Mượn sách</a>
			| <%
				}
			%>
			<%
				if (mgf.getSystemQuery() == 1) {
			%><a onmouseover=showmenu(event,querymenu)
			onmouseout=delayhidemenu() class="word_white" style="CURSOR: hand">Truy vấn hệ thống</a>
			| <%
				}
			%><a href="manager?action=pwdquery" class="word_white">Đổi mật khẩu</a> |
			<a href="#" onClick="quit()" class="word_white">Đăng xuất</a></td>
		<td width="2%" bgcolor="#ad7c28">&nbsp;</td>
	</tr>
	<tr bgcolor="#DFA40C">
		<td height="9" colspan="4"
			background="Images/navigation_bg_bottom.gif"></td>
	</tr>
</table>
