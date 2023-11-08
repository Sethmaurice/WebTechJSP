<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/24/2023
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.student_mis.model.*" %>
<%@ page import="com.example.student_mis.Service.*" %>
<%--<%@ page import="com.example.student_mis.service.implementaion.*" %>--%>
<jsp:useBean id="semBean" class="com.example.student_mis.bean.SemesterBean" scope="request" />
<jsp:useBean id="defBean" class="com.example.student_mis.bean.CourseDefinitionBean" scope="request" />
<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-24
  Time: 08:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String semName = request.getParameter("semName");
    if(semName != null) {
        SemesterInteface semesterService = new SemesterServiceImpl();
        Semester semester = semesterService.findSemesterByName(semName);
        semBean.setId(semester.getId());
        semBean.setName(semester.getName());
    }

    String courseDef = request.getParameter("courseDef");
    if(courseDef != null){
        CourseDefService definitionService = new CourseDefServiceImpl();
        CourseDefinition definition = definitionService.findCourseByName(courseDef);
        defBean.setId(definition.getId());
        defBean.setName(definition.getName());
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
    <link rel="stylesheet" href="../css/myStyles.css">
</head>
<body>

<section>
    <div class="data" id="fac-data">
        <h3>Student per department and Semester</h3>
        <form action="listStudPerCourseAndSem.jsp" method="post">
            <div>
                <label for="course">Choose Course</label>
                <select name="courseDef" id="course">
                    <option value="select">Select Course</option>
                    <%
                        CourseDefService courseDefinitionService = new CourseDefServiceImpl();
                        List<CourseDefinition> courseDefinitions = new ArrayList<>();
                        courseDefinitions = courseDefinitionService.getAllCourseDefinitions();

                        for(CourseDefinition definition : courseDefinitions){
                    %>
                    <option value="<%=definition.getName()%>"><%=definition.getName()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div>
                <label for="sem">Choose Semester</label>
                <select name="semName" id="sem">
                    <option value="select">Select Semester</option>
                    <%
                        SemesterInteface service = new SemesterServiceImpl();
                        List<Semester> semesters = new ArrayList<>();
                        semesters = service.getSemesters();

                        for(Semester sem : semesters){
                    %>
                    <option value="<%=sem.getName()%>"><%=sem.getName()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <button type="submit">Find</button>
        </form>
        <table>
            <thead>
            <tr>
                <th>#</th>
                <th>Reg No</th>
                <th>Student Names</th>
                <th>Semester</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<StudentCourse> courseList = new ArrayList<>();
                StudentCourseService service1 = new StudentCourseServiceImpl();
                courseList = service1.studentBySemAndCourse(defBean.getId(), semBean.getId());

                System.out.println(courseList);

                for(StudentCourse course : courseList){
            %>
            <tr>
                <td><%=course.getId()%></td>
                <td><%=course.getStudentRegistration().getStudent().getRegNo()%></td>
                <td><%=course.getStudentRegistration().getStudent().getFullname()%></td>
<%--                <td><%=course.getCourse().getCourseDefinition().getCode()%></td>--%>
<%--                <td><%=course.getCourse().getCourseDefinition().getName()%></td>--%>
                <td><%=course.getStudentRegistration().getSemester().getName()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="data" id="dep-data" style="display: none">
        <div class="hd">
            <h3>Add Department</h3>
        </div>
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

