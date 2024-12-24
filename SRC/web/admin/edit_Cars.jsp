<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, entity.CarDetails, java.sql.*, model.CarDaoImpl, db.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin: Edit Cars</title>
    <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
    <%@ include file="bootstrap.jsp" %>
</head>
<body style="background-color: #f7f7f7">
    <%@ include file="navbar.jsp" %>
    
    <c:if test="${empty userObj}">
        <c:redirect url="../login.jsp"/>
    </c:if>
    
    <c:if test="${userObj.role ne 1}">
        <c:redirect url="../index.jsp"/>
    </c:if>

    <div class="container">
        <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">Edit Cars</h3>

                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session"/>
                        </c:if>

                        <%
                            int carId = Integer.parseInt(request.getParameter("carId"));
                            CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
                            CarDetails car = dao.getCarById(carId);
                        %>

                        <form action="../editCars" method="post">
                            <div class="mb-3">
                                <label for="exampleInputCarId1" class="form-label">ID</label>
                                <input type="text" class="form-control" id="exampleInputCarId1" name="carId" value="<%= car.getCarId() %>" readonly="">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputCarName1" class="form-label">Car Name</label>
                                <input type="text" class="form-control" id="exampleInputCarName1" name="carName" value="<%= car.getCarName() %>">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPrice1" class="form-label">Price</label>
                                <input type="text" class="form-control" id="exampleInputPrice1" name="price" value="<%= car.getPrice() %>">
                            </div>
                            <div class="mb-3">
                                <label for="inputYear" class="form-label">Car Year</label>
                                <input type="text" id="inputYear" name="carYear" class="form-control" value="<%= car.getYear() %>">
                            </div>
                            <div class="mb-3">
                                <label for="quantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="exampleInputQuantity1" name="quantity" value="<%= car.getQuantity() %>">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Update</button>
                                <button type="reset" class="btn btn-primary">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
