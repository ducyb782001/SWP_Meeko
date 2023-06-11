<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<link href="../css/layout.css" rel="stylesheet" type="text/css" />
<!-- header.jsp -->
<header class="header d-flex flex-column">
    <div class="middle-header border border-bottom-1 order-2 order-md-1">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-3 col-lg-3 d-lg-block d-none block-logo">
                    <a href="home" class="logo">
                        <img src="//bizweb.dktcdn.net/100/450/808/themes/855625/assets/logo.png?1681832246171"
                             alt="Meeko">
                    </a>
                </div>
                <div class="col-xl-7 col-lg-6 block-search">
                    <div class="input-search-wrapper">
                        <input type="email" class="input-search rounded-pill" id="floatingInput"
                               placeholder="Tìm kiếm...">
                        <div class="search-icon">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </div>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 d-lg-flex align-items-center d-none header-right justify-content-end gap-3">
                    <div class="dropdown">
                        <i class="fa-regular fa-user fa-lg" data-bs-toggle="dropdown"></i>
                        <ul class="dropdown-menu">
                            <c:if test="${sessionScope.account == null}">
                                <li><a class="dropdown-item" href="/login">Đăng nhập</a></li>
                                <li><a class="dropdown-item" href="/register">Đăng ký</a></li>
                                </c:if>
                                <c:if test="${sessionScope.account != null}">
                                <li><a class="dropdown-item" onclick="getInformation()">${sessionScope.account.fullName}</a></li>
                                <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                                </c:if>
                        </ul>
                    </div>
                    <i class="fa-regular fa-heart fa-lg"></i>
                    <i class="fa-solid fa-cart-plus fa-lg"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="site-nav border border-bottom-1 order-1 order-md-2">
        <div class="container-navbar">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <div class="left-side d-flex justify-content-between align-items-center">
                        <a href="home" class="logo d-lg-none d-block">
                            <img src="//bizweb.dktcdn.net/100/450/808/themes/855625/assets/logo.png?1681832246171"
                                 alt="Meeko">
                        </a>
                        <div class="d-flex d-lg-none align-items-center gap-3">
                            <i class="fa-regular fa-heart fa-lg"></i>
                            <i class="fa-solid fa-cart-plus fa-lg"></i>
                            <button class="navbar-toggler" type="button" data-bs-toggle="modal"
                                    data-bs-target="#myModal1" aria-controls="navbarNav" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                        </div>
                    </div>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav navbar-home gap-4">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="home">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link dropdown-toggle" href="product">Sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Premium</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Blog</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Story</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>

<!-- Modal mobile nav responsive -->
<div class="modal left fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Left Sidebar</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Left Side bar
                </p>
            </div>
        </div><!-- modal-content -->
    </div><!-- modal-dialog -->
</div><!-- modal -->
<!-- Modal mobile nav responsive-->