<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="entity.*" %>
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
        <title>Mua ban xe cu: All Products</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
        <style type="text/css">
            .crd-ho:hover {
                background-color: #fcf7f7;
            }
            
            .card-body {
                height: 400px
            }
            
            .card-footer {
                text-align: center
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="component/navbar.jsp"%>
        <% User u = (User) session.getAttribute("userObj"); %>
        <div class="container mt-3">
            <div class="row">
                <%
                    String key = request.getParameter("key");
                    CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
                    List<CarDetails> list = dao.getCarBySearch(key);
                    NumberFormat formatter = NumberFormat.getInstance();
                    for(CarDetails car : list) {
                %>  
                <div class="col-md-3">
                    <a href="view_car.jsp?carId=<%= car.getCarId() %>" style="text-decoration: none; color: black">
                        <div class="card crd-ho mt-3">
                            <div class="card-body text-center">
                                <img src="cds/<%= car.getPhoto() %>" style="width: 100%" class="img-thumblin">
                                <span>- <%= car.getCarName() %></span>
                                <% if ("Sale".equalsIgnoreCase(car.getCarCategory())) {%>
                                    <p><span style="text-decoration: line-through"><%= formatter.format(Float.parseFloat(car.getPrice())) %><i class="fa-solid fa-dong-sign"></i></span>  
                                    <span><%= formatter.format(Float.parseFloat(car.getPrice()) * 0.8) %><i class="fa-solid fa-dong-sign"></i></span></p>
                                <% } else { %>
                                    <p><%= formatter.format(Float.parseFloat(car.getPrice())) %><i class="fa-solid fa-dong-sign"></i></p>
                                <% } %>
                            </div>
                            <div class="card-footer">
                                <% if (car.getQuantity() <= 0) { %>
                                <button class="btn btn-outline-danger btn-sm">Sold Out</button>
                                <% } else { %>
                                <% if (u == null) { %>
                                <a href="login.jsp" class="btn btn-outline-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add To Cart</a>
                                <% } else { %>
                                <a href="cart?carId=<%= car.getCarId() %>&uId=<%= u.getId() %>&quantity=1" class="btn btn-outline-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add To Cart</a>
                                <% } %>
                                <% } %>
                            </div>
                        </div>
                    </a>
                </div>
                <%  }  %>
            </div>
        </div>

        <%@include file="component/footer.jsp"%>
    </body>
</html>
