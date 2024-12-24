<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="entity.*" %>
<%@page import="java.sql.*" %>
<%@page import="model.*" %>
<%@page import="db.DBConnect" %>
<%@page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua ban o to cu</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
        <%@include file="component/bootstrap.jsp"%>
        <style type="text/css">
            .raptor-img{
                background: url("img/raptor.jpg");
                height: 60vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }

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
        <% User u = (User) session.getAttribute("userObj"); %>
        <%@include file="component/navbar.jsp"%>
        <div class="container raptor-img">
            <h2></h2>
        </div>

        <!-- ALL PRODUCTS -->
        <div class="container mt-3">
            <h3 class="text-center">ALL PRODUCTS</h3>
            <div class="row">
                <%
                    CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
                    List<CarDetails> list1 = dao.getAllProducts();
                    NumberFormat formatter = NumberFormat.getInstance();
                    for(CarDetails car : list1) {
                %>  
                <div class="col-md-3">
                    <a href="view_car.jsp?carId=<%= car.getCarId() %>" style="text-decoration: none; color: black">
                        <div class="card crd-ho">
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

            <div class="text-center mt-2">
                <a href="all_products.jsp" class="btn btn-outline-danger btn-sm">View All</a>
            </div>
            <hr>
        </div>
        <!-- End ALL PRODUCTS -->

        <!-- NEW ARRIVALS -->
        <div class="container">
            <h3 class="text-center">NEW ARRIVALS</h3>
            <div class="row">
                <%
                    List<CarDetails> list2 = dao.getNewArrivals();
                    for(CarDetails car : list2) {
                %>  
                <div class="col-md-3">
                    <a href="view_car.jsp?carId=<%= car.getCarId() %>" style="text-decoration: none; color: black">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="cds/<%= car.getPhoto() %>" style="width: 100%" class="img-thumblin">
                                <span>- <%= car.getCarName() %></span>
                                <p><%= formatter.format(Float.parseFloat(car.getPrice())) %><i class="fa-solid fa-dong-sign"></i></p> 
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

            <div class="text-center mt-2">
                <a href="new_arrivals.jsp" class="btn btn-outline-danger btn-sm">View All</a>
            </div>
            <hr>
        </div>
        <!-- End NEW ARRIVALS -->

        <!-- TRENDING -->
        <div class="container">
            <h3 class="text-center">TRENDING</h3>
            <div class="row">
                <%
                    List<CarDetails> list3 = dao.getTrending();
                    for(CarDetails car : list3) {
                %>  
                <div class="col-md-3">
                    <a href="view_car.jsp?carId=<%= car.getCarId() %>" style="text-decoration: none; color: black">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="cds/<%= car.getPhoto() %>" style="width: 100%" class="img-thumblin">
                                <span>- <%= car.getCarName() %></span>
                                <p><%= formatter.format(Float.parseFloat(car.getPrice())) %><i class="fa-solid fa-dong-sign"></i></p> 
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

            <div class="text-center mt-2">
                <a href="trending.jsp" class="btn btn-outline-danger btn-sm">View All</a>
            </div>
            <hr>
        </div>
        <!-- End TRENDING -->

        <!-- SALE -->
        <div class="container">
            <h3 class="text-center">SALE</h3>
            <div class="row">
                <%
                    List<CarDetails> list4 = dao.getSale();
                    for(CarDetails car : list4) {
                %>  
                <div class="col-md-3">
                    <a href="view_car.jsp?carId=<%= car.getCarId() %>" style="text-decoration: none; color: black">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="cds/<%= car.getPhoto() %>" style="width: 100%" class="img-thumblin">
                                <span>- <%= car.getCarName() %></span>
                                <p><span style="text-decoration: line-through"><%= formatter.format(Float.parseFloat(car.getPrice())) %><i class="fa-solid fa-dong-sign"></i></span>  
                                    <span><%= formatter.format(Float.parseFloat(car.getPrice()) * 0.8) %><i class="fa-solid fa-dong-sign"></i></span></p>
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

            <div class="text-center mt-2">
                <a href="sale.jsp" class="btn btn-outline-danger btn-sm">View All</a>
            </div>
        </div>
        <!-- End SALE -->

        <%@include file="component/footer.jsp"%>
    </body>
</html> 
