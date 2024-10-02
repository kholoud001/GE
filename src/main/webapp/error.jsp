<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
<h1>An Error Occurred</h1>
<p>Status Code: <%= request.getAttribute("javax.servlet.error.status_code") %></p>
<p>Error Message: <%= request.getAttribute("javax.servlet.error.message") %></p>
<p><a href="<%= request.getContextPath() %>/employee">Return to Home</a></p>
</body>
</html>
