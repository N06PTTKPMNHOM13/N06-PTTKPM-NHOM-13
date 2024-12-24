<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin: Add Cars</title>
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

    <div class="container mt-3">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">Add Product</h3>
                        <c:if test="${not empty succMsg}">
                            <p class="text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session"/>
                        </c:if>

                        <form action="../addCars" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="exampleInputCarName1" class="form-label">Car Name</label>
                                <input type="text" class="form-control" id="exampleInputCarName1" name="carName" required>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPrice1" class="form-label">Price</label>
                                <input type="text" class="form-control" id="exampleInputPrice1" name="price" required>
                            </div>
                            <div class="mb-3">
                                <label for="inputState" class="form-label">Car Categories</label>
                                <select id="inputState" name="categories" class="form-control" required>
                                    <option hidden="">Choose...</option>
                                    <option value="New">New Arrivals</option>
                                    <option value="Trend">Trending</option>
                                    <option value="Sale">Sale</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="inputYear" class="form-label">Car Year</label>
                                <input type="number" id="inputYear" name="carYear" class="form-control" min="1900" max="2100" placeholder="Enter year" required>
                            </div>
                            <div class="mb-3">
                                <label for="quantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="exampleInputPrice1" name="quantity" required>
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlFile1" class="form-label">Upload Photo</label>
                                <input type="file" class="form-control-file" id="exampleFormControlFile1" name="carImg" required>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Add</button>
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
