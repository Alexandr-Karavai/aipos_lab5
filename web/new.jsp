<%@page pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>WinAPI</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <ul>
        <li><a href="index.jsp">Главная</a></li>
        <li><a href="info.jsp">Информация</a></li>
        <li><a href="new.jsp">Добавить</a></li>
    </ul>
            <form class="centre" action="add.jsp" method="post">
                <h3>Добавить новую функцию</h3><br>
                Функция: <br>
                <input type="text" name="1"/><br>
                Синтаксис: <br>
                <input type="text" name="2"/><br>
                Параметры: <br>
                <input type="text" name="3"/><br>
                Возвращаемые значения: <br>
                <input type="text" name="4"/><br>
                Описание: <br>
                <input type="text" name="5"/><br>
                <input class="button" type="submit" name="press" value="Добавить"/>
            </form>
</body>
</html>