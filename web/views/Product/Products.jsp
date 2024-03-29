<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/layout.css" rel="stylesheet" type="text/css"/>
        <link href="../css/backtotop.css" rel="stylesheet" type="text/css"/>
        <link href="../css/allcollection.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="../js/script.js"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@ include file="../../includes/header.jsp" %>
        <div>
            <div class="all-collections-wrapper container-home">
                <%@ include file="HeadCategoryShow.jsp" %>
                <div class="list-products-wrapper row mt-4">
                    <c:if test="${sessionScope.textSearch == null || sessionScope.textSearch == ''}">
                        <%@ include file="LeftFilterNav.jsp" %>
                    </c:if>
                    <div class="new-product
                         <c:if test="${sessionScope.textSearch == null || sessionScope.textSearch == ''}">
                             col-xl-9 col-lg-9
                         </c:if>
                         col-md-12 col-sm-12 col-12 row">
                        <c:if test="${products.size() == 0}">
                            <div class="w-100 d-flex justify-content-center">
                                <p class="fw-bold fs-4">Không tìm thấy sản phẩm nào</p> 
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.textSearch != null || sessionScope.textSearch != ''}">
                            <div class="w-100 d-flex justify-content-center">
                                <p class="fw-bold fs-4">Trang tìm kiếm</p> 
                            </div>
                            <p>Đã tìm thấy ${noOfRecords} kết quả phù hợp</p>
                        </c:if>
                        <c:forEach var="p" items="${products}">
                            <div class="col-6
                                 <c:if test="${sessionScope.textSearch == null || sessionScope.textSearch == ''}">
                                     col-md-4
                                 </c:if>
                                 <c:if test="${sessionScope.textSearch != null || sessionScope.textSearch != ''}">
                                     col-md-3
                                 </c:if>
                                 product-cart-wrapper">
                                <form id="frm-product-details-${p.productId}" action="productDetails" method="post">
                                    <input type="hidden" value="${p.productId}" name="productID">
                                    <div class="position-relative">
                                        <img src="${p.images.get(0).image}"
                                             alt="new-prd" class="product-card-img w-100 h-auto" onclick="viewProduct('${p.productId}')"/>
                                        <div class="love-prd">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                                 fill="none">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                  d="M12 5C11.6604 4.60884 11.2646 4.26729 10.8278 3.9824C9.86267 3.35284 8.69792 3 7.5 3C4.42 3 2 5.37384 2 8.3951C2 9.46861 2.25574 10.488 2.69383 11.4578C4.0526 14.4686 7.16576 17.0093 9.8455 19.1963C10.617 19.8259 11.3526 20.4262 12 21C12.6474 20.4262 13.383 19.8259 14.1545 19.1963C16.8342 17.0093 19.9473 14.4687 21.3061 11.458C21.7442 10.4881 22 9.46866 22 8.3951C22 5.37384 19.58 3 16.5 3C15.3021 3 14.1373 3.35284 13.1722 3.9824C12.7354 4.26729 12.3396 4.60884 12 5ZM12 18.3699C12.3228 18.1024 12.6527 17.8326 12.9822 17.5633C13.2612 17.3351 13.5399 17.1073 13.8136 16.8813C14.9091 15.9769 15.9814 15.058 16.9309 14.095C18.106 12.9033 18.9793 11.7563 19.4879 10.6242C19.8233 9.8767 20 9.13633 20 8.3951C20 6.51455 18.5119 5 16.5 5C15.3116 5 14.2025 5.51373 13.5103 6.31111L12 8.05084L10.4897 6.31111C9.79748 5.51373 8.68843 5 7.5 5C5.48808 5 4 6.51455 4 8.3951C4 9.13633 4.17674 9.8767 4.51214 10.6242C5.02069 11.7563 5.89402 12.9033 7.06909 14.095C8.01864 15.058 9.09095 15.9769 10.1864 16.8813C10.4601 17.1073 10.7388 17.3351 11.0178 17.5633C11.3473 17.8326 11.6772 18.1024 12 18.3699Z"
                                                  fill="#333333"></path>
                                            </svg>
                                        </div>
                                    </div>

                                    <div class="action-prd-cart">
                                        <button class="navbar-toggler" type="button" data-bs-toggle="modal"
                                                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"
                                                <c:if test="${p.children.size() == 0 and p.quantity != 0}">
                                                    onclick="addToCart('${p.productId}', '${p.name}', '${p.images.get(0).image}', '${p.price}', 1
                                                    <c:if test="${p.classValue != null}">
                                                            , '${p.classValue}'
                                                    </c:if>
                                                    <c:if test="${p.classValue == null}">
                                                            , ''
                                                    </c:if>
                                                            )"
                                                    data-bs-target="#cartModal"
                                                </c:if>          
                                                <c:if test="${p.children.size() != 0 or p.quantity == 0}">
                                                    onclick="viewProduct('${p.productId}')"
                                                </c:if>
                                                >                            
                                            <i class="fa-solid fa-cart-plus fa-lg"></i>
                                        </button>
                                    </div>

                                    <div class="prd-name" onclick="viewProduct('${p.productId}')">
                                        ${p.name}
                                    </div>
                                    <div class="prd-description">
                                        ${p.description}
                                    </div>
                                    <div class="prd-price">
                                        <fmt:formatNumber value="${p.price}" pattern="#,##0.000" var="formattedNumber" />
                                        ${formattedNumber}đ
                                    </div>
                                </form>
                            </div>
                        </c:forEach>


                        <div class="d-flex justify-content-center mt-5">
                            <nav aria-label="Page navigation example col-12">
                                <ul class="pagination">
                                    <%--For displaying Previous link except for the 1st page --%>
                                    <c:if test="${currentPage != 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="product?page=${currentPage - 1}" aria-label="Previous">
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
                                                <li class="page-item"><a class="page-link" href="product?page=${i}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                    <%--For displaying Next link --%>
                                    <c:if test="${currentPage lt noOfPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="product?page=${currentPage + 1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="AbsoluteBtn.jsp" %>
        </div>
        <%@ include file="../../includes/footer.jsp" %>


        <script>
            //Get the button
            let mybutton = document.getElementById("btn-back-to-top");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }
            // When the user clicks on the button, scroll to the top of the document
            mybutton.addEventListener("click", backToTop);

            function backToTop() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }

        </script>
        <script>
            const rangeInput = document.querySelectorAll(".range-input input"),
                    priceInput = document.querySelectorAll(".price-input input"),
                    range = document.querySelector(".slider .progress");
            let priceGap = 1000;

            priceInput.forEach((input) => {
                input.addEventListener("input", (e) => {
                    let minPrice = parseInt(priceInput[0].value),
                            maxPrice = parseInt(priceInput[1].value);

                    if (maxPrice - minPrice >= priceGap && maxPrice <= rangeInput[1].max) {
                        if (e.target.className === "input-min") {
                            rangeInput[0].value = minPrice;
                            range.style.left = (minPrice / rangeInput[0].max) * 100 + "%";
                        } else {
                            rangeInput[1].value = maxPrice;
                            range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
                        }
                    }
                });
            });

            rangeInput.forEach((input) => {
                input.addEventListener("input", (e) => {
                    let minVal = parseInt(rangeInput[0].value),
                            maxVal = parseInt(rangeInput[1].value);

                    if (maxVal - minVal < priceGap) {
                        if (e.target.className === "range-min") {
                            rangeInput[0].value = maxVal - priceGap;
                        } else {
                            rangeInput[1].value = minVal + priceGap;
                        }
                    } else {
                        priceInput[0].value = minVal;
                        priceInput[1].value = maxVal;
                        range.style.left = (minVal / rangeInput[0].max) * 100 + "%";
                        range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
                    }
                });
            });

        </script>

        <!-- Script to link checkbox with text  -->
        <script>
            const checkboxes = document.querySelectorAll('.form-check-input');

            checkboxes.forEach((checkbox) => {
                checkbox.addEventListener('click', () => {
                    const isChecked = checkbox.checked;
                    const listItem = checkbox.closest('.list-group-item');
                    const label = listItem.querySelector('label');

                    if (isChecked) {
                        listItem.classList.add('active');
                        label.classList.add('text-primary');
                    } else {
                        listItem.classList.remove('active');
                        label.classList.remove('text-primary');
                    }
                });
            });

            function viewProduct(id) {
                document.getElementById("frm-product-details-" + id).submit();
            }
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>
</html>
