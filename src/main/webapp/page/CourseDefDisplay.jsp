<%@ page import="com.example.student_mis.model.CourseDefinition" %>
<%@ page import="com.example.student_mis.Service.CourseDefService" %>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page import="com.example.student_mis.Service.CourseDefServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/14/2023
  Time: 11:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../page/style.css" rel="stylesheet" type="text/css"/>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h2>Course List</h2>
<button> <a href="../page/courseDefinition.jsp">Define Course</a></button>
<table>
    <thead>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<CourseDefinition> courses = new ArrayList<CourseDefinition>();
        CourseDefService courseDefService = new CourseDefServiceImpl();
        courses = courseDefService.getCourseDef();

        for (CourseDefinition courseDefinition : courses) {
    %>
    <tr>
        <td><%=courseDefinition.getCode()%></td>
        <td><%=courseDefinition.getName()%></td>
        <td><%=courseDefinition.getDescription()%></td>
    </tr>
    <%}%>
    </tbody>
</table>
</body>
</html>
