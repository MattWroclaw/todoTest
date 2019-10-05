<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="$/pageContext.response.locale}"/>
<fmt:setLocale value="${ empty cookie.jezyk  ? pageContext.request.locale : cookie.jezyk.value }"/>
<fmt:setBundle basename="labels" var="lbls"/>
<fmt:setBundle basename="wiadomosc" var="mssg"/>
<fmt:setBundle basename="slowa" var="sl"/>
<fmt:setBundle basename="language" var="lg"/>

<html>
<head>
    <title>jezyki</title>
</head>
<body>
<a href="langu.jsp?jezyk=pl_PL"><fmt:message key="language.polish" bundle="${lg}"/> </a>
<a href="langu.jsp?jezyk=de_DE"><fmt:message key="language.german" bundle="${lg}"/> </a>
<a href="langu.jsp?jezyk=en_GB"><fmt:message key="language.english" bundle="${lg}"/> </a>
text text
${pageContext.response.locale}
<%--<fmt:setLocale value="${userLocale}"/>--%>
<fmt:message key="label.task.new" bundle="${lbls}" /><br/>
<fmt:message key="label.submit" bundle="${lbls}"/><br/>
<fmt:message key="label.list.empty" bundle="${lbls}"/><br/>
------------------------------------------<br/>
<fmt:message key="ms.dodaj" bundle="${mssg}"/><br/>
<fmt:message key="ms.nazwa.apki" bundle="${mssg}"/><br/>
<fmt:message key="ms.nowe.zadanie" bundle="${mssg}"/><br/>
------------------------------------------<br/>
<fmt:message key="label.task.new" bundle="${lbls}" /><br/>
<fmt:message key="label.submit" bundle="${lbls}"/><br/>
<fmt:message key="label.list.empty" bundle="${lbls}"/><br/>
------------------------------------------<br/>
<fmt:message key="s.kot" bundle="${sl}"/>
<fmt:message key="s.pies" bundle="${sl}"/>
<fmt:message key="s.dom" bundle="${sl}"/>

<%
    String wyborJezyka = request.getParameter("jezyk");
    if(wyborJezyka != null){
        Cookie cookie = new Cookie("jezyk" , wyborJezyka);
        response.addCookie(cookie);
        response.sendRedirect("langu.jsp");
    }
%>


</body>
</html>
