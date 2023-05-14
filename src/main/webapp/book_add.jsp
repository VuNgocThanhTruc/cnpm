<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<html>
<script language="jscript">
    function check(form) {
        if (form.barcode.value == "") {
            alert("Vui lòng nhập barcode!");
            form.barcode.focus();
            return false;
        }
        if (form.bookName.value == "") {
            alert("Vui lòng nhập tên sách!");
            form.bookName.focus();
            return false;
        }
        if (form.price.value == "") {
            alert("Vui lòng nhập giá sách!");
            form.price.focus();
            return false;
        }
    }
</script>
<head>
    <title>Library Manager</title>
    <link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>

<%--3. Điền thông tin và chọn vào nút thêm sách--%>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="510" valign="top" style="padding:5px;">
                        <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="22" valign="top" class="word_orange">Quản lý sách &gt; Thêm sách &gt;&gt;&gt;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table width="100%" height="493" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" valign="top">
                                                <form name="form1" method="post" action="book?action=bookAdd">
                                                    <table width="600" height="432" border="0" cellpadding="0"
                                                           cellspacing="0" bgcolor="#FFFFFF">
                                                        <tr>
                                                            <td width="173" align="center">Barcode：</td>
                                                            <td width="427" height="39">
                                                                <input name="barcode" type="text" id="barcode">
                                                                *
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">Tên sách：</td>
                                                            <td height="39"><input name="bookName" type="text"
                                                                                   id="bookName" size="50">
                                                                *
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">loại sách：</td>
                                                            <td>
                                                                <select name="typeId" class="wenbenkuang" id="typeId">
                                                                    <c:forEach items="${btfs }" var="bt">
                                                                        <option value="${bt.id }">${bt.typeName }</option>
                                                                    </c:forEach>
                                                                </select></td>
                                                        </tr>
                                                        <tr>
                                                                <td align="center">tác giả：</td>
                                                            <td><input name="author" type="text" id="author" size="40">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">Người dịch：</td>
                                                            <td><input name="translator" type="text" id="translator"
                                                                       size="40"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">Nhà xuất bản：</td>
                                                            <td><select name="isbn" class="wenbenkuang">
                                                                <c:forEach items="${pfs }" var="p">
                                                                    <option value="${p.isbn }">${p.publishName }</option>
                                                                </c:forEach>
                                                            </select></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">Giá sách：</td>
                                                            <td><input name="price" type="text" id="price">
                                                                (VND) *
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">Số trang：</td>
                                                            <td><input name="page" type="text" id="page"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">Vị trí sách：</td>
                                                            <td><select name="bookcaseid" class="wenbenkuang"
                                                                        id="bookcaseid">
                                                                <c:forEach items="${bcfs }" var="bc">
                                                                    <option value="${bc.id }">${bc.name }</option>
                                                                </c:forEach>

                                                            </select>
                                                                <input name="operator" type="hidden" id="operator"
                                                                       value="${username }"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">&nbsp;</td>
                                                            <td>
<%--                                                                3.1 check()--%>
                                                                <input name="Submit" type="submit" class="btn_grey"
                                                                       value="Thêm sách" onClick="return check(form1)">
                                                                &nbsp;
                                                                <input name="Submit2" type="button" class="btn_grey"
                                                                       value="Hủy" onClick="history.back()"></td>
                                                        </tr>
                                                    </table>
                                                </form>
                                            </td>
                                        </tr>
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
