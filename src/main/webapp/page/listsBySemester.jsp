<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/24/2023
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_mis.Service.SemesterInteface" %>
<%@ page import="com.example.student_mis.Service.SemesterServiceImpl" %>
<%@ page import="com.example.student_mis.model.Semester" %>
<%@ page import="com.example.student_mis.model.StudentRegistration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.student_mis.Service.StudentRegService" %>
<%@ page import="com.example.student_mis.Service.StudentRegServiceImpl" %>
<%@ page import="com.example.student_mis.Service.AcademicService" %>
<%@ page import="com.example.student_mis.Service.AcademicServiceImpl" %>
<%@ page import="com.example.student_mis.model.AcademicUnit" %>
<jsp:useBean id="semBean" class="com.example.student_mis.bean.SemesterBean" scope="request" />
<jsp:useBean id="unitBean" class="com.example.student_mis.bean.AcademicUnitBean" scope="request" />
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

    String department = request.getParameter("department");
    if(department != null){
        AcademicService unitService = new AcademicServiceImpl();
        AcademicUnit academicUnit = unitService.findUnitByName("department");

        if(academicUnit.getUnit().name().equals("DEPARTMENT")){
            unitBean.setId(academicUnit.getId());
            unitBean.setName(academicUnit.getName());
        }
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
    <div  class="data" id="pro-data">
        <div class="hd">
            <h3>Student by Semester</h3>
            <form action="listsBySemester.jsp" method="post" id="dataForm">
                <div>
                    <label for="semester">Choose Semester</label>
                    <select name="semName" id="semester">
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
                    <button type="submit">Find</button>
                </div>
            </form>
        </div>
        <table>
            <thead>
            <tr>
                <th>#</th>
                <th>Reg No</th>
                <th>Student Names</th>
                <th>Semester</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                List<StudentRegistration> registrations = new ArrayList<>();
                StudentRegService service1 = new StudentRegServiceImpl();

                System.out.println(semBean.getId());
                registrations = service1.getStudentBySemester(semBean.getId());
                for(StudentRegistration reg : registrations){
            %>
            <tr>
                <td><%=reg.getId()%></td>
                <td><%=reg.getStudent().getRegNo()%></td>
                <td><%=reg.getStudent().getFullname()%></td>
                <td><%=reg.getSemester().getName()%></td>
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

    // Get references to the radio buttons and data containers
    const radioButtons = document.querySelectorAll('input[name="radio-group"]');
    const dataContainers = document.querySelectorAll(".data");

    // Add an event listener to each radio button
    radioButtons.forEach((radioButton) => {
        radioButton.addEventListener("change", (event) => {
            // Hide all data containers
            dataContainers.forEach((container) => {
                container.style.display = "none";
            });

            // Show the related data container for the selected radio button
            if (event.target.checked) {
                const relatedDataContainer = document.getElementById(
                    event.target.id +"-data"
                );
                if (relatedDataContainer) {
                    relatedDataContainer.style.display = "block";
                }
            }
        });
    });

    const preCheckedRadioButton = document.querySelector('input[name="radio-group"]:checked');
</script>

