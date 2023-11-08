<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/14/2023
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../page/style.css">
    <title>please buy now!!!</title>
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
    <li>
        <a href="../services/logoutC.jsp">Logout</a>
    </li>
</ul>
<ul style="float: left;margin-left: 20px;margin-top: -60px;height: 45px;">
    <li>
        <a href="../page/teacherDisplay.jsp">Teacher List</a>
    </li>
</ul>

<div class="content">
    <form action="../services/teacherC.jsp" method="POST" style="margin-left: 455px;">

        <table border="0" style="width: 350px;height: 350px;">

            <tr><td><font color="black"><h1>Create Teacher Details</h1></font><hr></td></tr></font>

            <tr><td><lable>Teacher Code :</lable><br>

                <input type="text" name="Tcode" placeholder="Enter Course Code  " required style="width:100%;height: 30px;"></td></tr>

            <tr><td><label>Teacher Name:</label><br>

                <input type="text" name="Tname" placeholder="Enter Course Name..." required style="width:100%;height: 30px;"></td></tr>

            <tr><td>Teacher Qualifications:<select name="Qualifications" placeholder="choose" style="width: 100%;height: 30px;">
                <option name="Masters">MASTER</option>
                <option name="Professor">PHD</option>
                <option name="Professor">PROFESSOR</option>
            </select></td></tr>

            <tr><td>
                <br><input type="submit" name="btn" value="REGISTER" style="width: 102%;height: 30px;background-color: #157dd2;border: 0px;color: white;" ></td></tr>


        </table>

    </form>

</div>
<div class="footer">
SMTV
</div>

</body>
</html>
