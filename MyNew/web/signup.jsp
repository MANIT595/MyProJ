<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" href="Stylee.css">
</head>
<body>
<h1>Hello World</h1>
<div>
<form method="post" action="Signup">
    <p align="center" color="red">Sign Up</p>
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
            <td><label>Email</label></td>
            <td><input type="email" name="email" placeholder="Your Email.." required></td>
        </tr>
        <tr>

            <td><label>Phone</label></td>
            <td><input type="phone"  name="phone" placeholder="Your Phone Number.." required></td>
        </tr>
        <tr>
            <td><label>Gender</label></td>
            <td><input type="text" name="gender" placeholder="Your Gender.." required></td>
        </tr>
        <tr>

            <td><label>DOB</label></td>
            <td><input type="date"  name="dob" placeholder="Your DOB.." required></td>
        </tr>
        <tr>
            <td><label>Address</label></td>
            <td><input type="text" name="address" placeholder="Your Address.." required></td>
        </tr>
        <tr>
            <td rowspan="2"><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
</div>
</body>
</html>
