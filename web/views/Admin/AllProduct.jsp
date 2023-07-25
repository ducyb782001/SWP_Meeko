<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                    Quản lý sản phẩm
                </h5>
                <div class="d-flex justify-content-end mt-4">
                    <a style="width: 200px;" data-bs-target="#addItem" data-bs-toggle="modal" type="button"
                       class="btn btn-success">
                        <i class="fa-solid fa-plus"></i>
                        Thêm sản phẩm</a>
                </div>
                <div class="mt-3 d-flex gap-4 align-items-center">
                    <div class="form-outline" style="width: 100%;">
                        <input type="username" id="form12" class="form-control" placeholder="Tìm kiếm..." />
                    </div>
                    <select class="form-select" style="width: 200px;" id="city" required="">
                        <option disabled selected value="">Chọn loại sản phẩm</option>
                        <option>Tất cả sản phẩm</option>
                        <c:forEach items="${sessionScope.tags}" var="t">
                            <c:forEach var="c" items="${t.categories}">
                                <option>${c.categoryName}</option>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </div>
                <div class="mt-4">
                    <table class="table">
                        <thead>
                            <tr style="background-color: #21D19240;">
                                <th scope="col">ID</th>
                                <th scope="col">Sản phẩm</th>
                                <th scope="col">Loại sản phẩm</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Giá tiền</th>
                                <th scope="col" style="width: 180px;">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${requestScope.list}">
                                <tr>
                                    <th class="d-flex align-items-center" style="height: 78px;" scope="row">${product.productId}</thc>
                                    <td style="width: 30%; height: 78px;">
                                        <div class="d-flex gap-2 align-items-center">
                                            <img src="${product.images.get(0).image}"
                                                 class="rounded-2" style="width: 60px; height: 60px; object-fit: contain;" />
                                            <h6>${product.name}</h6>
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center h-100">
                                            ${product.category.categoryName}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center h-100">
                                            ${product.quantity}
                                        </div>
                                    </td>
                                    <td style="height: 78px;">
                                        <div class="d-flex align-items-center h-100">
                                            <c:if test="${product.status == true}">Hiển thị</c:if>
                                            <c:if test="${product.status != true}">Ẩn</c:if>
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                            ${product.price} 
                                        </div>
                                    </td>
                                    <td class="d-flex gap-2 align-items-center" style="width: 180px; height: 78px;">

                                        <button href="/admin-product-detail.html" type="button"
                                                class="btn btn-outline-success me-2" data-bs-toggle="modal"
                                                data-bs-target="#itemDetail_${product.productId}">
                                            <i class="fa-solid fa-eye"></i>
                                        </button>
                                        <!--Modal View Detail-->


                                        <!--Edit button--> 
                                        <button type="button" class="btn btn-success me-2" data-bs-toggle="modal"
                                                data-bs-target="#updateItem_${product.productId}">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>


                                        <!--Delete button-->  
                                        <button type="button" class="btn btn-outline-danger me-2" data-bs-toggle="modal"
                                                data-bs-target="#deleteItem_${product.productId}">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>

                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-center mt-1">
                    <nav aria-label="Page navigation example col-12">
                        <ul class="pagination">
                            <%--For displaying Previous link except for the 1st page --%>
                            <c:if test="${currentPage != 1}">
                                <li class="page-item">
                                    <a class="page-link" href="listAllProductAdmin?page=${currentPage - 1}" aria-label="Previous">
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
                                        <li class="page-item"><a class="page-link" href="listAllProductAdmin?page=${i}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                            <%--For displaying Next link --%>
                            <c:if test="${currentPage lt noOfPages}">
                                <li class="page-item">
                                    <a class="page-link" href="listAllProductAdmin?page=${currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </section>
        <!-- This container belong to FOOTER of ADMIN, DIFFERENT FROM NORMAL FOOTER; DONT copy to JSP, JUST INCLUDE -->

        <!-- Modal Add Product Detail-->
        <div class="modal fade" id="addItem" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm sản phẩm mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <form method="post" action="addProduct" class="register-form" id="register-form"
                              enctype="multipart/form-data">
                            <input name="action" value="add" type="hidden">
                            <div class="col">
                                <div class="row">
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Tên
                                            sản phẩm:</label>
                                        <input type="text" class="form-control" id="category-film" name="name" required>
                                    </div>
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Giá:</label>
                                        <input type="text" class="form-control" id="category-film" name="price" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Loại sản phẩm: </label>
                                        <select class="form-select" aria-label="Default select example" id="theloai"
                                                name="category" required>
                                            <option disabled selected value="">Chọn loại sản phẩm</option>
                                            <c:forEach items="${sessionScope.tags}" var="t">
                                                <c:forEach var="c" items="${t.categories}">
                                                    <option value="${c.categoryId}">${c.categoryName}</option>
                                                </c:forEach>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Số lượng:</label>
                                        <input type="number" class="form-control" id="category-film" name="quantity" required>
                                    </div>
                                    <div class="col-6">
                                        <label for="category-film" class="col-form-label">Trạng thái:</label>
                                        <select name="status" class="form-select" aria-label="Default select example" id="theloai" required>
                                            <option value="true">
                                                Hiển thị
                                            </option>
                                            <option value="false">
                                                Ẩn
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div id="type">

                                </div>
                                <!--                                <div class="row mt-2">
                                                                    <div class="col-6">
                                                                        <button type="button" class="btn btn-primary" onclick="createType()">Thêm biến thể</button>
                                                                    </div>
                                                                </div>-->
                                <!--                                <div id="typeValue" class="row mt-2" style="display: none">
                                                                    <div class="col-6">
                                                                        <label for="category-film" class="col-form-label">Biến thể:</label>
                                                                        <select class="form-select" aria-label="Default select example" id="theloai"
                                                                                name="type" required>
                                                                            <option disabled selected value="">Chọn loại biến thể</option>
                                <c:forEach items="${sessionScope.tags}" var="t">
                                    <c:forEach var="c" items="${t.categories}">
                                        <option value="${c.categoryId}">${c.categoryName}</option>
                                    </c:forEach>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">Giá trị biến thể</label>
                            <input type="typeValue" class="form-control" id="category-film" name="quantity" required>
                        </div>
                    </div>-->
                                <div class="mb-3 mt-3">
                                    <label for="exampleFormControlFile1">Ảnh:</label>
                                    <input type="file" class="form-control-file mt-2" name="file" id="file" accept="image/*"
                                           multiple required>
                                </div>
                                <div class="mb-3">
                                    <label for="category-film" class="col-form-label">Mô
                                        tả:</label>
                                    <textarea class="form-control" cols="30" rows="5" name="description"></textarea>
                                </div>
                            </div>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Đóng
                            </button>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <c:forEach var="product" items="${requestScope.list}">
            <div class="modal fade" id="itemDetail_${product.productId}" tabindex="-1"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Chi tiết sản phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4 col-12">
                                    <div>
                                        <img src="${product.images.get(0).image}"
                                             class="rounded-2" style="width: 60px; height: 60px; object-fit: contain;" />
                                    </div>
                                </div>
                                <div class="col-md-8 col-12">
                                    <div
                                        style="font-size: 18px; color: #333; margin-bottom: 10px; font-weight: bold;">
                                        Category: ${product.category.categoryName}
                                    </div>
                                    <h3 style="font-weight: 400; margin-bottom: 8px;"> ${product.name}</h3>
                                    <div
                                        class="d-flex align-items-center gap-3 justify-content-between">
                                        <p class="mb-0"
                                           style="color: #c83252; font-weight: 700; font-size: 24px;">
                                            ${product.price} đ</p>
                                        <p class="mb-0">
                                            <span style="font-weight: bold;">Số lượng còn
                                                lại:</span> ${product.quantity}
                                        </p>
                                    </div>
                                    <div
                                        style="height: 1px; width: 100%; background-color: #33333330;">
                                    </div>
                                    <div
                                        style="font-size: 18px; color: #333; margin-bottom: 10px;">
                                        Mô tả: ${product.description}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Đóng
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!--Modal Edit Detail-->
            <div class="modal fade" id="updateItem_${product.productId}" tabindex="-1"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cập nhật sản phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <form method="POST" action="updateProduct" class="register-form"
                                  id="register-form" enctype="multipart/form-data">
                                <input value="${product.productId}" type="hidden" name="productID">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="category-film" class="col-form-label">Tên
                                                sản phẩm:</label>
                                            <input value="${product.name}" type="text" class="form-control" id="category-film" name="name" required>
                                        </div>
                                        <div class="col-6">
                                            <label for="category-film" class="col-form-label">Giá:</label>
                                            <input value="${product.price}" type="text" class="form-control" id="category-film" name="price" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="category-film" class="col-form-label">Loại sản phẩm: </label>
                                            <select class="form-select" aria-label="Default select example" id="theloai"
                                                    name="category" required>
                                                <c:forEach items="${sessionScope.tags}" var="t">
                                                    <c:forEach var="c" items="${t.categories}">
                                                        <option value="${c.categoryId}"
                                                                <c:if test="${c.categoryId == product.category.categoryId}">
                                                                    selected
                                                                </c:if>
                                                                >${c.categoryName}</option>
                                                    </c:forEach>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-6">
                                            <label for="category-film" class="col-form-label">Số lượng:</label>
                                            <input value="${product.quantity}" type="number" class="form-control" id="category-film" name="quantity" required>
                                        </div>
                                        <div class="col-6">
                                            <label for="category-film" class="col-form-label">Trạng thái:</label>
                                            <select class="form-select" aria-label="Default select example" id="theloai"
                                                    name="status" required>
                                                <option value="true"
                                                        <c:if test="${true == product.status}">
                                                            selected
                                                        </c:if>
                                                        >Hiển thị</option>

                                                <option value="false"
                                                        <c:if test="${false == product.status}">
                                                            selected
                                                        </c:if>
                                                        >Ẩn</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3 mt-3">
                                        <label for="exampleFormControlFile1">Thay ảnh mới:</label>
                                        <input type="file" class="form-control-file mt-2" name="file" id="file" accept="image/*" multiple>
                                    </div>
                                    <div class="mb-3">
                                        <label for="category-film" class="col-form-label">Mô
                                            tả:</label>
                                        <textarea class="form-control" cols="30" rows="5" name="description">${product.description}</textarea>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">
                                    Đóng
                                </button>
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Delete Modal -->
            <!--Modal Delete Detail-->
            <div class="modal fade" id="deleteItem_${product.productId}" tabindex="-1"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <input value="${product.productId}" type="hidden" name="productID">
                            <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa
                                sản phẩm
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            ${product.name} - ${product.price}d
                        </div>
                        <form action="deleteProduct" method="post">
                            <input value="${product.productId}" type="hidden" name="productID">
                            <div class="modal-footer">
                                <button style="width:100px" type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">
                                    Đóng
                                </button>
                                <button style="width:100px" type="submit" class="btn btn-danger">
                                    Xóa</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>


    </body>
    <%@ include file="../../includes/admin_footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    <script>
        function createType() {
            var targetDiv = document.getElementById('type');
            var sourceDiv = document.getElementById('typeValue');

            // Clone khoi div duoc tao san
            var newDiv = sourceDiv.cloneNode(true);
            newDiv.style.display = 'block';
            targetDiv.appendChild(newDiv);
        }
    </script>
</html>
