<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/3/2020
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Map<String, String> dictionary = new HashMap<>();
    dictionary.put("hello","Xin chào");
    dictionary.put("how","Thế nào");
    dictionary.put("book","Quyển vở");
    dictionary.put("computer","Máy tính");

    String search = request.getParameter("search");

    String result = dictionary.get(search);
    if(result != null)

    {
        out.println("Word: " + search);
        out.println("Result: " + result);
    } else

    {
        out.println("Not found");
    }
%>


<% %>
</body>
</html>
