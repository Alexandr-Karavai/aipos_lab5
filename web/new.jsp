<%@ page import="java.util.ResourceBundle" %>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%=res.getString("title.value")%></title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%!ResourceBundle res = ResourceBundle.getBundle("lang_ru_RU");%>
    <ul class="menuList">
        <li class="menu"><a href="index.jsp"><%=res.getString("menu.main")%></a></li>
        <li class="menu"><a href="info.jsp"><%=res.getString("menu.info")%></a></li>
        <li class="menu"><a href="new.jsp"><%=res.getString("menu.add")%></a></li>
    </ul>
            <form class="centre" action="add.jsp" method="post">
                <h3><%=res.getString("new.title")%></h3><br>
                    <p><%=res.getString("function.value")%></p>
                <textarea  name="functionArea" rows="5" cols="100" maxlength="90"></textarea><br>
                    <p><%=res.getString("syntacsis.value")%></p>
                <textarea  name="syntacsisArea" rows="5" cols="100" maxlength="90"></textarea><br>
                    <p><%=res.getString("parametrs.value")%></p>
                <textarea  name="parametrsArea" rows="5" cols="100" maxlength="90"></textarea><br>
                    <p><%=res.getString("returntype.value")%></p>
                <textarea  name="returnTypeArea" rows="5" cols="100" maxlength="1000"></textarea><br>
                    <p><%=res.getString("act.value")%></p>
                <textarea  name="actArea" rows="5" cols="100" maxlength="1000"></textarea><br>
                    <input class="button" type="submit" name="press" value="<%=res.getString("add.btn")%>"/>
            </form>
</body>
</html>