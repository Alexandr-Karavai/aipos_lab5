<%@page import="res.Data"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.ResourceBundle" %>
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
<%
    try {
        Data.delete(request.getParameter("hiddenID"));
        logger.info("Successful remove");
    } catch (SQLException e) {
        logger.error("Error remove : ",e);
    }
%>
<a href="info.jsp"><%=res.getString("back.btn")%></a>
<h2 class="centre"><%=res.getString("delete.value")%></h2>
</body>
</html>
