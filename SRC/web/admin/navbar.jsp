<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@700&display=swap" rel="stylesheet">
<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-4 text-danger">
                <a href="index.jsp" style="text-decoration: none; color: #f06292; font-family: 'Merriweather', serif;"><h3>Mua ban xe cu</h3></a>
        </div>

        <div class="col-md-4">
        </div>

        <div class="col-md-4 ms-auto text-end">
            <c:if test="${not empty userObj}">
                <a class="btn btn-success"><i class="fa-solid fa-user"></i> ${userObj.name}</a>
                <a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
            </c:if>

            <c:if test="${empty userObj}">
                <a href="../login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                <a href="../register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
            </c:if>

        </div>
    </div>
</div>

<!-- logout modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="text-center">
                    <h4>Do you want to logout?</h4>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <a href="../logout" class="btn btn-primary">Logout</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!<!-- end logout modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom" >
    <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp"><i class="fa-solid fa-house"></i></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home.jsp">HOME</a>
                </li>
        </div>
    </div>
</nav>