<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/14/2023
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.example.student_mis.Service.SemesterInteface"%>
<%@page import="com.example.student_mis.Service.SemesterServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.example.student_mis.model.Semester"%>
<%@page import="java.util.ArrayList"%>
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
<h2>Semester List</h2>
<button> <a href="../page/semester.jsp">Add semester</a></button>
<table>
  <thead>
  <tr>
    <th>Name</th>
    <th>Start Date</th>
    <th>End Date</th>
  </tr>
  </thead>
  <tbody>
  <%
    List<Semester> semesters = new ArrayList<Semester>();
    SemesterInteface semesterInteface = new SemesterServiceImpl();
    semesters = semesterInteface.getSemesters();

    for (Semester semester : semesters) {
  %>
  <tr>
    <td><%=semester.getName()%></td>
    <td><%=semester.getStartDate()%></td>
    <td><%=semester.getEndDate()%></td>
  </tr>
  <%}%>
  </tbody>
</table>
</body>
</html>

<%--<div class="wrapper">--%>
<%--  <div class="table">--%>
<%--    <div class="row header blue">--%>
<%--      <div class="cell">--%>
<%--        Name--%>
<%--      </div>--%>
<%--      <div class="cell">--%>
<%--        Start_date--%>
<%--      </div>--%>
<%--      <div class="cell">--%>
<%--        End_date--%>
<%--      </div>--%>
<%--      <div class="cell">--%>
<%--        Action--%>
<%--      </div>--%>

<%--    </div>--%>


<%--    <div class="row">--%>
<%--      <div class="cell" data-title="RegNo">--%>
<%--        <%=semester.getName()%>--%>
<%--      </div>--%>
<%--      <div class="cell" data-title="First Name">--%>
<%--        <%=semester.getStartDate()%>--%>
<%--      </div>--%>
<%--      <div class="cell" data-title="Last Name">--%>
<%--        <%=semester.getEndDate()%>--%>
<%--    </div>--%>
<%--    <%}%>--%>
<%--  </div>--%>
<%--</div>--%>
<%--</div>--%>