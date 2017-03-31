<%@page import="res.Data"%>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>WinAPI</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<%
    try {
        Data.delete(request.getParameter("hiddenID"));
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<a href="info.jsp">Вернуться назад</a>
<h2 class="centre">Удаление прошло успешно</h2>
</body>
</html>
