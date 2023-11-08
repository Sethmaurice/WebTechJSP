<%@ page import="java.util.List" %>
<%@ page import="com.example.student_mis.model.Teacher" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.student_mis.model.Semester" %>
<%@ page import="com.example.student_mis.model.CourseDefinition" %>
<%@ page import="com.example.student_mis.Service.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/15/2023
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Course</title>
</head>
<body>
<div class="header">
    <div class="information">
        <h1 style="color: white;">AUCA STUDENT REGISTRATION</h1>
    </div>
</div>

<ul>
    <li><a href="student.jsp">STUDENT</a></li>
    <li><a href="studentReg.jsp">STD_REG</a></li>
    <li><a href="academic.jsp">AcademicUnit</a></li>
    <li><a href="courseDefinition.jsp">CourseDefinition</a></li>
    <li><a href="teacher.jsp">Teacher</a></li>
    <li><a href="Course.jsp">Course</a></li>
    <li><a href="semester.jsp">Semester</a></li>
    <li><a href="studentCourse.jsp">Student Course Reg</a></li>
    <li><a href="listBySemAndDep.jsp">SD/DP/SM</a></li>
    <li><a href="listCoursesPerDepAndSem.jsp">CS/DP/SM</a></li>
    <li><a href="listCoursesPerStudent.jsp">CS/ST</a></li>
    <li><a href="listsBySemester.jsp">SD/SM</a></li>
    <li><a href="listStudPerCourseAndSem.jsp">SD/CS/SM</a></li>
</ul>
<ul style="float:right;margin-right: 30px;margin-top: -60px;height:92px ;">
<%--    <li>--%>
<%--        <a href="#">Create Account</a>--%>
<%--        <a href="#">Login</a>--%>
<%--    </li>--%>
</ul>
<ul style="float: left;margin-left: 20px;margin-top: -60px;height: 45px;">
    <li>
        <a href="courseDisplay.jsp">Course List</a>
    </li>
</ul>

<div class="content">
    <form action="../services/CourseC.jsp" method="post" style="margin-left: 455px;">

        <table border="0" style="width: 350px;height: 350px;">

            <tr><td><font color="black"><h1>COURSES</h1></font><hr></td></tr></font>

           <tr><td><label>Teacher:</label><br>

            <select name="teacher" id="teacher" style="width: 100%;height: 30px;">

                <option name="teacher">Select teacher</option>
                <% List<Teacher> teachers = new ArrayList<Teacher>();
                TeacherService services = new TeacherServiceImpl();
                teachers=services.getTeacher();
                for (Teacher teacher:teachers){
                    %>
                <option value="<%=teacher.getNames()%>"><%=teacher.getNames()%></option>
                <%
                }
                %> </select>

            <tr><td><label>Semester:</label><br>

                <select name="semester" id="semester" style="width: 100%;height: 30px;">

                    <option name="semester">Select semester</option>
                    <% List<Semester> semesters = new ArrayList<Semester>();
                        SemesterInteface serv = new SemesterServiceImpl();
                        semesters=serv.getSemesters();
                        for (Semester semester:semesters){
                    %>
                    <option value="<%=semester.getName()%>"><%=semester.getName()%></option>
                    <%
                        }
                    %> </select>

            <tr><td><label>CourseDefinition:</label><br>

                <select name="courseDef" id="courseDef" style="width: 100%;height: 30px;">

                    <option name="courseDef">Select CourseDef</option>
                    <% List<CourseDefinition> courseDefinitions = new ArrayList<CourseDefinition>();
                        CourseDefService cd = new CourseDefServiceImpl();
                        courseDefinitions=cd.getCourseDef();
                        for (CourseDefinition courseDefinition:courseDefinitions){
                    %>
                    <option value="<%=courseDefinition.getName()%>"><%=courseDefinition.getName()%></option>
                    <%
                        }
                    %> </select>
            <tr><td>
                <br><input type="submit" name="btn" value="REGISTER" style="width: 102%;height: 30px;background-color: #157dd2;border: 0px;color: white;" ></td></tr>
        </table>

    </form>


</div>
<div class="footer">
    <div class="me">regis.rw123@gmail.com</div>
</div>

</body>
</html>
