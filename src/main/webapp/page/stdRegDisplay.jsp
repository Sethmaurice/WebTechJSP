<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/21/2023
  Time: 7:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_mis.model.CourseDefinition" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.student_mis.model.Course" %>
<%@ page import="com.example.student_mis.model.StudentRegistration" %>
<%@ page import="com.example.student_mis.Service.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<table>
  <thead>
  <tr>
    <th>#</th>
    <th>STUDENT_id</th>
    <th>STUDENT_Name</th>
    <th>REG_DATE</th>
    <th>SEMESTER</th>
    <th>REG_STATUS</th>
    <th>ACTION</th>
  </tr>
  </thead>
  <tbody>
  <%
    List<StudentRegistration> std = new ArrayList<>();
    StudentRegService studentRegService = new StudentRegServiceImpl();
    std = studentRegService.getStudentRegistration();

    for(StudentRegistration stdR : std){
  %>
  <tr>
    <td><%=stdR.getId()%></td>
    <td><%=stdR.getStudent().getRegNo()%></td>
    <td><%=stdR.getStudent().getFullname()%></td>
    <td><%=stdR.getRegistrationDate()%></td>
    <td><%=stdR.getSemester().getName()%></td>
    <td><%=stdR.getRegistrationStatus()%></td>
    <td><%=stdR.getRegistrationStatus()%></td>
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
