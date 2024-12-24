<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban xe cu: Profile</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
    </head>
    <body>
    <body style="background-color: #f7f7f7">
        <%@include file="component/navbar.jsp"%>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="container">
            <div class="row p-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-3">
                        <div class="card-body">
                            <h4 class="text-center">Edit Profile</h4>
                            <c:if test="${not empty succMsg}">
                                <P class="text-center text-success">${succMsg}</P>
                                    <c:remove var="succMsg" scope = "session"/>
                                </c:if>

                            <c:if test="${not empty failedMsg}">
                                <P class="text-center text-danger">${failedMsg}</P>
                                    <c:remove var="failedMsg" scope = "session"/>
                                </c:if>
                            <form action="update_profile" method="post">
                                <input type="hidden" value="${userObj.id}" name="id">
                                <div class="mb-3">
                                    <label for="exampleInputName1" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="exampleInputName1" name="name" value="${userObj.name}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" value="${userObj.email}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPhone1" class="form-label">Phone Number</label>
                                    <input type="number" class="form-control" id="exampleInputPhone1" name="phone" value="${userObj.phone}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" name="pass" required>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Update</button><br>
                                    <a href="changePass.jsp" style="text-decoration: none">Change Password</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
