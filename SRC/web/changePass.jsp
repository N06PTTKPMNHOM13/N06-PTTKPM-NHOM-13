<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban xe cu: Change Password</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
        <script>
            function validateForm() {
                var oldPass = document.getElementById("exampleInputPassword1").value;
                var newPassword = document.getElementById("exampleInputPassword2").value;
                var confirmPassword = document.getElementById("exampleInputPassword3").value;
                if (oldPass == newPassword) {
                    alert("New password is the same with old password.");
                    return false;
                }
                if (newPassword !== confirmPassword) {
                    alert("New passwords do not match.");
                    return false;
                }
                return true;
            }
        </script>
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
                            <h4 class="text-center">Change Password</h4>
                            <c:if test="${not empty succMsg}">
                                <P class="text-center text-success">${succMsg}</P>
                                    <c:remove var="succMsg" scope = "session"/>
                                </c:if>

                            <c:if test="${not empty failedMsg}">
                                <P class="text-center text-danger">${failedMsg}</P>
                                    <c:remove var="failedMsg" scope = "session"/>
                                </c:if>
                            <form action="change_pass" method="post" onsubmit="return validateForm()">
                                <input type="hidden" value="${userObj.id}" name="id">
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Old Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" name="oldPass" required>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword2" class="form-label">New Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword2" name="newPass" required>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword3" class="form-label">Confirm New Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword3" name="confirmPass" required>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Update</button><br>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
