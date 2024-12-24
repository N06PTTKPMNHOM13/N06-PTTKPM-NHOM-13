<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="bootstrap.jsp"%>
        <style type="text/css">
            a {
                text-decoration: none;
                color: black;
            }
            
            .crd-ho:hover {
                background-color: #fcf7f7;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp"%>

        <c:if test="${empty userObj}">
            <c:redirect url="../login.jsp"/>
        </c:if>
        
        <c:if test="${userObj.role ne 1}">
            <c:redirect url="../index.jsp"/>
        </c:if>
        
        <div class="container">
            <h1 class="text-center mt-5">Admin</h1>
            <div class="row p-5">
                <div class="col-md-4">
                    <a href="add_Cars.jsp">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-circle-plus fa-3x text-primary"></i><br>
                                <h4>Add Car</h4>
                                ----------
                            </div>
                        </div>
                    </a>
                </div>


                <div class="col-md-4">
                    <a href="all_Cars.jsp">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-compact-disc fa-3x text-danger"></i><br>
                                <h4>All Cars</h4>
                                ----------
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="orders.jsp">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-cart-shopping fa-3x text-success"></i><br>
                                <h4>Orders</h4>
                                ----------
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>    
    </body>
</html>
