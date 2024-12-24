<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@700&display=swap" rel="stylesheet">
<div class="container-fluid p-3 bg-light">
    <div class="row align-items-center">
        <div class="col-md-4 text-danger">
            <a href="index.jsp" style="text-decoration: none; color: #f06292; font-family: 'Merriweather', serif;"><h3>Mua ban xe cu</h3></a>
        </div>

        <div class="col-md-4">
            <form class="d-flex" role="search" action="search.jsp">
                <input class="form-control me-2" type="search" name="key" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-danger" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
        <div class="col-md-4 ms-auto text-end">
            <c:if test="${not empty userObj}">
                <a href="" class="btn btn-success"><i class="fa-solid fa-user"></i> ${userObj.name}</a>
                <a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
            </c:if>

            <c:if test="${empty userObj}">
                <a href="login.jsp" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
            </c:if>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="text-center">
                    <h4>Do you want to logout?</h4>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <a href="logout" class="btn btn-primary">Logout</a>
                </div>
            </div>
        </div>
    </div>
</div>

<nav id="navbar" class="navbar navbar-expand-lg navbar-dark bg-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house"></i></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">HOME</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="all_products.jsp">ALL PRODUCTS</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="new_arrivals.jsp">NEW ARRIVALS</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="trending.jsp">TRENDING</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="sale.jsp">SALE</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <a href="checkOut.jsp" class="btn btn-light"><i class="fa-solid fa-cart-shopping"></i></a>
                <a href="setting.jsp" class="btn btn-light" type="submit"><i class="fa-solid fa-gear"></i></a>              
            </form>
        </div>
    </div>
</nav>

<style>
    #navbar {
        transition: top 0.3s;
    }
</style>

<script>
    window.onscroll = function () {
        fixNavbar();
    };

    function fixNavbar() {
        var navbar = document.getElementById("navbar");
        if (window.pageYOffset > 0) {
            navbar.classList.add("fixed-top");
            navbar.style.top = "0";
        } else {
            navbar.classList.remove("fixed-top");
            navbar.style.top = "";
        }
    }
</script>
