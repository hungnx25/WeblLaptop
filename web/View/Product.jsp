

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>HG Laptop - Product Detail Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">

        <!-- Slick -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/slick-theme.css">

        <style>
            .Product-grid {
                display: flex;
                width: 100%;
                flex-wrap: wrap;
            }

            .Product-item{
                width: 25%;
            }
        </style>

    </head>

    <body>
        <!-- Navbar -->
        <%@include file="Header.jsp" %>
        <!-- Navbar -->

        <!-- Open Content -->
        <section class="bg-light">
            <div class="container pb-5">
                <div class="row">
                    <div class="col-lg-5 mt-5">
                        <c:set value="${sessionScope.p}" var="i"/>
                        <div class="card mb-3">
                            <img class="card-img img-fluid" src="<%=request.getContextPath()%>/img/products/${i.getImg()}" alt="Card image cap" id="product-detail">
                        </div>
                       
                    </div>
                    <!-- col end -->

                    <div class="col-lg-7 mt-5">
                        <div class="card">

                            <div class="card-body">
                                <h1 class="h2">${i.name}</h1>
                                <p class="h3 py-2">${i.getPrice()}| Sale: ${i.getDiscountPrice()}</p>
                                <p class="py-2">

                                    <span class="list-inline-item text-dark">Buyed: ${i.getBuyed()}</span>
                                </p>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>Brand:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${i.getBrand()}</strong></p>
                                    </li>
                                </ul>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>Screen:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${i.getScreen()}</strong></p>
                                    </li>
                                </ul>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>CPU:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${i.getCPU()}</strong></p>
                                    </li>
                                </ul>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>RAM:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${i.getRAM()}</strong></p>
                                    </li>
                                </ul>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>HardDrive:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${i.getHardDrive()}</strong></p>
                                    </li>
                                </ul>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>Graphics:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${i.getRAM()}</strong></p>
                                    </li>
                                </ul>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>OS:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${i.getOS()}</strong></p>
                                    </li>
                                </ul>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <h6>Weight:</h6>
                                    </li>
                                    <li class="list-inline-item">
                                        <p class="text-muted"><strong>${i.getWeight()}</strong></p>
                                    </li>
                                </ul>
                                <c:set value="${sessionScope.pd}" var="d"/>
                                <h6>Description:</h6>
                                <p>${d.getDescription()}</p>

                                <form action="" method="GET">
                                    <div class="row">

                                        <div class="col-auto">
                                            <ul class="list-inline pb-3">
                                                <li class="list-inline-item text-right">
                                                    Quantity
                                                    <input type="hidden" name="product-quanity" id="product-quanity" value="1">
                                                </li>
                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                                <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                                <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row pb-3">
                                        <div class="col d-grid">
                                            <button type="submit" class="btn btn-success btn-lg" name="submit" value="addtocard">Add To Cart</button>
                                        </div>
                                    </div>
                                </form>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- Close Content -->

        <!-- Start Article -->
        <section class="py-5">
            <div class="row text-left p-2 pb-3">
                <h4>Related Products</h4>
            </div>

            <!--Start Carousel Wrapper-->
            <div class="container">
                <div id="carousel-related-product Product-grid" style="
                     display: flex;
                     width: 100%;
                     flex-wrap: wrap;
                     ">
                    <c:set value="${sessionScope.page1}" var="page"/>
                    <c:forEach items="${sessionScope.pro}" var="i" begin="${page.begin}" end="${page.end}" >
                        <div class="product-wap card rounded-0 Product-item" style=" width: 25%;">

                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="<%=request.getContextPath()%>/img/products/${i.getImg()}">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-success text-white mt-2" href="<%=request.getContextPath()%>/LoadDetail?id=${i.id}"><i class="far fa-eye"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="shop-single.jsp" class="h3 text-decoration-none">${i.getTitle()}</a>
                                <p class="text-center mb-0">Price:${i.price}</p>
                                <p class="text-center mb-0 " style="color: red;">Sale:${i.getDiscountPrice()}</p>
                            </div>
                        </div>
                    </c:forEach> 
                </div>
                <div/>
        </section>
        <!-- End Article -->


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

        <!-- Start Slider Script -->
        <script src="<%=request.getContextPath()%>/js/slick.min.js"></script>
        <script>
            $('#carousel-related-product').slick({
                infinite: true,
                arrows: false,
                slidesToShow: 4,
                slidesToScroll: 3,
                dots: true,
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    }
                ]
            });
        </script>
        <!-- End Slider Script -->

    </body>

</html>
