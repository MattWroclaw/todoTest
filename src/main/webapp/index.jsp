<
<%@ page import="pack.Task" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<fmt:setLocale value="de_DE"/>--%>
<fmt:setLocale value="${empty cookie.lang ? pageContext.response.locale : cookie.lang.value}"/>

<fmt:setBundle basename="wiadomosc" var="info"/>
<fmt:setBundle basename="language" var="languages"/>

<html>
<head>
    <title><fmt:message key="language.german" bundle="${languages}"/></title>
</head>
<html>
<body>
<h1><fmt:message key="ms.dodaj" bundle="${info}"/></h1>
${pageContext.response.locale}

<a href="index.jsp?lang=en_GB"><fmt:message key="language.english" bundle="${languages}"/> |</a>
<a href="index.jsp?lang=pl_PL"><fmt:message key="language.polish" bundle="${languages}"/> |</a>
<a href="index.jsp?lang=de_DE"><fmt:message key="language.german" bundle="${languages}"/> </a>

<%

    String lang = request.getParameter("lang");
    if (lang != null) {
        Cookie c = new Cookie("lang", lang);
        response.addCookie(c);
        response.sendRedirect("index.jsp");
    }

    List<Task> tasksLi = (List<Task>) session.getAttribute("tasksParamT");
    if (tasksLi == null) {
        tasksLi = new ArrayList<>();
        session.setAttribute("tasksParamT", tasksLi);
    }

    String newTaskDescription = request.getParameter("taskDescription");
    if (newTaskDescription != null) {
        Task task = new Task();
        task.setDesk(newTaskDescription);

        String date = request.getParameter("dataZakonczenia");
        if (date != null && !date.isEmpty()) {
            LocalDateTime finishDateTime = LocalDateTime.parse(
                    date, DateTimeFormatter.ISO_LOCAL_DATE_TIME
            );
            task.setFinishDate(finishDateTime);
        }

        String priorityParam = request.getParameter("priorityX");
        if (priorityParam != null && !priorityParam.isEmpty()) {
            task.setPriority(priorityParam);
        }

//        }else out.print("Nie wybrano nr indexu");

        tasksLi.add(task);
        response.sendRedirect("index.jsp");
    }


    if (newTaskDescription != null) {
        String kasowanieWpisuParam = request.getParameter("kasowanieWpisu");
        if (kasowanieWpisuParam != null && !kasowanieWpisuParam.isEmpty()) {
            int nrDoKas = Integer.parseInt(kasowanieWpisuParam);
            tasksLi.remove(nrDoKas);
        }
//        response.sendRedirect("index.jsp");
    }

%>


<form method="post" action="index.jsp">
    <label for="opis"><fmt:message key="ms.nowe.zadanie" bundle="${info}"/> </label>
    <input type="text" id="opis" name="taskDescription">

    <label for="dataZakonczenia"><fmt:message key="ms.nazwa.apki" bundle="${info}"/></label>
    <input type="datetime-local" id="dataZakonczenia" name="dataZakonczenia">

    <label for="prio"><fmt:message key="ms.priorytet" bundle="${info}"/></label>

    <select name="priorityX" id="prio">
        <option value="HI">HI</option>
        <option value="MID" selected>MID</option>
        <option value="LO">LOW</option>
    </select>
    <input type="submit" value="Add"><br>

    <label for="kasowanieId"> Kasowanie wpisu</label>
    <input type="number" id="kasowanieId" name="kasowanieWpisu">
    <input type="submit" value="Skasuj">
</form>
<br>
<form method="post" action="index.jsp">
    <h3>Sort by: </h3>
    <input type="submit" name="byDateUp" value="Date Up">
<%--    <input type="submit" name="byDateDown" value="Date Down">--%>
    <input type="submit" name="byPriorityUp" value="Priority Up">
<%--    <input type="submit" name="byPriorityDown" value="Prioriy Down">--%>
</form>
<%-- TO NARAZIE NIE POTRZEBNE..--%>
<%--<table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th><fmt:message key="ms.nowe.zadanie" bundle="${info}"/></th>--%>
<%--        <th><fmt:message key="ms.nazwa.apki" bundle="${info}"/></th>--%>
<%--        <th><fmt:message key="ms.dodaj" bundle="${info}"/></th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <c:forEach var="task" items="${sessionScope.tasksParamT}">--%>

<%--        <tr>--%>

<%--            <td>${tasksParamT.indexOf(task)}</td>--%>
<%--            <td>${tasksParamT.stream().count()}</td>--%>
<%--            <td>${task.desk}</td>--%>
<%--            <td>${task.finishDate}</td>--%>
<%--            <td>${task.priority}</td>--%>

<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>

<%
        String byDateParam = request.getParameter("byDateUp");
        if(byDateParam != null && !byDateParam.isEmpty()){
            if(tasksLi.size()>1){
            tasksLi.sort((o1, o2) -> o1.getFinishDate().compareTo(o2.getFinishDate()));
                for (Task t : tasksLi) {
                out.print(t.getFinishDate()+"//");
                }
            }
        }

        String byPriority = request.getParameter("byPriorityUp");
            List<Task> liHi = new ArrayList<>();
            List<Task> liMid = new ArrayList<>();
            List<Task> liLo = new ArrayList<>();
        if(byPriority != null && !byPriority.isEmpty()){
            for (int i = 0 ; i<tasksLi.size(); i++) {
                Task task = tasksLi.get(i);
                String priority = task.getPriority();

                if (priority.equals("HI")) {
                    liHi.add(task);
                }
                else if (priority.equals("MID")) {
                    liMid.add(task);
                }
                else if (priority.equals("LOW")) {
                    liLo.add(task);
                }
            }
            List<Task> malaHi = (List<Task>) session.getAttribute("malaHi");
            if (malaHi == null){
                malaHi = new ArrayList<>();
                session.setAttribute("malaHi", malaHi);
            }

            List<Task> malaSred = (List<Task>) session.getAttribute("malaSred");
            if(malaSred == null){
                malaHi = new ArrayList<>();
                session.setAttribute("malaSred", malaSred);
            }
        }

%>
   <h3>A teraz zobaczmy, czy można wyświetlić POSORTOWANE DATY za pomocą EL...</h3>
<table>
    <thead>
    <tr>
        <th><fmt:message key="ms.nowe.zadanie" bundle="${info}"/></th>
        <th><fmt:message key="ms.nazwa.apki" bundle="${info}"/></th>
        <th><fmt:message key="ms.dodaj" bundle="${info}"/></th>
    </tr>
    </thead>
    <c:forEach var="task" items="${sessionScope.tasksParamT}">

        <tr>

            <td>${tasksParamT.indexOf(task)}</td>
            <td>${tasksParamT.stream().count()}</td>
            <td>${task.desk}</td>
            <td>${task.finishDate}</td>
            <td>${task.priority}</td>

        </tr>
    </c:forEach>
</table>


<h3>Tabelki z posortowanymi zadaniami w/g piorytetów</h3>

    <%
        for (Task task : liHi) {
        System.out.print(task.getPriority()+", ");
        System.out.println(task.getFinishDate()+"// ");
    }

        for (Task task : liMid) {
            System.out.print(task.getPriority()+", ");
            System.out.println(task.getFinishDate()+"// ");
        }

        for (Task task : liLo) {
            System.out.print(task.getPriority()+", ");
            System.out.println(task.getFinishDate()+"// ");
        }
    %>

      <h2>Tabelka for-each</h2><br>
<%
        for (Task t : tasksLi) {
                out.print("Lp: " + tasksLi.indexOf(t) + "<br>");
                out.print("isEmpty: " + tasksLi.isEmpty() + "<br>");
                out.print("Opis: " + t.getDesk() + "<br>");
                out.print("Termin:" + t.getFinishDate() + "<br>");
                out.print("Priorytet: " + t.getPriority() + "<br>");
        }
%>
</body>
</html>
