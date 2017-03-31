<%@page import="res.WinApi"%>
<%@page import="res.Data"%>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>WinAPI</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%WinApi winapi = new WinApi("0",request.getParameter("1"),request.getParameter("2"),request.getParameter("3"),request.getParameter("4")
            ,request.getParameter("5"));%>
    <%
        try {
            Data.editWinApi(winapi, request.getParameter("hiddenID"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
<a href="info.jsp">Вернуться назад</a>
<h2 class="centre">Изменение прошло успешно</h2>
</body>
</html>
