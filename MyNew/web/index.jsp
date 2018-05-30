<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="Stylee.css">
</head>
<body>
<h1>Hello World</h1>
<%
  session.invalidate();
%>
<div class="login">
<form method="post" action="Signin">
    <p align="center" color="red">Login</p>
    <table>
        <tr>
            <td><label>User Name</label></td>
            <td><input type="text" name="username" placeholder="Your Username.." required></td>
        </tr>
        <tr>

            <td><label>Password</label></td>
            <td><input type="password"  name="password" placeholder="Your Password.." required></td>
        </tr>
        <tr>
            <td rowspan="2"><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
</div>
</body>
</html>