<%--
  Created by IntelliJ IDEA.
  User: asimsangram
  Date: 12/17/15
  Time: 9:20 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>New opinion</title>
</head>

<body>
    <g:form action="save" autocomplete="off">
        <label for="opinion">Opinion</label> <g:textArea id = "opinion" name="opinion"/><br>
        <g:submitButton name="submit"/>
    </g:form>
</body>
</html>