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

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <!-- Container wrapper -->
            <div class="container">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="<%=request.getContextPath()%>/LoadPro">
                    <img id="Shop-logo"
                         src="<%=request.getContextPath()%>/img/products/laptop-logo.png" alt="Shop Logo"
                         style="width: 100px"/>
                </a>
                <!-- Toggle button -->
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                        data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <form class="d-flex align-items-center w-100 form-search" action="<%=request.getContextPath()%>/SearchPr" method="post">
                        <div class="input-group">
                            <input name="search" type="search" class="form-control" placeholder="Search" aria-label="Search" />
                            <input type="submit" value="SEARCH" style="    background-color: #fff;
                                   border-radius: 5px;
                                   border: 0;    color: #212529;
                                   line-height: 1.5;"/>
                        </div>


                    </form>

                    <ul class="navbar-nav ms-3">
                        <li class="nav-item me-3 " style="width: 80px;">
                            <a class="nav-link Sign-in" href="<%=request.getContextPath()%>/ControlSignIn">Sign In</a>
                        </li>
                        <li class="nav-item me-3" style="width: 80px;">
                            <a class="nav-link Sign-Up" href="SignUp.jsp">
                                Sign Up
                            </a>
                        </li >



                        <c:if test="${sessionScope.ad != null || sessionScope.cus != null}">
                            <li class="nav-item me-3" style="width: 80px;">
                                <a class="nav-link Sign-Up" href="<%=request.getContextPath()%>/Logout">
                                    LogOut
                                </a>
                            </li >
                            <c:if test="${sessionScope.cus != null}">
                                <li class="nav-item me-3">
                                    <a href="SettingCus.jsp"><i class="fas fa-user-circle text-white nav-link" ></i></a>                            
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.ad != null}">
                                <li class="nav-item me-3">
                                    <a href="Setting.jsp"><i class="fas fa-user-circle text-white nav-link" ></i></a>                           
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.cus != null}">
                                <li class="nav-item me-3">
                                    <a href="Cart.jsp"><i class="fas fa-shopping-cart text-white nav-link" ></i>
                                        <span>${sessionScope.size}</span></a>
                                </li>
                            </c:if>    

                        </c:if>


                    </ul>

                </div>
                <!-- Collapsible wrapper -->
            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->
    </body>
</html>
