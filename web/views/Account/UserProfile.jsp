<%-- 
    Document   : UserProfile
    Created on : Jun 13, 2023, 11:54:34 AM
    Author     : dell
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="../../css/account.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/layout.css" rel="stylesheet" type="text/css"/>
        <script src="script.js"></script>
        <style>
            th{
                width: 100px;
            }
        </style>
    </head>
    <body>
        <%@ include file="../../includes/header.jsp" %>
        <div class="row container-home"
             style="padding-left: 1%;padding-right: 64px; padding-top: 60px; padding-bottom: 60px; width: 100%;">
            <div class="col-lg-2 px-2">
                <!-- Left section -->
                <div class="nav group__left__account mb-3" style="display: block;" role="tablist">
                    <h4 style="font-weight: 200;">
                        TRANG TÀI KHOẢN
                    </h4>
                    <h6 style="font-weight: bold;">Xin chào, ${sessionScope.account.fullName}!</h6>
                    <div class="mt-4 mb-2 active left__account" style="font-size: 17px;" data-bs-toggle="pill"
                         data-bs-target="#pills-accounts" type="button" role="tab">
                        Thông tin tài khoản
                    </div>
                    <div class="mb-2 left__account" style="font-size: 17px;" data-bs-toggle="pill"
                         data-bs-target="#pills-carts" type="button" role="tab">
                        Đơn hàng của bạn
                    </div>
                    <div class="mb-2 left__account" style="font-size: 17px;" data-bs-toggle="pill"
                         data-bs-target="#pills-password" type="button" role="tab">
                        Đổi mật khẩu
                    </div>
                </div>
            </div>
            <div class="col-lg-10 px-2">
                <!-- Right Section  -->
                <div class="tab-content mb-3">
                    <!-- This section is use for account tab  -->
                    <section class="tab-pane fade show active" id="pills-accounts">
                        <h3 style="font-weight: 300;">
                            TRANG TÀI KHOẢN
                        </h3>
                        <p class="mt-4"><span style="font-weight: bold;">Họ tên: </span>${sessionScope.account.fullName}</p>
                        <p><span style="font-weight: bold;">Email:</span> ${sessionScope.account.email}</p>
                        <p><span style="font-weight: bold;">Phone:</span> ${sessionScope.account.phone}</p>
                        <p><span style="font-weight: bold;">Address:</span> ${sessionScope.account.address}</p>
                    </section>

                    <!-- This section is use for see cart tab  -->
                    <section class="tab-pane fade show" id="pills-carts">
                        <h3 style="font-weight: 300;">
                            Đơn hàng của bạn
                        </h3>
                        <div class="mt-1">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Đơn hàng</th>
                                        <th scope="col">Ngày</th>
                                        <th scope="col">Địa chỉ</th>
                                        <th scope="col">Giá trị đơn hàng</th>
                                        <th scope="col">TT thanh toán</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Chi tiết đơn hàng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${sessionScope.orders.size() != 0}">
                                        <c:set value="${sessionScope.orders.size()}" var="orderSize"></c:set>
                                        <c:forEach begin="0" step="1" end="${orderSize-1}" var="i">
                                            <tr>
                                                <th scope="row">${i+1}</th>
                                                <td>${sessionScope.orders.get(i).dateTime}</td>
                                                <td>${sessionScope.orders.get(i).customerAddress}</td>
                                                <fmt:formatNumber value="${sessionScope.orders.get(i).totalOrder}" pattern="#,##0.000" var="formattedNumber" />
                                                <td> ${formattedNumber}đ</td>
                                                <td>${sessionScope.orders.get(i).paymentMethod.paymentMethod}</td>
                                                <td>${sessionScope.orders.get(i).status.statusValue}</td>
                                                <td><button style="border: none;border-radius: 5px;background-color: #3dd5f3; padding: 4px"
                                                            type="button" data-bs-toggle="modal"
                                                            data-bs-target="#detailOrder_${sessionScope.orders.get(i).orderId}">Xem</button>
                                                </td>
                                            </tr>

                                            <!--Modal Detail-->
                                        <div class="modal fade" id="detailOrder_${sessionScope.orders.get(i).orderId}" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Chi tiết đơn hàng</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="mt-3 mb-3">
                                                            <c:forEach items="${sessionScope.orders.get(i).orderDetails}" var="ord">
                                                                <div class="row">
                                                                    <div class="col-2">
                                                                        <a href="/be-lua-bong-winnie" class="ajaxcart__product-image cart_image" title="item-cart-1">
                                                                            <img class="" style="width: 100px; height: 100px; border-radius: 8px;"
                                                                                 src="${ord.product.images.get(0).image}"
                                                                                 alt="Bé lừa bông Winnie">
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p>${ord.product.name}</p>
                                                                        <p>${ord.product.classValue}</p>
                                                                        <p>Số lượng: ${ord.quantity}</p>
                                                                        <p>
                                                                            <fmt:formatNumber value="${ord.product.price}" pattern="#,##0.000" var="formattedNumber" />
                                                                            Giá: ${formattedNumber}đ
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <p class="fw-bold">Tổng tiền:</p>
                                                                        <c:set var="total" value="${ord.product.price * ord.quantity}"></c:set>
                                                                        <fmt:formatNumber value="${total}" pattern="#,##0.000" var="formattedTotal" />
                                                                        <p>${formattedTotal}đ</p>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="d-flex gap-2">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">
                                                                Đóng
                                                            </button>
                                                            <c:if test="${sessionScope.orders.get(i).status.statusOrderID == 1}">
                                                                <form id="frm-cancel-${sessionScope.orders.get(i).orderId}" action="userProfile" method="post">
                                                                    <input type="hidden" value="cancel" name="action">
                                                                    <input type="hidden" value="${sessionScope.orders.get(i).orderId}" name="id">
                                                                    <button type="button" class="btn btn-danger"
                                                                            data-bs-dismiss="modal" onclick="cancelOrder('${sessionScope.orders.get(i).orderId}')">
                                                                        Hủy đơn hàng
                                                                    </button>
                                                                </form>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <!-- This section is use for change password  -->
                    <section class="tab-pane fade show" id="pills-password">
                        <h3 style="font-weight: 300;">
                            ĐỔI MẬT KHẨU
                        </h3>
                        <c:if test="${sessionScope.account.emailID == null}">
                            <p class="mt-4">Để đảm bảo tính bảo mật vui lòng đặt mật khẩu với ít nhất 8 kí tự và 1 ký tự đặc biệt
                            </p>
                            <form id="frm-changePass" action="changePassword" method="post" class="mt-2">
                                <h6>MẬT KHẨU <span class="text-danger">*</span></h6>
                                <input id="input-oldPwd" name="oldPwd" type="password" class="form-control mb-2" placeholder="Mật khẩu cũ"
                                       aria-label="Username" required>
                                <h6 class="mt-3">MẬT KHẨU MỚI <span class="text-danger">*</span></h6>
                                <input id="input-newPwd" type="password" class="form-control mb-2" placeholder="Mật khẩu mới" name="newPwd"
                                       aria-label="Username" required oninput="validatePwd(this)"/>
                                <h6 class="mt-3">XÁC NHẬN LẠI MẬT KHẨU <span class="text-danger">*</span></h6>
                                <span style="color: red;display: none" id="error-newPwd"></span>
                                <input id="input-cfPwd" type="password" class="form-control mb-2" placeholder="Xác nhận lại mật khẩu"
                                       aria-label="Username" required oninput="validateCfPwd(this)"/>
                                <span style="color: red;display: none" id="error-cfPwd"></span>
                                <button type="button" onclick="changePass()" class="btn btn-dark mt-4">Đặt lại mật khẩu</button>
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.account.emailID != null}">
                            <p class="mt-4" style="color: red">Bạn đang dùng tài khoản email để đăng nhập!
                            </p>
                        </c:if>
                    </section>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>
    <%@ include file="../../includes/footer.jsp" %>

    <script>
                                    // Get the modal
                                    var modal = document.getElementById("myModal");

                                    // Get the button that opens the modal
                                    var btn = document.getElementById("myBtn");

                                    // Get the <span> element that closes the modal
                                    var span = document.getElementsByClassName("close")[0];

                                    // When the user clicks the button, open the modal 
                                    btn.onclick = function () {
                                        modal.style.display = "block";
                                    };

                                    // When the user clicks on <span> (x), close the modal
                                    span.onclick = function () {
                                        modal.style.display = "none";
                                    };

                                    // When the user clicks anywhere outside of the modal, close it
                                    window.onclick = function (event) {
                                        if (event.target === modal) {
                                            modal.style.display = "none";
                                        }
                                    };
                                    function rateOrder(id) {
                                        window.location.href = 'rateOrder?id=' + id;
                                    }

                                    var checkNewPwd = false;
                                    var checkCfPass = false;

                                    function changePass() {
                                        var oldPwd = document.getElementById('input-oldPwd').value;
                                        var newPwd = document.getElementById('input-newPwd').value;
                                        var cfPwd = document.getElementById('input-cfPwd').value;
                                        if (oldPwd === '' && newPwd === '' && cfPwd === '') {
                                            alert('Vui lòng kiểm tra lại thông tin');
                                        } else {
                                            if (checkNewPwd && checkCfPass) {
                                                document.getElementById('frm-changePass').submit();
                                            } else {
                                                alert('Vui lòng kiểm tra lại thông tin');
                                            }

                                        }
                                    }

                                    function validatePwd(input) {
                                        var value = input.value;
                                        var regex = /^(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$/;

                                        if (!regex.test(value)) {
                                            document.getElementById('error-newPwd').textContent = "Mật khẩu phải chứa ít nhất 1 ký tự đặc biệt và có độ dài tối thiểu là 8 ký tự";
                                            document.getElementById('error-newPwd').style.display = "block";
                                            checkNewPwd = false;
                                        } else {
                                            document.getElementById('error-newPwd').textContent = "";
                                            document.getElementById('error-newPwd').style.display = "none";
                                            checkNewPwd = true;
                                        }
                                    }

                                    function validateCfPwd(input) {
                                        var newPwd = document.getElementById('input-newPwd').value;
                                        var value = input.value;
                                        if (value !== newPwd) {
                                            document.getElementById('error-cfPwd').textContent = "Mật khẩu xác nhận không giống mật khẩu mới";
                                            document.getElementById('error-cfPwd').style.display = "block";
                                            checkCfPass = false;
                                        } else {
                                            document.getElementById('error-cfPwd').textContent = "";
                                            document.getElementById('error-cfPwd').style.display = "none";
                                            checkCfPass = true;
                                        }
                                    }
                                    function cancelOrder(id) {
                                        var c = confirm('Bạn có chắc hủy đơn hàng này?');
                                        if (c) {
                                            document.getElementById('frm-cancel-' + id).submit();
                                        }
                                    }
    </script>

</html>
