<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="entity.CarDetails" %>
<%@page import="java.sql.*" %>
<%@page import="model.CarDaoImpl" %>
<%@page import="db.DBConnect" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Cars</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="bootstrap.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="navbar.jsp"%>

        <c:if test="${empty userObj}">
            <c:redirect url="../login.jsp"/>
        </c:if>

        <c:if test="${userObj.role ne 1}">
            <c:redirect url="../index.jsp"/>
        </c:if>

        <h3 class="text-center mt-3">All Cars</h3>
        <div class="container-fluid">
            <c:if test="${not empty succMsg}">
                <P class="text-center text-success">${succMsg}</P>
                <c:remove var="succMsg" scope = "session"/>
            </c:if>

            <c:if test="${not empty failedMsg}">
                <P class="text-center text-danger">${failedMsg}</P>
                <c:remove var="failedMsg" scope = "session"/>
            </c:if>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Image</th>
                        <th scope="col">Car Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        <th scope="col">Year</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
                        List<CarDetails> list = dao.getAllCars();
                        NumberFormat formatter = NumberFormat.getInstance();
                        for(CarDetails car : list) {
                            String priceStr = car.getPrice();
                            float price = 0;
                            try {
                                price = Float.parseFloat(priceStr);
                            } catch (NumberFormatException e) {
                                // Handle the error, e.g., set price to 0 or some default value
                                out.println("Invalid price format for car ID " + car.getCarId() + ": " + priceStr);
                            }
                    %>    
                    <tr>
                        <td><%= car.getCarId() %></td>
                        <td><img src="../cds/<%= car.getPhoto() %>" style="width: 50px; height: 50px"/></td>
                        <td><%= car.getCarName() %></td>
                        <td><%= formatter.format(price) %></td>
                        <td><%= car.getCarCategory() %></td>
                        <td><%= car.getYear() %></td>
                        <td><%= car.getQuantity() %></td>
                        <td>
                            <a href="edit_Cars.jsp?carId=<%= car.getCarId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a data-bs-toggle="modal" data-bs-target="#exampleModal<%= car.getCarId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i></a>
                            <div class="modal fade" id="exampleModal<%= car.getCarId() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <h4>Are you sure you want to delete this Car?</h4>
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <a href="../deleteCars?carId=<%= car.getCarId() %>" class="btn btn-primary">Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%  } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
