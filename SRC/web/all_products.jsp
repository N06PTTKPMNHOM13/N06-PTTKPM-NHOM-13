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
                <div class="col-md-3">
                    <form id="sortForm" action="all_products.jsp" method="get">
                        <select name="orderBy" class="form-select" onchange="document.getElementById('sortForm').submit()">
                            <option value="default" <%= "default".equals(request.getParameter("orderBy")) || request.getParameter("orderBy") == null ? "selected" : "" %>>Default</option>
                            <option value="price" <%= "price".equals(request.getParameter("orderBy")) ? "selected" : "" %>>Price: Low to High</option>
                            <option value="price DESC" <%= "price DESC".equals(request.getParameter("orderBy")) ? "selected" : "" %>>Price: High to Low</option>
                        </select>
                    </form>
                </div>
            </div>
            <div class="row">
                <%
    String orderBy = request.getParameter("orderBy");
    CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
    List<CarDetails> list;
    if (orderBy == null || orderBy.isEmpty() || "default".equals(orderBy)) {
        list = dao.allProducts();
    } else {
        list = dao.allProducts(orderBy);
    }
    NumberFormat formatter = NumberFormat.getInstance();
    formatter.setMaximumFractionDigits(2); 
    for (CarDetails car : list) {
        try {
            String priceStr = car.getPrice();
            if (priceStr != null && !priceStr.isEmpty()) {
                priceStr = priceStr.trim().replace(".", ""); 
                if (priceStr.matches("^[0-9]+(\\.[0-9]+)?$")) { 
                    float price = Float.parseFloat(priceStr);
                %>
                <div class="col-md-3">
                    <a href="view_car.jsp?carId=<%= car.getCarId() %>" style="text-decoration: none; color: black">
                        <div class="card crd-ho mt-3">
                            <div class="card-body text-center">
                                <img src="cds/<%= car.getPhoto() %>" style="width: 100%" class="img-thumblin">
                                <span>- <%= car.getCarName() %></span>
                                <% if ("Sale".equalsIgnoreCase(car.getCarCategory())) { %>
                                <p>
                                    <span style="text-decoration: line-through"><%= formatter.format(price) %><i class="fa-solid fa-dong-sign"></i></span>
                                    <span><%= formatter.format(price * 0.8) %><i class="fa-solid fa-dong-sign"></i></span>
                                </p>
                                <% } else { %>
                                <p><%= formatter.format(price) %><i class="fa-solid fa-dong-sign"></i></p>
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
                <%
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace(); 
                        }
                    }
                %>
            </div>
        </div>

        <%@include file="component/footer.jsp"%>
    </body>
</html>
