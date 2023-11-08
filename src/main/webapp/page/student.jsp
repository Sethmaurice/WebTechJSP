<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/18/2023
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
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
        <a href="../page/studentDisplay.jsp">Student List</a>
    </li>
</ul>

<div class="content">
    <form action="../services/studentC.jsp" method="POST" style="margin-left: 455px;">

        <table border="0" style="width: 350px;height: 350px;">

            <tr><td><font color="black"><h1>Enter student Reg Details</h1></font><hr></td></tr></font>

            <tr><td><label>REG NUMBER:</label><br>

                <input type="number" name="regNo" placeholder="Enter ID..." required style="width:100%;height: 30px;"></td></tr>


            <tr><td><label>Firstname:</label><br>

                <input type="text" name="fullname" placeholder="Enter Fisrtname..." required style="width:100%;height: 30px;"></td></tr>


            <tr><td><label>Date of Birth:</label><br>

                <input type="date" name="dob" required style="width:100%;height: 30px;"></td></tr>


            <tr><td>
                <br><input type="submit" name="btn" value="REGISTER" style="width: 102%;height: 30px;background-color: #157dd2;border: 0px;color: white;" ></td></tr>


        </table>

    </form>

</div>
<div class="footer">

</div>
</body>
</html>
