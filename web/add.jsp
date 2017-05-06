<%@ page import="res.Data"%>
<%@ page import="res.WinApi"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=res.getString("title.value")%></title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <%!ResourceBundle res = ResourceBundle.getBundle("lang_ru_RU");%>
    <%! static Logger logger = Logger.getLogger("delete.jsp"); %>

    <a href="index.jsp"><%=res.getString("back.main")%></a><br>

        <% request.setCharacterEncoding("UTF-8"); %>
        <% WinApi winapi = new WinApi("id",request.getParameter("functionArea"),request.getParameter("actArea")); %>
        <%
            try {
                Data.addWinApi(winapi);
                logger.info("Successful add new function");
            } catch (SQLException e) {
                logger.error("Error add : ",e);
            }
        %>
    <h2 class="centre"><%="Функция "+request.getParameter("functionArea")+" добавлена"%></h2>
</body>
</html>
