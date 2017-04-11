<%@page import="res.WinApi"%>
<%@page import="res.Data"%>
<%@ page import="java.sql.SQLException" %>
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
<%! static Logger logger = Logger.getLogger("successEdit.jsp"); %>
<%request.setCharacterEncoding("UTF-8"); %>
    <%WinApi winapi = new WinApi("id",request.getParameter("functionArea"),request.getParameter("syntacsisArea"),
            request.getParameter("parametrsArea"),request.getParameter("returnTypeArea"),
            request.getParameter("actArea"));%>
    <%
        try {
            Data.editWinApi(winapi, request.getParameter("hiddenID"));
            logger.info("Success edition");
        } catch (SQLException e) {
            logger.error("Error adding to MySQL",e);
        }
    %>
<a href="info.jsp"><%=res.getString("back.btn")%></a>
<h2 class="centre"><%=res.getString("successedit.title")%></h2>
</body>
</html>
