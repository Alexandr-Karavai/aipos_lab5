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
    <div id="main">
        <ul  id="holder">
            <%for (int i = 0; i<winapis.size(); i++){%>
                 <li class="scroll">
                    <a><%=res.getString("id.value")%> <%= winapis.get(i).getId() %></a>
                    <br>
                        <div class="infoBloc">
                                <b><%=res.getString("function.value")%></b><%=winapis.get(i).getNameAndParameters() %><br>
                                <b><%=res.getString("syntacsis.value")%></b><%=winapis.get(i).getProcedureOrFunction() %><br>
                                <b><%=res.getString("parametrs.value")%></b><%=winapis.get(i).getParameterTypes() %><br>
                                <b><%=res.getString("returntype.value")%></b><%=winapis.get(i).getReturnType() %><br>
                                <b><%=res.getString("act.value")%></b><%=winapis.get(i).getAct() %><br>
                                        <form action="edit.jsp" method="post">
                                            <input type="hidden" name="hiddenID" value=<%=winapis.get(i).getId()%>>
                                            <input class="button" type="submit" name="press" value="<%=res.getString("edit.btn")%>" />
                                        </form>

                                        <form action="delete.jsp" method="post">
                                            <input type="hidden" name="hiddenID" value=<%=winapis.get(i).getId()%>>
                                            <input class="button" type="submit" name="press1" value="<%=res.getString("delete.btn")%>" />
                                        </form><br>
                        </div><br>
            <%} %>
                 </li>
        </ul>
    </div>
    <a href="index.jsp"><%=res.getString("back.main")%></a>
</body>
</html>
