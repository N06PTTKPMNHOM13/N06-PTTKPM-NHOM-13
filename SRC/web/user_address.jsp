<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="entity.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban xe cu: Address</title>
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
            <div class="row p-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-body">
                            <h4 class="text-center text-primary">Edit Address</h4>
                            <form action="" method="">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <label for="inputAddress" class="form-label">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" value="">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="inputCountry" class="form-label">Country</label>
                                        <input type="text" class="form-control" id="inputCountry" value="">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="inputCity" class="form-label">City</label>
                                        <input type="text" class="form-control" id="inputCity" value="">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="inputRegion" class="form-label">Region</label>
                                        <input type="text" class="form-control" id="inputRegion" value="">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="inputZip" class="form-label">Zip</label>
                                        <input type="number" class="form-control" id="inputZip">
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
