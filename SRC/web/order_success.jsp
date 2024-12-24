<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban xe cu</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="component/navbar.jsp"%>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="container text-center mt-3">
            <i class="fas fa-check-circle fa-5x text-success"></i>
            <h1>Thank you</h1>
            <h2>Your order successfully</h2>
            <h5>With in 7 days your product will be delivered in your address</h5> 
            <a href="index.jsp" class="btn btn-outline-danger mt-3">Home</a> 
            <a href="order.jsp" class="btn btn-outline-success mt-3">View order</a>
        </div>
    </body>
</html>
