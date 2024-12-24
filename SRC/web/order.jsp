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
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban xe cu: Order</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
    </head>
    <body>
    <body style="background-color: #f7f7f7">
        <%@include file="component/navbar.jsp"%>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="container-fluid">
            <h4 class="text-center mt-3">Your Order</h4>
            <table class="table table-striped mt-3">
                <thead>
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Car Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment</th>
                        <th scope="col">Order Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        User u = (User) session.getAttribute("userObj");
                        OrderDAO dao = new OrderDAO(DBConnect.getConn());
                        List<Order> list = dao.getCar(u.getEmail());
                        NumberFormat formatter = NumberFormat.getInstance();
                        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                        for (Order o : list) {
                    %>
                    <tr>
                        <th scope="row"><%=o.getOrderId()%></th>
                        <td><%=o.getUserName()%></td>
                        <td><%=o.getCarName()%></td>
                        <td><%=o.getQuantity()%></td>
                        <td><%=formatter.format(Float.parseFloat(o.getPrice()))%></td>
                        <td><%=o.getPayment()%></td>
                        <td><%=sdf.format(o.getDate())%></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
