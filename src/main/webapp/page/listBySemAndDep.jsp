<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/24/2023
  Time: 5:03 PM
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
    AcademicUnit academicUnit = unitService.findUnitByName(department);

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
  <div class="data" id="fac-data">
    <h3>Student per department and Semester</h3>
    <form action="listBySemAndDep.jsp" method="post">
      <div>
        <label for="department">Choose Department</label>
        <select name="department" id="department">
          <option value="select">Select department</option>
          <%
            AcademicService unitService = new AcademicServiceImpl();
            List<AcademicUnit> unitList = new ArrayList<>();
            unitList = unitService.findAll();

            for(AcademicUnit unit : unitList){
              if(unit.getUnit().name().equals("DEPARTMENT")){
          %>
          <option value="<%=unit.getName()%>"><%=unit.getName()%></option>
          <%
              }
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
        <th></th>
      </tr>
      </thead>
      <tbody>
      <%
        List<StudentRegistration> registrationList = new ArrayList<>();
        StudentRegService registrationService = new StudentRegServiceImpl();
        registrationList = registrationService.getStudentBySemesterAndDepartment(semBean.getId(), unitBean.getId());

        for(StudentRegistration reg : registrationList){
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

