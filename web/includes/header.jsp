<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<link href="../css/layout.css" rel="stylesheet" type="text/css"/>
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
                        <form id="frm-seachtxt" action="searchByText" method="get">
                            <input type="text" name="textSearch" class="input-search rounded-pill" id="floatingInput"
                                   placeholder="Tìm kiếm...">
                            <div class="search-icon" onclick="submitTxtSearch()">
                                <i class="fa-solid fa-magnifying-glass" onclick="submitTxtSearch()"></i>
                            </div>
                        </form>
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
                    <i class="fa-regular fa-heart fa-lg" onclick="notFound()"></i>
                    <button class="navbar-toggler" type="button" data-bs-toggle="modal" data-bs-target="#cartModal"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa-solid fa-cart-plus fa-lg"></i>
                    </button>
                    <!-- Modal mobile nav responsive -->
                    <div class="modal right fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="myModalLabel">Giỏ hàng</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <!-- List items in Cart Will Show here -->
                                <div class="modal-body">
                                    <!-- Firt item -->
                                    <div class="mb-2 d-flex gap-2">
                                        <div class="">
                                            <a href="/be-lua-bong-winnie" class="ajaxcart__product-image cart_image"
                                               title="item-cart-1">
                                                <img class="img_item_in_cart"
                                                     src="https://bizweb.dktcdn.net/thumb/compact/100/450/808/products/cfa1d6c5-ffa0-4fcd-8349-51e83792254e.jpg"
                                                     alt="Bé lừa bông Winnie">
                                            </a>
                                        </div>
                                        <div class="w-100">
                                            <h6 class="mb-1">Bé lừa bông Winnie</h6>
                                            <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                                <div class="cart_quantity">
                                                    Số lượng
                                                </div>
                                                <p class="mb-0" style="color: #c83252; font-weight: bold;">300000 đ</p>
                                            </div>
                                            <div class="mb-1 d-flex justify-content-between gap-1 align-items-center">
                                                <div class="input-group">
                                                    <input type="number" class="input_cart_width" name="qty" value="1">
                                                </div>
                                                <p class="mb-0 cart_quantity">xóa</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- List items in Cart Will Show here -->

                                <div class="modal-footer d-block w-100">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6>Tổng tiền:</h6>
                                        <p style="color: #c83252; font-weight: bold; ">300000 đ</p>
                                    </div>
                                    <form action="orderCustomer" method="get">
                                        <button type="submit" class="btn btn-danger w-100">Thanh toán</button>
                                    </form>
                                </div>
                            </div><!-- modal-content -->
                        </div><!-- modal-dialog -->
                    </div><!-- modal -->
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
                                <a class="nav-link dropdown-toggle" data-bs-toggle="modal"
                                   data-bs-target="#exampleModalCenteredScrollable" style="cursor: pointer;">Sản
                                    phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="premium">Premium</a>
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

<!-- This section used to open modal when click on "Sản phẩm". Remember cut this section and put in on to header section  -->
<div class="modal fade" id="exampleModalCenteredScrollable" tabindex="-1"
     aria-labelledby="exampleModalCenteredScrollableTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenteredScrollableTitle">Tất cả thể loại</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="height: 600px;">
                <div class="row" style="height: 100%;">
                    <div class="col-3" style="height: 100%; overflow-y: auto; overflow-x: hidden;">
                        <!-- This section UL For each Category -->
                        <ul class="" style="list-style: none; padding-left: 0px;">
                            <li style="list-style: none;">
                                <a class="heading__category" href="listAllProduct">
                                    Tất cả sản phẩm
                                </a>
                            </li>
                            <li style="list-style: none;">
                                <a class="heading__category">
                                    Mềm mại
                                </a>
                                <!-- This section UL For each Sub-category -->
                                <ul style="list-style: none; padding-left: 0px; margin-top: 12px;">
                                    <!-- For loop from here  -->
                                    <li style="list-style: none; margin-bottom: 8px;">
                                        <a class="heading__sub_category">
                                            Gấu bông
                                        </a>
                                    </li>
                                    <li style="list-style: none; margin-bottom: 8px;">
                                        <a class="heading__sub_category">
                                            Gối ôm
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li style="list-style: none; margin-top: 22px;">
                                <a class="heading__category">
                                    Thư giãn
                                </a>
                                <!-- This section UL For each Sub-category -->
                                <ul style="list-style: none; padding-left: 0px; margin-top: 12px;">
                                    <!-- For loop from here  -->
                                    <li style="list-style: none; margin-bottom: 8px;">
                                        <a class="heading__sub_category">
                                            Đèn ngủ
                                        </a>
                                    </li>
                                    <li style="list-style: none; margin-bottom: 8px;">
                                        <a class="heading__sub_category">
                                            Máy phun sương
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li style="list-style: none; margin-top: 22px;">
                                <a class="heading__category">
                                    Cuộc sống thường ngày
                                </a>
                                <!-- This section UL For each Sub-category -->
                                <ul style="list-style: none; padding-left: 0px; margin-top: 12px;">
                                    <!-- For loop from here  -->
                                    <li style="list-style: none; margin-bottom: 8px;">
                                        <a class="heading__sub_category">
                                            Cốc
                                        </a>
                                    </li>
                                    <li style="list-style: none; margin-bottom: 8px;">
                                        <a class="heading__sub_category">
                                            Bình nước
                                        </a>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    <div class="col-9 row" style="height: 100%; overflow: hidden;">
                        <div class="col-6">
                            <img style="width: 100%; height: 100%;"
                                 src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/image_mega_1.jpg?1681832246171"
                                 alt="meeko" />
                        </div>
                        <div class="col-6">
                            <div style="height: 50%;">
                                <img style="width: 100%; height: 96%; object-fit: cover;"
                                     src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/image_mega_2.jpg?1681832246171" />
                            </div>
                            <div class="row" style="height: 50%;">
                                <div class="col-6">
                                    <img style="width: 100%; height: 100%; object-fit: cover;"
                                         src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/image_mega_3.jpg?1681832246171"
                                         alt="meeko">
                                </div>
                                <div class="col-6" style="height: 100%;">
                                    <img style="width: 100%; height: 100%; object-fit: cover;"
                                         src="https://bizweb.dktcdn.net/100/450/808/themes/855625/assets/image_mega_4.jpg?1681832246171"
                                         alt="meeko">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function notFound() {
        window.location.href = "notFound";
    }

    function getInformation() {
        window.location.href = "userProfile";
    }
    function submitTxtSearch(){
        document.getElementById('frm-seachtxt').submit();
    }
</script>
<script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>