<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban xe cu: Setting</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
        <style type="text/css">
            a {
                text-decoration: none;
                color: black;
            }
            
            a:hover {
                text-decoration: none;
            }
            
            .crd-ho:hover {
                background-color: #fcf7f7;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="component/navbar.jsp"%>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="container">
            <h1 class="text-center mt-5">Hello, ${userObj.name}</h1>
            <div class="row p-5">
                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-regular fa-id-card fa-3x"></i>
                                </div>
                                <h4>Login & Security</h4>
                                <p>Edit Profile</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="order.jsp">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                    <i class="fa-solid fa-box-open fa-3x"></i>
                                </div>
                                <h4>My Order</h4>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="contact.jsp">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <div class="text-success">
                                    <i class="fa-solid fa-user-tie fa-3x"></i>
                                </div>
                                <h4>Help Center</h4>
                                <p>24/7 Service</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
