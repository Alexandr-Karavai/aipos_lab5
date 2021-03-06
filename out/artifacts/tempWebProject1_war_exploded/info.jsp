<%@page import="res.Data"%>
<%@page import="res.WinApi"%>
<%@page import="java.util.List"%>
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
    <ul class="menuList">
        <li class="menu"><a href="index.jsp"><%=res.getString("menu.main")%></a></li>
        <li class="menu"><a href="info.jsp"><%=res.getString("menu.info")%></a></li>
        <li class="menu"><a href="new.jsp"><%=res.getString("menu.add")%></a></li>
    </ul>
        <div class="centre">
            <h3><%=res.getString("info.title")%></h3>
        </div>
    <%! static Logger logger = Logger.getLogger("info.jsp"); %>
    <%
                    logger.info("Show info about function");
                    List<WinApi> winapis = null;
                    try {
                        winapis = Data.getWinApis();
                    } catch (SQLException e) {
                        logger.error("Error in show : ",e);
                    }
                %>
            <%for (int i = 0; i<winapis.size(); i++){%>
    <div id="mainInfo" itemscope itemtype="http://schema.org/Thing/CreativeWork/Article/TechArticle/APIReference">
                    <span itemprop="identifier"><a><%=res.getString("id.value")%> <%= winapis.get(i).getId() %></a></span>
                    <br>
                         <span itemprop="name"><b ><%=res.getString("function.value")%></b><%=winapis.get(i).getNameAndParameters() %><br></span>
                         <span itemprop="description" ><b><%=res.getString("act.value")%></b><%=winapis.get(i).getAct() %><br></span>
                                        <form action="edit.jsp" method="post">
                                            <input type="hidden" name="hiddenID" value=<%=winapis.get(i).getId()%>>
                                            <input class="button" type="submit" name="press" value="<%=res.getString("edit.btn")%>" />
                                        </form>

                                        <form action="delete.jsp" method="post">
                                            <input type="hidden" name="hiddenID" value=<%=winapis.get(i).getId()%>>
                                            <input class="button" type="submit" name="press1" value="<%=res.getString("delete.btn")%>" />
                                        </form><br>
                        <br>
    </div>
            <%}%>

    <a href="index.jsp"><%=res.getString("back.main")%></a>
</body>
</html>
