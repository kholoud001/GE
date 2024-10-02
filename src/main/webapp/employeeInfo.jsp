<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styleIndex.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <title>Employee Info Page</title>
</head>
<body>
<header class="header">
    <div class="header-content responsive-wrapper">
        <div class="header-logo">
            <h1>Employee Info Page</h1>
        </div>
    </div>
</header>


<main class="main">
    <div class="responsive-wrapper">

        <div class="content">
            <div class="content-main">
                <div class="card-grid">
                        <article class="card">
                            <div class="card-header">
                                <h3>${employee.name}</h3>
                            </div>
                            <div class="card-body">
                                <p><i class="fa-regular fa-envelope"></i> ${employee.email}</p>
                                <p> <i class="fa-solid fa-briefcase"></i> ${employee.position}</p>
                                <p> <i class="fa-solid fa-building"></i> ${employee.department}</p>
                                <p> <i class="fa-solid fa-phone"></i> ${employee.phone}</p>
                            </div>
                        </article>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
