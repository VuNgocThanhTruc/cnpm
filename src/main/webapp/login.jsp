<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<title>Library Manager</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript">
  // HLinh
  // Usecase Login
  // B3: Kiểm tra đã điền đủ thông tin hay chưa
function check(form1){
	if (form1.name.value==""){
		alert("Vui lòng nhập tên người dùng!");form.name.focus();
      // B3.1:Thiếu thông tin, chuyển sang trang thông báo lỗi
        return false;
	}
	if (form1.pwd.value==""){
		alert("Vui lòng nhập mật khẩu!");form.pwd.focus();
		// B3.1:Thiếu thông tin, chuyển sang trang thông báo lỗi
        return false;
	}	
}
</script>
</head>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#c3a339" class="tableBorder">
  <tr>
    <td>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="142" valign="top">&nbsp;</td>
  </tr>
</table>
	</td>
  </tr>
	<td>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><table width="100%" height="525"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="523" align="center" valign="top"><table width="100%" height="271"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="271" align="right" valign="top" class="word_orange"><table width="100%" height="255"  border="0" cellpadding="0" cellspacing="0" background="Images/login.jpg">
          <tr>
            <td height="57">&nbsp;</td>
            </tr>
          <tr>
            <td height="179" valign="top"><table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="2%">&nbsp;</td>
                  <td width="97%" align="center" valign="top">
                    <form name="form1" method="post" action="manager?action=login">
                      <table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                        <tr>
                          <td height="57">&nbsp;</td>
                          <td height="57" colspan="2" align="center">&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr> 
                        <tr>
                          <td width="50%" height="37">&nbsp;</td>
<%--                          HLinh--%>
<%--                          Usecase Login--%>
<%--                          B1: Nhập sername, password vào form--%>
                      <td width="10%">Username：</td>
                      <td width="31%">
                        <input name="name" type="text" class="logininput" id="name" size="27">                        </td>
                      <td width="9%">&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="37">&nbsp;</td>
                      <td>Password：</td>
                      <td><input name="pwd" type="password" class="logininput" id="pwd" size="27"></td>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="30">&nbsp;</td>
<%--                          Hlinh --%>
<%--                          Usecase Login--%>
<%--                          B2: nhấn vào button Đăng nhập--%>
                      <td colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="Đăng nhập" onClick="return check(form1)">
                        &nbsp;
                        <input name="Submit3" type="reset" class="btn_grey" value="Quên mật khẩu?">&nbsp;
<%--                        <input name="Submit2" type="button" class="btn_grey" value="Đóng" onClick="window.close();"></td>--%>
                      <td>&nbsp;</td>
                    </tr>
                        </table> 
			  </form>				   </td>
                  <td width="1%">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          <tr>
            <td height="19">&nbsp;</td>
            </tr>
        </table></td>
      </tr>
      
    </table>
      <table width="100%" height="27"  border="0" cellpadding="0" cellspacing="0">
         <tr>
        <td width="124" height="23">&nbsp;</td>
        <td valign="bottom" align="center"> CopyRight &copy; 2023 LibraryManager</td>
        <td width="141">&nbsp;</td>
      </tr>
      <tr>
        <td height="23">&nbsp;</td>
        <td align="center">Trang web này khuyên bạn nên sử dụng trình duyệt lõi không phải IE để hoạt động</td>
        <td>&nbsp;</td>
      </tr>
      </table></td>
  </tr>
</table></td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
