<%@page import="res.WinApi"%>
<%@page import="res.Data"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="res.WinApi" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>WinAPI</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%!ResourceBundle res = ResourceBundle.getBundle("lang_ru_RU");%>
    <ul class="menuList">
        <li class="menu"><a href="index.jsp">Главная</a></li>
        <li class="menu"><a href="info.jsp">Информация</a></li>
        <li class="menu"><a href="new.jsp">Добавить</a></li>
    </ul>
    <%! static Logger logger = Logger.getLogger("edit.jsp"); %>
    <%
            request.setCharacterEncoding("UTF-8");
            WinApi winapi = null;
            try {
                winapi = Data.getWinApi(request.getParameter("hiddenID"));
                logger.info("Successful request ID");
            } catch (SQLException e) {
                logger.error("Error getting id",e);
            }
        %>
    <form class="centre" action="successEdit.jsp" method="post">
        <h3>Редактировать</h3><br>
            <input type="hidden" name="hiddenID" value=<%=winapi.getId()%>>
            <b>Функция: </b><br>
        <textarea name="functionArea" rows="5" cols="100" maxlength="90"><%=winapi.getNameAndParameters() %></textarea><br>
            Синтаксис: <br>
        <textarea name="syntacsisArea" rows="5" cols="100" maxlength="90"><%=winapi.getProcedureOrFunction() %></textarea><br>
            Параметры: <br>
        <textarea name="parametrsArea" rows="5" cols="100" maxlength="90"><%=winapi.getParameterTypes() %></textarea><br>
            Возвращаемые значения: <br>
        <textarea name="returnTypeArea" rows="5" cols="100" maxlength="1000"><%=winapi.getReturnType() %></textarea><br>
            Описание: <br>
        <textarea name="actArea" rows="5" cols="100" maxlength="1000"><%=winapi.getAct() %></textarea><br>
            <input class="button" type="submit" value="Изменить"/>
    </form>
</body>
</html>
