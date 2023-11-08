<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/15/2023
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>STD</title>
</head>
<style>

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f1f1f1;
    }


    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }


    .form {
        background-color: grey;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        padding: 20px;
        width: 300px;
        text-align: center;
    }


    .form h1 {
        margin-bottom: 20px;
        color: #dad6d6;
    }


    .input-field {
        margin-bottom: 20px;
        text-align: left;
    }

    .input-field label {
        display: block;
        margin-bottom: 5px;
        color: #555;
        font-weight: bold;
    }

    .input-field input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        padding-right: 1px;
    }


    .button {
        display: inline-block;
        padding: 10px 20px;
        background-color: blue;
        color: white;
        text-decoration: none;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .button:hover {
        background-color: cadetblue;
    }


    .forgot {
        margin-top: 10px;
    }


    .signup {
        margin-top: 20px;
        color: #333;
    }
    form .error{
        border: 2px solid red;
    }
    form .success{
        border: 2px solid #a1ab8f;
    }
</style>
<body>
<div class="container">
    <form action="../services/loginC.jsp" method="post" class="form">
        <h1>Login</h1>
        <div class="input-field">
            <label for="email">Email</label>
            <input
                    type="text"
                    id="email"
                    placeholder="Enter your email"
                    required
                    id="email"
                    name="email"
            />
        </div>
        <div class="input-field">
            <label for="password">Password</label>
            <input
                    type="password"
                    id="password"
                    placeholder="Provide your password"
                    required
                    id="password"
                    name="password"
            />
        </div>
        <button class="button" type="submit" id="button">Login</button>
        <div class="forgot">
            <a href="forgot.jsp">Forgot password?</a>
        </div>
        <div class="forgot">
            <a href="welcome.jsp">HOME</a>
        </div>
        <div class="signup">
            Don't have an account? <a href="add.jsp">Sign Up</a>
        </div>
    </form>
</div>
</body>
</html>

