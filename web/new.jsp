<%@ page import="java.util.ResourceBundle" %>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <form class="centre" action="add.jsp" method="post">
                <h3>Добавить новую функцию</h3><br>
                Функция: <br>
                <textarea  name="functionArea" rows="5" cols="100" maxlength="90"></textarea><br>
                Синтаксис: <br>
                <textarea  name="syntacsisArea" rows="5" cols="100" maxlength="90"></textarea><br>
                Параметры: <br>
                <textarea  name="parametrsArea" rows="5" cols="100" maxlength="90"></textarea><br>
                Возвращаемые значения: <br>
                <textarea  name="returnTypeArea" rows="5" cols="100" maxlength="1000"></textarea><br>
                Описание: <br>
                <textarea  name="actArea" rows="5" cols="100" maxlength="1000"></textarea><br>
                <input class="button" type="submit" name="press" value="Добавить"/>
            </form>
</body>
</html>