<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>please buy now!!!</title>
</head>
<body>
<div class="header">
    <div class="information">
        <h1 style="color: white;">STUDENT REGISTRATION</h1>
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
        <a href="semesterDisplay.jsp">Semester List</a>
    </li>
</ul>

<div class="content">
        <form action="../services/semesterC.jsp" method="post" style="margin-left: 455px;">

        <table border="0" style="width: 350px;height: 350px;">

            <tr><td><font color="black"><h1>Create Semester Details</h1></font><hr></td></tr></font>

           <tr><td><label>Name:</label><br>

                <input type="text" name="semName" placeholder="Enter Semester Name..." required style="width:100%;height: 30px;"></td></tr>


            <tr><td><label>Start Date:</label><br>

                <input type="date" name="startDate" required style="width:100%;height: 30px;"></td></tr>

            <tr><td><label>End Date:</label><br>

                <input type="date" name="endDate" required style="width:100%;height: 30px;"></td></tr>

            <tr><td>
                <br><input type="submit" name="btn" value="REGISTER" style="width: 102%;height: 30px;background-color: #157dd2;border: 0px;color: white;" ></td></tr>


        </table>

    </form>

</div>
<div class="footer">
 <small>#SMTV</small>
</div>
<script>
    document.querySelector('a[href="../services/loginC.jsp"]').addEventListener('click', function (e) {
        var confirmation = confirm("Are you sure you want to logout?");
        if (!confirmation) {
            e.preventDefault(); // Prevent the default link behavior
        }
    });
</script>
</body>
</html>
