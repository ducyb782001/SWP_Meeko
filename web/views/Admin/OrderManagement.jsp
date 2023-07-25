<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Product</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>
    <body>

        <%@ include file="../../includes/admin_header.jsp" %>
        <%@ include file="../../includes/admin_left.jsp" %>

        <!-- Admin Products wrapper -->
        <section style="margin-left: 280px; height: calc(100vh - 83px); overflow-y: auto;">
            <div class="p-4 mb-5">
                <h5>
                    Quản lý đơn đặt hàng
                </h5>
                <!--                <div class="mt-3 d-flex gap-4 align-items-center">
                                    <div class="form-outline" style="width: 100%;">
                                        <input type="username" id="form12" class="form-control" placeholder="Tìm kiếm..." />
                                    </div>
                                    <select class="form-select" style="width: 200px;" id="city" required="">
                                        <option value="">Chọn loại sản phẩm</option>
                                        <option>Tất cả</option>
                                        <option>Chim cảnh</option>
                                    </select>
                                </div>-->
                <div class="mt-3">
                    <table class="table">
                        <thead>
                            <tr style="background-color: #21D19240;">
                                <th scope="col">ID</th>
                                <th scope="col">Ngày đặt hàng</th>
                                <th scope="col">Người đặt hàng</th>
                                <th scope="col">Tên người nhận hàng</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Địa chỉ giao hàng</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">TT Thanh toán</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col" style="width: 110px;">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="ord" items="${orders}">
                                <tr>
                                    <th class="d-flex align-items-center" style="height: 78px;" scope="row">${ord.orderId}</th>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${ord.dateTime}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            <a href="#">${ord.orderFromUser.fullName}</a>
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${ord.customerName}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${ord.customerPhone}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${ord.customerAddress}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${ord.totalOrder}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${ord.paymentMethod.paymentMethod}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center" style="height: 100%;">
                                            ${ord.status.statusValue}
                                        </div>
                                    </td>
                                    <td class="d-flex gap-2 align-items-center" style=" height: 78px;">

                                        <!--click this item to go to OrderDetail.jsp-->
                                        <button type="button" class="btn btn-success me-2" data-bs-toggle="modal"
                                                data-bs-target="#detailOrder_${ord.orderId}">
                                            <i class="fa-solid fa-eye"></i>
                                        </button>
                                        <!--Modal Detail-->
                                        <div class="modal fade" id="detailOrder_${ord.orderId}" tabindex="-1"
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
                                                            <c:forEach items="${ord.orderDetails}" var="od">
                                                                <div class="row">
                                                                    <div class="col-2">
                                                                        <a href="/be-lua-bong-winnie" class="ajaxcart__product-image cart_image" title="item-cart-1">
                                                                            <img class="" style="width: 100px; height: 100px; border-radius: 8px;"
                                                                                 src="${od.product.images.get(0).image}"
                                                                                 alt="Bé lừa bông Winnie">
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <p>${od.product.name}</p>
                                                                        <p>${od.product.classValue}</p>
                                                                        <p>Số lượng: ${od.quantity}</p>
                                                                        <p>
                                                                            <fmt:formatNumber value="${od.product.price}" pattern="#,##0.000" var="formattedNumber" />
                                                                            Giá: ${formattedNumber}đ
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <p class="fw-bold">Tổng tiền:</p>
                                                                        <c:set var="total" value="${od.product.price * od.quantity}"></c:set>
                                                                        <fmt:formatNumber value="${total}" pattern="#,##0.000" var="formattedTotal" />
                                                                        <p>${formattedTotal}đ</p>
                                                                    </div>
                                                                </div>
                                                                <hr>
                                                            </c:forEach>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">
                                                            Đóng
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <c:if test="${ord.status.statusOrderID == 2}">
                                            <button type="button" class="btn btn-success me-2" data-bs-toggle="modal"
                                                    data-bs-target="#updateItem_${ord.orderId}">
                                                <i class="fas fa-shipping-fast"></i>
                                            </button>
                                            <!-- Modal Approve Detail-->
                                            <div class="modal fade" id="updateItem_${ord.orderId}" tabindex="-1"
                                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận hành động</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <form method="POST" action="listOrder" class="register-form"
                                                                  id="register-form">
                                                                <input type="hidden" name="action" value="finish">
                                                                <input type="hidden" name="id" value="${ord.orderId}">
                                                                <div class="col mb-4">
                                                                    <h6>Xác nhận đơn hàng có ID ${ord.orderId} thành công?</h6>
                                                                </div>
                                                                <button type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">
                                                                    Đóng
                                                                </button>
                                                                <button type="submit" class="btn btn-primary">Xác nhận</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <button type="button" class="btn btn-outline-danger me-2" data-bs-toggle="modal"
                                                    data-bs-target="#deleteItem_${ord.orderId}">
                                                <i class="fas fa-phone-slash"></i>
                                            </button>
                                            <!-- Modal Deny Detail-->
                                            <div class="modal fade" id="deleteItem_${ord.orderId}" tabindex="-1"
                                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận hành động</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <div class="col mb-4">
                                                                <h6>Xác nhận đơn hàng có ID ${ord.orderId} giao thất bại?</h6>
                                                            </div>
                                                        </div>
                                                        <form action="listOrder" method="post">
                                                            <input type="hidden" name="action" value="fail">
                                                            <input type="hidden" name="id" value="${ord.orderId}">
                                                            <div class="modal-footer">
                                                                <button style="width:100px" type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">
                                                                    Đóng
                                                                </button>
                                                                <button style="width:100px" type="submit" class="btn btn-danger">
                                                                    Xác nhận</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-center">
                        <c:if test="${orders.size() == 0}">
                            Không có đơn hàng nào!
                        </c:if>
                    </div>
                </div>
                <div class="d-flex justify-content-center mt-5">
                    <nav aria-label="Page navigation example col-12">
                        <ul class="pagination">
                            <%--For displaying Previous link except for the 1st page --%>
                            <c:if test="${currentPage != 1}">
                                <li class="page-item">
                                    <a class="page-link" href="listOrder?page=${currentPage - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <%--For displaying Page numbers. The when condition does not display
                                        a link for the current page--%>
                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                <c:choose>
                                    <c:when test="${currentPage eq i}"> 
                                        <li class="page-item"><a class="page-link bg-light" href="#">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="listOrder?page=${i}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                            <%--For displaying Next link --%>
                            <c:if test="${currentPage lt noOfPages}">
                                <li class="page-item">
                                    <a class="page-link" href="listOrder?page=${currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
            <%@ include file="../../includes/admin_footer.jsp" %>
        </section>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
</html>
