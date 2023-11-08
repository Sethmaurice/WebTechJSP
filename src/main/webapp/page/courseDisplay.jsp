<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_mis.model.CourseDefinition" %>
<%@ page import="com.example.student_mis.Service.CourseDefService" %>
<%@ page import="com.example.student_mis.Service.CourseDefServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.student_mis.model.Course" %>
<%@ page import="com.example.student_mis.Service.CourseService" %>
<%@ page import="com.example.student_mis.Service.CourseServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../page/style.css" rel="stylesheet" type="text/css"/>

<%--<!doctype html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <meta name="viewport"--%>
<%--        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">--%>
<%--  <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--  <title>Document</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>Course List</h2>--%>
<%--<button> <a href="../page/courseDefinition.jsp">Define Course</a></button>--%>
<%--<table>--%>
<%--  <thead>--%>
<%--  <tr>--%>
<%--    <th>COURSE</th>--%>
<%--    <th>SEMESTER</th>--%>
<%--    <th>TEACHER</th>--%>
<%--  </tr>--%>
<%--  </thead>--%>
<%--  <tbody>--%>
<%--  <%--%>
<%--    List<CourseDefinition> courses = new ArrayList<CourseDefinition>();--%>
<%--    CourseDefService courseDefService = new CourseDefServiceImpl();--%>
<%--    courses = courseDefService.getCourseDef();--%>

<%--    for (CourseDefinition courseDefinition : courses) {--%>
<%--  %>--%>
<%--  <tr>--%>
<%--    <td><%=courseDefinition.getCode()%></td>--%>
<%--    <td><%=courseDefinition.getName()%></td>--%>
<%--    <td><%=courseDefinition.getDescription()%></td>--%>
<%--  </tr>--%>
<%--  <%}%>--%>
<%--  </tbody>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>
<html>
<body>
        <table>
            <thead>
            <tr>
                <th>#</th>
                <th>Course Name</th>
                <th>Semester</th>
                <th>Teacher</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Course> courses = new ArrayList<>();
                CourseService service = new CourseServiceImpl();
                courses = service.getCourse();

                for(Course course : courses){
            %>
            <tr>
                <td><%=course.getId()%></td>
                <td><%=course.getCourseDefinition().getName()%></td>
                <td><%=course.getSemester().getName()%></td>
                <td><%=course.getTeacher().getNames()%></td>
                <td>
                    <div class="tdAction">
                        <button class="updateBtn">?</button>
                        <button class="deleteBtn">x</button>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </body>
    </html>