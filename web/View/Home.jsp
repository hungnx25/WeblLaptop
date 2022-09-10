
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>HG Laptop</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
        <style>
            .Product-grid {
                display: flex;
                width: 100%;
                flex-wrap: wrap;
            }

            .Product-item{
                width: 33%;
            }
        </style>

    </head>

    <body>
            <%@include file="Header.jsp" %>
     
        <!-- Start Banner Hero -->
        <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
            <ol class="carousel-indicators">
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container">
                        <div class="row p-5">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/img/banner_1.jpg" alt="">                          
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="row p-5">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/img/banner_2.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="row p-5">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/img/banner_3.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
                <i class="fas fa-chevron-left"></i>
            </a>
            <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
                <i class="fas fa-chevron-right"></i>
            </a>
        </div>
        <!-- End Banner Hero -->

        <!-- Start Featured Product tất cả sản phẩm-->
        <section class="bg-light">
            <div class="container py-5">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Tất cả sản phẩm</h1>    
                        <a class="view_all" href="<%=request.getContextPath()%>/LoadAll">
                            Xem tất cả >
                        </a>
                    </div>
                </div>

                <div  class="Product-grid" >
                    <c:set value="${sessionScope.page}" var="page"/>
                    <c:forEach items="${sessionScope.listPro}" begin="${page.begin}" end="${page.end}"  var="p" >

                        <div class="card h-100 Product-item">
                            <a href="<%=request.getContextPath()%>/LoadDetail?id=${p.id}">
                                <img src="<%=request.getContextPath()%>/img/products/${p.img}" class="card-img-top" alt="...">
                            </a>
                            <div class="card-body">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li class="text-muted text-right" style="color: black;">Price:${p.price}</li>
                                    <li class="text-muted text-right" style="color: red;">Sale:${p.discountPrice}</li>
                                </ul>
                                <a href="<%=request.getContextPath()%>/LoadDetail?id=${p.id}" class="h2 text-decoration-none text-dark">${p.getTitle()}</a>
                                <p class="card-text">
                                    Màn Hình: ${p.screen} 
                                </p>
                                <p class="card-text">
                                    RAM: ${p.getRAM()}
                                </p>
                                <p class="text-muted">Buyed: ${p.getBuyed()}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>


        </section>
        <!-- End Featured Product -->  

        <!-- Start Featured Product bán chạy -->
        <section class="bg-light">
            <div class="container py-5">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Sản phẩm bán chạy</h1>    
                        <a class="view_all" href="<%=request.getContextPath()%>/LoadAll">
                            Xem tất cả >
                        </a>
                    </div>
                </div>

                <div  class="Product-grid" >


                    <c:forEach items="${sessionScope.listProDesc}" begin="${page.begin}" end="${page.end}" var="p" >

                        <div class="card h-100 Product-item">
                            <a href="<%=request.getContextPath()%>/LoadDetail?id=${p.id}">
                                <img src="<%=request.getContextPath()%>/img/products/${p.img}" class="card-img-top" alt="...">
                            </a>
                            <div class="card-body">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li class="text-muted text-right" style="color: black">Price:${p.price}</li>
                                    <li class="text-muted text-right" style="color: red">Sale:${p.discountPrice}</li>
                                </ul>
                                <a href="<%=request.getContextPath()%>/LoadDetail?id=${p.id}" class="h2 text-decoration-none text-dark">${p.getTitle()}</a>
                                <p class="card-text">
                                    Màn Hình: ${p.screen} 
                                </p>
                                <p class="card-text">
                                    RAM: ${p.getRAM()}
                                </p>
                                <p class="text-muted">Buyed: ${p.getBuyed()}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>


        </section>
        <!-- End Featured Product -->   

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
    </body>

</html>