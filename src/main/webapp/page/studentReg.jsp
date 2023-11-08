<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/20/2023
  Time: 11:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_mis.model.StudentRegistration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.student_mis.Service.StudentRegService" %>
<%@ page import="com.example.student_mis.Service.StudentRegServiceImpl" %>
<%@ page import="com.example.student_mis.model.Student" %>
<%@ page import="com.example.student_mis.Service.StudentService" %>
<%@ page import="com.example.student_mis.Service.StudentServiceImpl" %>
<%@ page import="com.example.student_mis.model.AcademicUnit" %>
<%@ page import="com.example.student_mis.Service.AcademicService" %>
<%@ page import="com.example.student_mis.Service.AcademicServiceImpl" %>
<%@ page import="com.example.student_mis.model.Semester" %>
<%@ page import="com.example.student_mis.Service.SemesterInteface" %>
<%@ page import="com.example.student_mis.Service.SemesterServiceImpl" %>
<%--<jsp:useBean id="studRegBean" class="com.example.student_mis.bean.StudentRegistrationBean" scope="request" />--%>
<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-13
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }

        .header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
        }

        .header h1 {
            margin: 0;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        ul li {
            float: left;
        }

        ul li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        ul li a:hover {
            background-color: #555;
        }

        h1 {
            text-align: center;
        }

        form {
            text-align: center;
            margin: 20px;
        }

        select, button {
            padding: 10px;
            margin: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        select {
            width: 200px;
        }

        button {
            background-color: #333;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #555;
        }
    </style>
    <title>Reg/Std!!!</title>
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
    <li><a href="academic.jsp">Academic Unit</a></li>
    <li><a href="courseDefinition.jsp">Course Definition</a></li>
    <li><a href="teacher.jsp">Teacher</a></li>
    <li><a href="Course.jsp">Course</a></li>
    <li><a href="semester.jsp">Semester</a></li>
    <li><a href="studentCourse.jsp">Student Course Reg</a></li>
    <li><a href="Status.jsp">#</a></li>
    <li><a href="listBySemAndDep.jsp">SD/DP/SM</a></li>
    <li><a href="listCoursesPerDepAndSem.jsp">CS/DP/SM</a></li>
    <li><a href="listCoursesPerStudent.jsp">CS/ST</a></li>
    <li><a href="listsBySemester.jsp">SD/SM</a></li>
    <li><a href="listStudPerCourseAndSem.jsp">SD/CS/SM</a></li>
</ul>
<li>
    <a href="../services/logoutC.jsp">Logout</a>
</li>
</ul>
<ul style="float: left;margin-left: 20px;margin-top: -60px;height: 45px;">
    <li>
        <a href="../page/studentDisplay.jsp">#</a>
    </li>
</ul>

<h1>New Student Registration</h1>
<form action="../services/studentRegC.jsp" method="post">
    <div class="form-input">
        <label for="unit">Select Academic Unit</label>
        <select name="unit" id="unit">
            <option>Select Unit</option>
            <%
                List<AcademicUnit> unitList = new ArrayList<>();
                AcademicService service2 = new AcademicServiceImpl();
                unitList = service2.findAll();

                for(AcademicUnit unit: unitList){
                    if(unit.getUnit().name().equals("DEPARTMENT")){
            %>
            <option value="<%=unit.getName()%>"><%=unit.getName()%></option>
            <%
                    }
                }
            %>
        </select>
    </div>
    <div class="sem">
        <label for="unit">Select Semester</label>
        <select name="semester"  id="semester">
            <option>Select sem...</option>
    <%
        List<Semester> semesters = new ArrayList<Semester>();
        SemesterInteface semesterInteface = new SemesterServiceImpl();
        semesters = semesterInteface.getSemesters();
    %>
        <%for (Semester semester : semesters) {%>
        <option name="sName" value="<%=semester.getName()%>"><%=semester.getName()%></option>
        <% }%>

    </select>
    </div>
    <div class="std">
        <label for="unit">Select Student</label>
        <select name="student"  id="student">
            <option>Select sem...</option>
    <%
        List<Student> students = new ArrayList<Student>();
        StudentService studentService = new StudentServiceImpl();
        students = studentService.getStudents();
    %>
        <%for (Student student : students) {%>
        <option value="<%=student.getRegNo()%>"><%=student.getRegNo()%></option>
        <% }%>

    </select>
    </div>
    <select name="status">
        <option>PENDING</option>
        <option>APPROVED</option>
        <option>REJECTED</option>
    </select>
    <button  type="submit" id="signupSubmitButton">Add</button>
<%--    <a href="teacherDisplay.jsp"><button type="button" id="signupBackButton">Back</button></a>--%>
</form>



</body>
</html>

<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <link rel="stylesheet" type="text/css" href="../page/styles.css">--%>
<%--    <title>course</title>--%>
<%--</head>--%>

<%--<body>--%>
<%--<h1>New Student Registration</h1>--%>
<%--<form action="../services/studentRegC.jsp" method="POST">--%>

<%--    <%--%>
<%--        List<Semester> semesters = new ArrayList<Semester>();--%>
<%--        SemesterInteface semesterInteface = new SemesterServiceImpl();--%>
<%--        semesters = semesterInteface.getSemesters();--%>
<%--    %>--%>

<%--    <select name="semester"  >--%>
<%--        <%for (Semester semester : semesters) {%>--%>
<%--        <option name="sName" value="<%=semester.getName()%>"><%=semester.getName()%></option>--%>
<%--        <% }%>--%>

<%--    </select>--%>
<%--    <%--%>
<%--        List<Student> students = new ArrayList<Student>();--%>
<%--        StudentService studentService = new StudentServiceImpl();--%>
<%--        students = studentService.getStudents();--%>
<%--    %>--%>

<%--    <select name="student" >--%>
<%--        <%for (Student student : students) {%>--%>
<%--        <option value="<%=student.getRegNo()%>"><%=student.getRegNo()%></option>--%>
<%--        <% }%>--%>

<%--    </select>--%>
<%--    <select name="status">--%>
<%--        <option>PENDING</option>--%>
<%--        <option>APPROVED</option>--%>
<%--        <option>REJECTED</option>--%>
<%--    </select>--%>
<%--    <button type="submit" id="signupSubmitButton">Add</button>--%>
<%--    <a href="teacherDisplay.jsp"><button type="button" id="signupBackButton">Back</button></a>--%>
<%--</form>--%>



<%--</body>--%>
<%--</html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>WebTech-Dashboard</title>--%>
<%--    <link rel="stylesheet" href="../css/dbStyle.css">--%>
<%--</head>--%>
<%--<body>--%>

<%--    </div>--%>
<%--                    <table>--%>
<%--                        <thead>--%>
<%--                        <tr>--%>
<%--                            <th>#</th>--%>
<%--                            <th>id</th>--%>
<%--                            <th>std</th>--%>
<%--                            <th>sem</th>--%>
<%--                            <th>unit</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                        <%--%>
<%--                            List<StudentRegistration> registrations = new ArrayList<>();--%>
<%--                            StudentRegService service = new StudentRegServiceImpl();--%>
<%--                            registrations = service.getRegs();--%>

<%--                            for(StudentRegistration reg : registrations){--%>
<%--                        %>--%>
<%--                        <tr>--%>
<%--                            <td><%=reg.getId()%></td>--%>
<%--                            <td><%=reg.getStudent().getRegNo()%></td>--%>
<%--                            <td><%=reg.getSemester().getName()%></td>--%>
<%--                            <td><%=reg.getUnit().getName()%></td>--%>
<%--                            <td><%=reg.getRegistrationDate()%></td>--%>
<%--                            <td>--%>
<%--                                <div class="tdAction">--%>
<%--                                    <button class="updateBtn">?</button>--%>
<%--                                    <button class="deleteBtn">x</button>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <%--%>
<%--                            }--%>
<%--                        %>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </div>--%>
<%--                <div class="actions">--%>
<%--                    <div class="hd">--%>
<%--                        <h3>Add/Update Semester</h3>--%>
<%--                    </div>--%>
<%--                    <form action="../services/studentRegC.jsp" method="post" id="form">--%>
<%--&lt;%&ndash;                        <small style="color: darkred;">${studRegBean.errorMessage}</small>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <small style="color: green;">${studRegBean.infoMessage}</small>&ndash;%&gt;--%>
<%--                        <input type="hidden" id="id" name="id" />--%>
<%--                        <div class="form-input">--%>
<%--                            <label for="student">Student</label>--%>
<%--                            <select name="regNo" id="student">--%>
<%--                                <option>Select Student</option>--%>
<%--                                <%--%>
<%--                                    List<Student> students = new ArrayList<>();--%>
<%--                                    StudentService service1 = new StudentServiceImpl();--%>
<%--                                    students = service1.getStudents();--%>

<%--                                    for(Student student: students){--%>
<%--                                %>--%>
<%--                                <option value="<%=student.getRegNo()%>"><%=student.getRegNo() + " " + student.getFullname()%></option>--%>
<%--                                <%--%>
<%--                                    }--%>
<%--                                %>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                        <div class="form-input">--%>
<%--                            <label for="unit">Select Academic Unit</label>--%>
<%--                            <select name="unit" id="unit">--%>
<%--                                <option>Select Unit</option>--%>
<%--                                <%--%>
<%--                                    List<AcademicUnit> unitList = new ArrayList<>();--%>
<%--                                    AcademicService service2 = new AcademicServiceImpl();--%>
<%--                                    unitList = service2.findAll();--%>

<%--                                    for(AcademicUnit unit: unitList){--%>
<%--                                        if(unit.getUnit().name().equals("FACULTY")){--%>
<%--                                %>--%>
<%--                                <option value="<%=unit.getName()%>"><%=unit.getName()%></option>--%>
<%--                                <%--%>
<%--                                        }--%>
<%--                                    }--%>
<%--                                %>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                        <div class="form-input">--%>
<%--                            <label for="semester">Start Date</label>--%>
<%--                            <select name="semester" id="semester">--%>
<%--                                <option>Select Semester</option>--%>
<%--                                <%--%>
<%--                                    List<Semester> semesters = new ArrayList<>();--%>
<%--                                    SemesterInteface service3 = new SemesterServiceImpl();--%>
<%--                                    semesters = service3.getSemesters();--%>

<%--                                    for(Semester semester: semesters){--%>
<%--                                %>--%>
<%--                                <option value="<%=semester.getName()%>"><%=semester.getName()+" "+semester.getStartDate()%></option>--%>
<%--                                <%--%>
<%--                                    }--%>
<%--                                %>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                        <input type="submit" id="formBtn" value="Submit" />--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%--<script defer>--%>
<%--    const form = document.getElementById("form");--%>
<%--    const updateButtons = document.querySelectorAll('.updateBtn');--%>
<%--    const deleteButtons = document.querySelectorAll('.deleteBtn');--%>
<%--    const srIdInput = document.getElementById('id');--%>
<%--    const stRegNoInput = document.getElementById('student');--%>
<%--    const unitInput = document.getElementById('unit');--%>
<%--    const semesterInput = document.getElementById('semester');--%>
<%--    const regDateInput = document.getElementById('regDate');--%>
<%--    const formBtn = document.getElementById('formBtn');--%>

<%--    updateButtons.forEach(button => {--%>
<%--        button.addEventListener('click', () => {--%>
<%--            const row = button.closest('tr');--%>
<%--            const cells = row.getElementsByTagName('td');--%>

<%--            srIdInput.value = cells[0].textContent;--%>
<%--            stRegNoInput.value = cells[1].textContent;--%>
<%--            unitInput.value = cells[2].textContent;--%>
<%--            semesterInput.value = cells[3].textContent;--%>
<%--            regDateInput.value = cells[4].textContent;--%>
<%--            formBtn.value = 'Update';--%>
<%--            formBtn.style.backgroundColor = '#2b9b58';--%>
<%--        });--%>
<%--    })--%>

<%--    deleteButtons.forEach(button => {--%>
<%--        button.addEventListener('click', () => {--%>
<%--            const row = button.closest('tr');--%>
<%--            const cells = row.getElementsByTagName('td');--%>

<%--            srIdInput.value = cells[0].textContent;--%>
<%--            stRegNoInput.value = cells[1].textContent;--%>
<%--            unitInput.value = cells[2].textContent;--%>
<%--            semesterInput.value = cells[3].textContent;--%>
<%--            regDateInput.value = cells[4].textContent;--%>
<%--            formBtn.value = 'Delete';--%>
<%--            formBtn.style.backgroundColor = '#d13a3a';--%>
<%--        });--%>
<%--    });--%>

<%--    form.addEventListener('submit', (e) => {--%>
<%--        e.preventDefault();--%>
<%--        form.action = "../services/studentRegC.jsp?action=" + formBtn.value;--%>
<%--        form.submit();--%>
<%--    });--%>
<%--</script>--%>
