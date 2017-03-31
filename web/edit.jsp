<%@page import="res.WinApi"%>
<%@page import="res.Data"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="res.WinApi" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>WinAPI</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <ul>
        <li><a href="index.jsp">Главная</a></li>
        <li><a href="info.jsp">Информация</a></li>
        <li><a href="new.jsp">Добавить</a></li>
    </ul>
        <%
            request.setCharacterEncoding("UTF-8");
            WinApi winapi = null;
            try {
                winapi = Data.getWinApi(request.getParameter("hiddenID"));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    <form class="centre" action="successEdit.jsp" method="post">
        <h3>Редактировать</h3><br>
            <input type="hidden" name="hiddenID" value=<%=winapi.getId()%>>
            <b>Функция: </b><br>
                <input type="text" name="1" value="<%=winapi.getNameAndParameters() %>"><br>
            Синтаксис: <br>
                <input type="text" name="2" value="<%=winapi.getProcedureOrFunction() %>"><br>
            Параметры: <br>
                <input type="text" name="3" value="<%=winapi.getParameterTypes() %>"><br>
            Возвращаемые значения: <br>
                <input type="text" name="4" value="<%=winapi.getReturnType() %>"><br>
            Описание: <br>
                <input type="text" name="5" value="<%=winapi.getAct() %>"><br>
            <input class="button" type="submit" value="Изменить"/>
    </form>
</body>
</html>
