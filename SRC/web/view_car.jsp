<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, entity.CarDetails, java.sql.*, model.CarDaoImpl, db.DBConnect, entity.User" %>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mua bán xe cũ: Car Details</title>
    <link rel="shortcut icon" href="https://cdn-icons-png.freepik.com/256/7581/7581962.png?semt=ais_hybrid" type="image/png">
    <%@ include file="component/bootstrap.jsp"%>
    <script>
        function updateQuantity(change) {
            var quantityInput = document.getElementById('quantity');
            var currentQuantity = parseInt(quantityInput.value);
            var newQuantity = currentQuantity + change;

            if (newQuantity < 1) {
                newQuantity = 1;  // Ensure quantity does not go below 1
            }

            quantityInput.value = newQuantity;
        }

        function validateQuantity(maxQuantity) {
            var quantityInput = document.getElementById('quantity');
            var selectedQuantity = parseInt(quantityInput.value);
            if (selectedQuantity > maxQuantity) {
                alert('Selected quantity exceeds available stock');
                return false;
            }
            return true;
        }
    </script>

    <style type="text/css">
        .crd-ho:hover {
            background-color: #fcf7f7;
        }

        .card-body {
            height: 265px;
        }

        .img-thumblin {
            width: 60%;
        }
    </style>
</head>
<body style="background-color: #f7f7f7">
    <%@ include file="component/navbar.jsp"%>
    <div class="container">
        <div class="row p-5">
            <%
                User u = (User) session.getAttribute("userObj");
                int id = Integer.parseInt(request.getParameter("carId"));
                CarDaoImpl dao = new CarDaoImpl(DBConnect.getConn());
                CarDetails car = dao.getCarById(id);
                NumberFormat formatter = NumberFormat.getInstance();
            %>  
            <div class="col-md-6 text-center p-5 border bg-light">
                <img src="cds/<%= car.getPhoto() %>" class="img-thumblin"><br>
            </div>

            <div class="col-md-6 p-5 border bg-light">
                <h3 class="mt-3"> <%= car.getCarName() %> </h3>
                <%
                    String carCategory = car.getCarCategory();
                    float price = Float.parseFloat(car.getPrice());
                    if ("Sale".equalsIgnoreCase(carCategory)) {
                        float salePrice = price * 0.8f;
                %>
                    <h5>
                        <span style="text-decoration: line-through"><%= formatter.format(price) %> đ</span>
                        <span><%= formatter.format(salePrice) %> đ</span>
                    </h5>
                <% } else { %>
                    <h5><span><%= formatter.format(price) %> đ</span></h5>
                <% } %>
                <% if (car.getQuantity() <= 0) { %>
                    <h5>Sold out</h5>
                    <a href="index.jsp" class="btn btn-outline-danger btn-sm">Continue Shopping</a>
                <% } else { %>
                    <h5><span>Stock Remaining: </span><span><%= car.getQuantity() %></span></h5>
                    <form action="cart" method="get" onsubmit="return validateQuantity(<%= car.getQuantity() %>);">
                        <input type="hidden" name="carId" value="<%= car.getCarId() %>">
                        <input type="hidden" name="uId" value="<%= u != null ? u.getId() : -1 %>">
                        <div class="quantity-container" style="display: flex; align-items: center;">
                            <button type="button" class="btn btn-outline-danger btn-sm" id="minus" onclick="updateQuantity(-1)">-</button>
                            <input type="text" id="quantity" name="quantity" value="1" min="1" style="width: 50px; height: 30px; text-align: center;">
                            <button type="button" class="btn btn-outline-danger btn-sm" id="plus" onclick="updateQuantity(1)">+</button>
                        </div>
                        <button type="submit" class="btn btn-outline-danger btn-sm mt-2"><i class="fa-solid fa-cart-plus"></i> Add To Cart</button>
                    </form>
                <% } %>                    
            </div>
        </div>

        <h5 class="text-center" style="margin-top: -30px;">RELATED PRODUCTS</h5>
        <div class="row">
            <%
                List<CarDetails> relatedCars = dao.getRelatedCars(car);
                for(CarDetails relatedCar : relatedCars) {
            %>  
                <div class="col-md-3">
                    <a href="view_car.jsp?carId=<%= relatedCar.getCarId() %>" style="text-decoration: none; color: black">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="cds/<%= relatedCar.getPhoto() %>" class="img-thumblin"><br>
                                <% if (relatedCar.getQuantity() <= 0) { %>
                                    <span>- <%= relatedCar.getCarName() %></span>
                                <% } else { %>
                                    <h5><%= relatedCar.getCarName() %></h5>
                                    <% 
                                        float relatedCarPrice = Float.parseFloat(relatedCar.getPrice());
                                        if ("Sale".equalsIgnoreCase(relatedCar.getCarCategory())) {
                                            float relatedSalePrice = relatedCarPrice * 0.8f;
                                    %>
                                        <p>
                                            <span style="text-decoration: line-through"><%= formatter.format(relatedCarPrice) %> đ</span>  
                                            <span><%= formatter.format(relatedSalePrice) %> đ</span>
                                        </p>
                                    <% } else { %>
                                        <p><%= formatter.format(relatedCarPrice) %> đ</p>
                                    <% } %>
                                <% } %>
                            </div>
                        </div>
                    </a>
                </div>
            <% } %>
        </div>
    </div>

    <%@ include file="component/footer.jsp"%>
</body>
</html>
