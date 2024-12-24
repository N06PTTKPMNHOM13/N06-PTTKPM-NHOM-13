<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="java.util.*" %>
<%@page import="entity.*" %>
<%@page import="java.sql.*" %>
<%@page import="model.*" %>
<%@page import="db.DBConnect" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="java.text.NumberFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban xe cu: Cart</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="component/navbar.jsp"%>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <c:if test="${not empty succMsg}">
            <div class="alert alert-success text-center" role="alert">${succMsg}</div>
            <c:remove var="succMsg" scope = "session"/>
        </c:if>

        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
            <c:remove var="failedMsg" scope = "session"/>
        </c:if>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="card bg-light">
                        <h3 class="text-center">Your Selected Items</h3>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Car Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        User u = (User) session.getAttribute("userObj");
                                        CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                                        List<Cart> list = dao.getCarByUser(u.getId());
                                        NumberFormat formatter = NumberFormat.getInstance();
                                        float totalPrice = 0;
                                        for (Cart c : list) {
                                            CarDaoImpl dao2 = new CarDaoImpl(DBConnect.getConn());
                                            CarDetails car = dao2.getCarById(c.getCarId());
                                            float p = c.getPrice();
                                            if ("Sale".equalsIgnoreCase(car.getCarCategory())) {
                                                p = c.getPrice() * 0.8f;
                                            }
                                            totalPrice += p * c.getQuantity();
                                    %>
                                    <tr>
                                        <th scope="row"><%=c.getCarName()%></th>
                                        <td><%=formatter.format(p)%></td>
                                        <td><%=c.getQuantity()%></td>
                                        <td><%=formatter.format(p * c.getQuantity())%></td>
                                        <td>
                                            <a href="remove_car?carId=<%=c.getCarId()%>&uId=<%=c.getuId()%>&cId=<%=c.getcId()%>" class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                    <% } %>
                                    <tr>
                                        <th scope="row">Total Price</th>
                                        <td colspan="3"></td>
                                        <td><%=formatter.format(totalPrice)%></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 mt-3">
                    <div class="card bg-light">
                        <h3 class="text-center">Your Details</h3>
                        <div class="card-body">
                            <form class="row g-3" action="order" method="post">
                                <input type="hidden" value="${userObj.id}" name="id">
                                <div class="col-md-6">
                                    <label for="inputName" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="inputName" name="userName" value="${userObj.name}" readonly="" required="">
                                </div>
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="inputEmail4" name="email" value="${userObj.email}" readonly="" required="">
                                </div>
                                <div class="col-md-6">
                                    <label for="inputPhone" class="form-label">Phone number</label>
                                    <input type="number" class="form-control" id="inputPhone" name="phone" value="${userObj.phone}" required="">
                                </div>
                                <div class="col-md-6">
                                    <label for="inputPayment" class="form-label">Payment</label>
                                    <select id="inputPayment" class="form-select" name="payment">
                                        <option value="none">Choose...</option>
                                        <option value="COD">Cash On Delivery</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <label for="inputAddress" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="inputAddress" name="address" value="" required="">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-outline-danger">Order</button>
                                    <a href="index.jsp" class="btn btn-outline-success">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="component/footer.jsp"%>
    </body>
</html>
