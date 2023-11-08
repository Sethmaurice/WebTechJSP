<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/24/2023
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.student_mis.model.*" %>
<%@ page import="com.example.student_mis.Service.*" %>
<%--<%@ page import="com.example.student_mis.Service*" %>--%>
<jsp:useBean id="semBean" class="com.example.student_mis.bean.SemesterBean" scope="request" />
<jsp:useBean id="studBean" class="com.example.student_mis.bean.StudentBean" scope="request" />
<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-24
  Time: 08:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String student = request.getParameter("student");
    if(student != null) {
        StudentService studentService = new StudentServiceImpl();
        Student student1 = studentService.findStudentByRegNo(student);
        studBean.setId(student1.getId());
        studBean.setRegNo(student1.getRegNo());
        studBean.setFullname(student1.getFullname());
    }
%>
<html>
<head>
    <style>
        /* Styles.css */

        /* Header styles */
        .data .hd {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        /* Form styles */
        form {
            margin-bottom: 20px;
        }

        select, button {
            padding: 5px;
            margin: 5px;
        }

        /* Hide empty message elements */
        .msg {
            display: none;
        }

    </style>
    <title>Title</title>
    <link rel="stylesheet" href="../css/Styles.css">
</head>
<body>

<section>
    <div  class="data" id="pro-data">
        <div class="hd">
            <h3>Student by Semester</h3>
            <form action="listCoursesPerStudent.jsp" method="post" id="dataForm">
                <div>
                    <label for="student">CHOOSE STUDENT</label>
                    <select name="student" id="student">
                        <option value="select">Select Student...</option>
                        <%
                            StudentService service = new StudentServiceImpl();
                            List<Student> studentList = new ArrayList<>();
                            studentList = service.getStudents();

                            for(Student stud : studentList){
                        %>
                        <option value="<%=stud.getRegNo()%>"><%=stud.getFullname()%></option>
                        <%
                            }
                        %>
                    </select>
                    <button type="submit">Find</button>
                </div>
            </form>
        </div>
        <table>
            <thead>
            <tr>
                <th>#</th>
                <th>Reg No</th>
                <th>course Names</th>
                <th>Semester</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                List<StudentCourse> courseList = new ArrayList<>();
                StudentCourseService service1 = new StudentCourseServiceImpl();
                courseList = service1.courseByStudentId(studBean.getId());

                for(StudentCourse course : courseList){
            %>
            <tr>
                <td><%=course.getId()%></td>
                <td><%=course.getCourse().getCourseDefinition().getCode()%></td>
                <td><%=course.getCourse().getCourseDefinition().getName()%></td>
                <td><%=course.getCredits()%></td>
                <td><%=course.getResults()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>

<script defer>
    const messages = document.querySelectorAll(".msg");
    messages.forEach((small) => {
        if(small.textContent.trim() === ''){
            small.style.display = 'none';
        }
    });
</script>

