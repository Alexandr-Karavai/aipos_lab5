<%@ page import="java.util.ResourceBundle" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>WinAPI</title>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
  <body>
  <%!ResourceBundle res = ResourceBundle.getBundle("lang_ru_RU");%>
    <ul class="menuList">
      <li class="menu"><a href="index.jsp"><%=res.getString("menu.main")%></a></li>
      <li class="menu"><a href="info.jsp"><%=res.getString("menu.info")%></a></li>
      <li class="menu"><a href="new.jsp"><%=res.getString("menu.add")%></a></li>
    </ul>
        <div class="centre">
          <h3 type="text"><%=res.getString("index.title")%></h3>
        </div>
  </body>
</html>
