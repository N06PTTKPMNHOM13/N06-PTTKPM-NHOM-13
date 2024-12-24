<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban xe cu: Login</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="component/navbar.jsp"%>
        <div class="container p-2">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Login</h3>
                            <c:if test="${not empty failedMsg}">
                                <P class="text-center text-danger">${failedMsg}</P>
                                <c:remove var="failedMsg" scope = "session"/>
                            </c:if>
                            <form action="login" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" name="password" required>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Login</button><br>
                                    <a href="register.jsp" style="text-decoration: none">Create Account</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
