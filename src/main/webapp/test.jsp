<%--
  Created by IntelliJ IDEA.
  User: mateu
  Date: 02.10.2019
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
</head>
<body>

<form method="post" action="add">
    <label for="opis">opis </label>
    <input type="text" id="opis" name="taskDescription">
    <label for="dataZakonczenia"><fmt:message key="ms.nazwa.apki" bundle="${info}"/></label>
    <input type="datetime-local" id="dataZakonczenia" name="dataZakonczenia">
    <label for="prio"><fmt:message key="ms.dodaj" bundle="${info}"/></label>
    <input type="text" id="prio" name="priorityX">
    <input type="submit" value="Add">
</form>
<%=
request.getParameter("dataZakonczenia")%>
<%=request.getParameter("taskDescription")%>
<%=request.getParameter("priorityX")%>



</body>
</html>
