<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>hoạt động thành công!</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
	
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("Đã thêm thông tin loại sách thành công!");
		opener.location.reload();
		window.close();
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("Thông tin loại sách đã sửa đổi thành công!");
		opener.location.reload();
		window.close();
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("Đã xóa thông tin loại sách thành công!");
		window.location.href="book?action=bookTypeQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>