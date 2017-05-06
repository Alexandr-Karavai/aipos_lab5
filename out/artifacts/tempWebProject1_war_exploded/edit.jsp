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
        <h3><%=res.getString("edit.title")%></h3><br>
            <input type="hidden" name="hiddenID" value=<%=winapi.getId()%>>
            <p><%=res.getString("function.value")%></p>
        <textarea name="functionArea" rows="5" cols="100" maxlength="90"><%=winapi.getNameAndParameters() %></textarea>
            <p><%=res.getString("act.value")%></p>
        <textarea name="actArea" rows="5" cols="100" maxlength="1000"><%=winapi.getAct() %></textarea>
            <input class="button" type="submit" value="<%=res.getString("edit.btn")%>"/>
    </form>
</body>
</html>
