<%@page import="com.xxbb.actionform.BookBorrowForm" %>
<%@page import="com.xxbb.actionform.ReaderForm" %>
<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*" %>
<html>
<%
    int borrowNumber = 0;
%>
<head>
    <title>Library Manager</title>
    <link href="CSS/style.css" rel="stylesheet">
    <script language="javascript">
        function checkreader(form) {
            if (form.barcode.value == "") {
                alert("Vui lòng nhập Barcode!");
                form.barcode.focus();
                return;
            }
            form.submit();
        }

        function checkbook(form) {
            if (form.barcode.value == "") {
                alert("Vui lòng nhập Barcode!");
                form.barcode.focus();
                return;
            }
            if (form.inputkey.value == "") {
                alert("Vui lòng nhập từ khóa cần tìm!");
                form.inputkey.focus();
                return;
            }
            if (form.number.value - form.borrowNumber.value <= 0) {
                alert("Bạn không thể mượn bất kỳ cuốn sách nào nữa!");
                return;
            }
            form.submit();
        }
    </script>
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table width="778" border="0" cellspacing="0" cellpadding="0"
       align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="100%"
                   height="509" border="0" align="center" cellpadding="0"
                   cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
                <tr>
                    <td height="27" valign="top" style="padding: 5px;"
                        class="word_orange">Quản lý mượn sách &gt; Mượn sách &gt;&gt;&gt;
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="top" style="padding: 5px;">
                        <table
                                width="100%" border="0" cellspacing="0" cellpadding="0">
                            <form name="form1" method="post"
                                  action="borrow?action=bookborrow">
                                <tr>
                                    <td height="47" background="Images/borrowBackRenew.gif">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="72" align="center" valign="top"
                                        background="Images/main_booksort_1.gif" bgcolor="#F8BF73">
                                        <table
                                                width="96%" border="0" cellpadding="1" cellspacing="0"
                                                bordercolor="#FFFFFF" bgcolor="#F8BF73">
                                            <tr>
                                                <td valign="top" bgcolor="#F8BF73">
                                                    <table width="100%" border="0" cellpadding="0"
                                                           cellspacing="0" bgcolor="#FFFFFF">


                                                        <tr>
                                                            <td>
                                                                <table width="90%" height="21" border="0"
                                                                       cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td width="24%" height="18"
                                                                            style="padding-left: 7px; padding-top: 7px;">
                                                                            <img
                                                                                    src="Images/reader_checkbg.jpg"
                                                                                    width="142"
                                                                                    height="18"></td>
                                                                        <td width="76%" style="padding-top: 7px;">
                                                                            Barcode：
                                                                            <input name="barcode" type="text"
                                                                                   id="barcode"
                                                                                   value="${readerinfo.barcode }"
                                                                                   size="24"> &nbsp; <input
                                                                                name="Button" type="button"
                                                                                class="btn_grey"
                                                                                value="Xác nhận"
                                                                                onClick="checkreader(form1)">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="13" align="left" style="padding-left: 7px;">
                                                                <hr
                                                                        width="90%" size="1">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <table width="96%" border="0"
                                                                       cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td height="27">Họ tên： <input
                                                                                name="readername" type="text"
                                                                                id="readername"
                                                                                value="${readerinfo.name }"></td>
                                                                        <td>Giới tính： <input
                                                                                name="sex" type="text" id="sex"
                                                                                value="${readerinfo.sex }"></td>
                                                                        <td>Loại người đọc： <input name="readerType"
                                                                                                   type="text"
                                                                                                   id="readerType"
                                                                                                   value="${readerinfo.typeName }">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="27">Loại giấy chứng nhận： <input
                                                                                name="paperType"
                                                                                type="text" id="paperType"
                                                                                value="${readerinfo.paperType }"></td>
                                                                        <td>Paper NO： <input name="paperNo" type="text"
                                                                                             id="paperNo"
                                                                                             value="${readerinfo.paperNO }">
                                                                        </td>
                                                                        <td>Cho phép mượn： <input name="number"
                                                                                                  type="text"
                                                                                                  id="number"
                                                                                                  value="${readerinfo.allowBorrowAmount }"
                                                                                                  size="17"> sách
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="32" background="Images/borrow_if.gif">&nbsp;Cơ sở để bổ
                                                    sung：
                                                    <input name="f" type="radio" class="noborder"
                                                           value="barcode" checked>Mã vạch sách &nbsp;&nbsp; <input
                                                            name="f" type="radio" class="noborder" value="bookname">
                                                    Tên sách&nbsp;&nbsp; <input name="inputkey" type="text"
                                                                                id="inputkey" size="50"> <input
                                                            name="Submit2"
                                                            type="submit" class="btn_grey" value="Xác nhận"
                                                            onClick="checkbook(form1)"> <input name="operator"
                                                                                               type="hidden"
                                                                                               id="operator"
                                                                                               value="${username }">
                                                    <input name="Button" type="button" class="btn_grey"
                                                           value="Xác nhận mượn"
                                                           onClick="window.location.href='bookBorrow.jsp'">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" bgcolor="#FCEC9A" style="padding: 5px">
                                                    <table
                                                            width="99%" border="1" cellpadding="0" cellspacing="0"
                                                            bordercolor="#FFFFFF" bordercolorlight="#FFFFFF"
                                                            bordercolordark="#F6B83B" bgcolor="#FFFFFF">
                                                        <tr align="center" bgcolor="#F9D16B">
                                                            <td width="29%" height="25">Tên sách</td>
                                                            <td width="12%">Thời gian vay</td>
                                                            <td width="14%">Đúng hạn</td>
                                                            <td width="17%">Nhà xuất bản</td>
                                                            <td width="14%">Giá sách</td>
                                                            <td colspan="2">Loại tiền (VND)</td>
                                                        </tr>
                                                        <c:forEach items="${borrowinfo }" var="b">
                                                            <tr>
                                                                <td height="25" style="padding: 5px;">
                                                                    &nbsp;${b.bookName }</td>
                                                                <td style="padding: 5px;">&nbsp;${b.borrowTime }</td>
                                                                <td style="padding: 5px;">&nbsp;${b.returnTime }</td>
                                                                <td align="center">&nbsp;${b.publishName }</td>
                                                                <td align="center">&nbsp;${b.bookcaseName }</td>
                                                                <td width="14%" align="center">&nbsp;${b.price }</td>
                                                            </tr>
                                                            <input name="addBorrowNumber" type="hidden"
                                                                   id="addBorrowNumber" value="<%=++borrowNumber%>">
                                                        </c:forEach>

                                                    </table>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>

                                </tr>
                                <tr>
                                    <td height="19" background="Images/main_booksort_2.gif">&nbsp;</td>
                                </tr>
                                <input name="borrowNumber" type="hidden" id="borrowNumber" value="<%=borrowNumber%>">
                            </form>
                        </table>
                    </td>
                </tr>
            </table>
            <%@ include file="copyright.jsp" %>
        </td>
    </tr>
</table>
</body>
</html>