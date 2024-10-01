
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> Add Employee</h1>
<form action="addEmployee" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>

    <label for="phone">Phone Number:</label>
    <input type="text" id="phone" name="phone" required><br><br>

    <label for="position">Position:</label>
    <input type="text" id="position" name="position" required><br><br>

    <label for="department">Department:</label>
    <input type="text" id="department" name="department" required><br><br>

    <input type="submit" value="Add Employee">

</form>

</body>
</html>
