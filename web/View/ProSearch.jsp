
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>HG Laptop- Product Listing Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
        <style>
            .pb-3 input{
                margin-left: 20px;
                margin-bottom: 10px;
            }
        </style>

    </head>

    <body>

        <!-- Navbar -->
        <%@include file="Header.jsp" %>
        <!-- Navbar -->

        <div class="container py-5">
            <div class="row">

                <div class="col-lg-3">
                    <h1 class="h2 pb-4">Categories</h1>
                    <ul class="list-unstyled templatemo-accordion">
                        <li class="pb-3">
                            <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                                Brand
                                <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                            </a>
                            <ul id="collapseSix" class="collapse list-unstyled pl-3">
                                <li><a class="text-decoration-none" href="#">Apple</a></li>
                                <li><a class="text-decoration-none" href="#">Asus</a></li>
                                <li><a class="text-decoration-none" href="#">Acer</a></li>
                                <li><a class="text-decoration-none" href="#">Dell</a></li>
                                <li><a class="text-decoration-none" href="#">Lenovo</a></li>
                                <li><a class="text-decoration-none" href="#">MSI</a></li>
                            </ul>
                        </li>
                        <li class="pb-3">
                            <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                                Price
                                <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                            </a>
                            <ul id="collapseThree" class="collapse list-unstyled pl-3">
                                <li><a class="text-decoration-none" href="#">Dưới 20 triệu </a></li>
                                <li><a class="text-decoration-none" href="#">Từ 20-30 triệu</a></li>
                                <li><a class="text-decoration-none" href="#">Trên 30 triệu</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>


                <div class="col-lg-9">
                    <div class="row">                       
                        <div class="col-md-4 pb-4">
                            <label  ><strong>Sort By</strong></label>
                                <select class="form-control" name="sort">
                                    <option><a href="<%=request.getContextPath()%>/">A to Z</a></option>
                                    <option><a href="<%=request.getContextPath()%>/">Low to High</a></option>
                                    <option><a href="<%=request.getContextPath()%>/">High to Low</a></option>
                                </select>                       
                        </div>

                    </div>
                    <div class="row">
                        <c:forEach items="${sessionScope.searchlist}" var="p"> 
                            <div class="col-md-4">
                                <div class="card mb-4 product-wap rounded-0">
                                    <div class="card rounded-0">
                                        <img class="card-img rounded-0 img-fluid" src="<%=request.getContextPath()%>/img/products/${p.img}">
                                        <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                            <ul class="list-unstyled">
                                                <li><a class="btn btn-success text-white mt-2" href="<%=request.getContextPath()%>/LoadDetail?id=${p.id}"><i class="far fa-eye"></i></a></li>
                                                <li><a class="btn btn-success text-white mt-2" href="<%=request.getContextPath()%>/AddToCart?id=${p.id}&url=Shop.jsp"><i class="fas fa-cart-plus"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <a href="<%=request.getContextPath()%>/LoadDetail?id=${p.id}" class="h3 text-decoration-none">${p.getTitle()}</a>

                                        <p class="text-center mb-0">Price: ${p.price}</p>
                                        <p class="text-center mb-0" style="color: red;">Sale: ${p.discountPrice}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>

            </div>
        </div>
        <!-- End Content -->


        <!-- Start Footer -->
        <footer class="bg-dark" id="tempaltemo_footer">
            <div class="container">
                <div class="row">

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-success border-bottom pb-3 border-light logo">HG Laptop</h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li>
                                <i class="fas fa-map-marker-alt fa-fw"></i>
                                123 Consectetur at ligula 10660
                            </li>
                            <li>
                                <i class="fa fa-phone fa-fw"></i>
                                <a class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                            </li>
                            <li>
                                <i class="fa fa-envelope fa-fw"></i>
                                <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                        <ul class="list-unstyled text-light footer-link-list">
                            <li><a class="text-decoration-none" href="#">Apple</a></li>
                            <li><a class="text-decoration-none" href="#">Asus</a></li>
                            <li><a class="text-decoration-none" href="#">Dell</a></li>
                            <li><a class="text-decoration-none" href="#">MSI</a></li>
                            <li><a class="text-decoration-none" href="#">Acer</a></li>
                            <li><a class="text-decoration-none" href="#">Lenovo</a></li>

                        </ul>
                    </div>

                    <div class="col-md-4 pt-5">
                        <h2 class="h2 text-light border-bottom pb-3 border-light">
                            Contact
                        </h2>

                        <form action="" target="_blank">
                            <p><input class="contact" type="text" placeholder="Name" name="Name" required></p>
                            <p><input class="contact" type="text" placeholder="Email" name="Email" required></p>
                            <p><input class="contact" type="text" placeholder="Subject" name="Subject" required></p>
                            <p><input class="contact" type="text" placeholder="Message" name="Message" required></p>
                            <button type="submit" class="contact-btn">Send</button>
                        </form>
                    </div>

                </div>

                <div class="row text-light mb-4">
                    <div class="col-12 mb-3">
                        <div class="w-100 my-3 border-top border-light"></div>
                    </div>
                    <div class="col-auto me-auto">
                        <ul class="list-inline text-left footer-icons">
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item border border-light rounded-circle text-center">
                                <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-auto">
                        <label class="sr-only" for="subscribeEmail">Email address</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                            <div class="input-group-text btn-success text-light">Subscribe</div>
                        </div>
                    </div>
                </div>
            </div>        

        </footer>
        <!-- End Footer -->

        <!-- Start Script -->
        <script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/templatemo.js"></script>
        <script src="<%=request.getContextPath()%>/js/custom.js"></script>
        <!-- End Script -->

        <script type="text/javascript">
                                    function select() {
                                        document.F.action = "../LoadAll?nrpp=" + document.getElementsByName("nrpp").values();
                                        document.F.submit();
                                    }
        </script>

    </body>

</html>