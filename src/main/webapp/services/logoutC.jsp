<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/15/2023
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Logout</title>
  <script type="text/javascript">
    function confirmLogout() {
      var confirmation = confirm("Are you sure you want to logout?");
      if (confirmation) {
        // Perform logout actions here, like clearing the session.
        // Then, you can use the following code to redirect to a new page.
        window.location.href = "../page/login.jsp";
      }
      return false; // Prevent the default behavior of the button
    }
  </script>
</head>
<body>
<button onclick="return confirmLogout()">logout</button>
<%--<%--%>
<%--  // Invalidate the current session (log out the user)--%>
<%--  session.invalidate();--%>
<%--%>--%>
<%--<p>You have been successfully logged out. <a href="../page/login.jsp">Login again</a></p>--%>
</body>
</html>
