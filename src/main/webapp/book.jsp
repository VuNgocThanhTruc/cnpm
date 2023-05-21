<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>hệ thống quản lý thư viện</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="510" valign="top" style="padding:5px;">
                        <table width="98%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="22" valign="top" class="word_orange">Quản lý sách</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <c:if test="${fflag=='no' }">
                                                <td height="36" align="center">Không có thông tin sách！</td>
                                            </c:if>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="87%">&nbsp;</td>
                                            <td width="13%">
                                                <%--1. Nhấn vào "Thêm sách mới"--%>
                                                <%--1.1 Gọi service(HttpServletRequest req, HttpServletResponse resp)--%>
                                                <a href="book?action=bookAddQuery">Thêm sách mới</a></td>
                                        </tr>
                                    </table>
                                    <table width="98%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="13%" bgcolor="#F9D16B">Barcode</td>
                                            <td width="26%" bgcolor="#F9D16B">Tên sách</td>
                                            <td width="15%" bgcolor="#F9D16B">Loại sách</td>
                                            <td width="14%" bgcolor="#F9D16B">Nhà xuất bản</td>
                                            <td width="12%" bgcolor="#F9D16B">Giá sách</td>
                                            <td width="9%" bgcolor="#F9D16B">Sửa</td>
                                            <td width="5%" bgcolor="#F9D16B">Xóa</td>
                                        </tr>
                                        <c:forEach items="${bfs }" var="b">
                                            <tr>
                                                <td style="padding:5px;">&nbsp;${b.bookBarcode }</td>
                                                <td style="padding:5px;"><a
                                                        href="book?action=bookDetail&id=${b.id }">${b.bookName }</a>
                                                </td>
                                                <td style="padding:5px;">&nbsp;${b.bookTypeName }</td>
                                                <td style="padding:5px;">&nbsp;${b.publishName }</td>
                                                <td style="padding:5px;">&nbsp;${b.bookcaseName }</td>

                                                <td align="center"><a
                                                        href="book?action=bookModifyQuery&id=${b.id }">Sửa</a></td>
                                                <!-- Nguyễn Thanh Liêm 
                                                1.Nhấn vào nút xóa sách ở trang book.jsp  -->
                                                <td align="center"><a href="book?action=bookDel&id=${b.id }">Xóa</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </td>
                            </tr>
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
