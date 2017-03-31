<%@ page import="res.Data"%>
<%@ page import="res.WinApi"%>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>WinAPI</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <a href="index.jsp">Вернуться на главную страницу</a><br>
        <% request.setCharacterEncoding("UTF-8"); %>
        <%if (request.getParameter("1").length()<90 &&request.getParameter("2").length()<90 &&request.getParameter("3").length()<90 &&request.getParameter("4").length()<1000
                &&request.getParameter("5").length()<1000){ %>
        <% WinApi winapi = new WinApi("0",request.getParameter("1"),request.getParameter("2"),request.getParameter("3"),
                request.getParameter("4"),request.getParameter("5")); %>
        <%
            try {
                Data.addWinApi(winapi);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    <h2 class="centre"><%="Функция "+request.getParameter("1")+" добавлена"%></h2>
        <%} else {  %>
    <h2 class="centre">Невозможно добавить</h2>
        <%} %>
</body>
</html>
