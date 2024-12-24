<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="entity.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban xe cu: Help Center</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
    </head>
    <body>
    <body style="background-color: #f7f7f7">
        <% User u = (User) session.getAttribute("userObj"); %>
        <%@include file="component/navbar.jsp"%>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="container">
            <div class="row p-5">
                <div class="col-md-4 offset-md-4 text-center">
                    <div class="text-success">
                        <i class="fa-solid fa-square-phone fa-5x"></i>
                    </div>
                    <h3>24/7 Service</h3>
                    <h4>Help Line Number</h4>
                    <h5>+84858425777</h5>
                    <a href="index.jsp" class="btn btn-outline-danger btn-sm">Home</a>
                </div>
            </div>
        </div>
    </body>
</html>
