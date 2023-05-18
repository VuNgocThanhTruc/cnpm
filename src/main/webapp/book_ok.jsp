<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Thông báo!</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("Đã thêm thông tin sách thành công!");
		window.location.href="book?action=bookInfoQuery";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("Thông tin sách đã sửa đổi thành công!");
		window.location.href="book?action=bookInfoQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("Đã xóa thông tin sách thành công!");
		window.location.href="book?action=bookInfoQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>