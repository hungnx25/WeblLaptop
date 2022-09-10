

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body{
                margin-top:20px;
                background:#f8f8f8
            }
        </style>
        <title>Admin Pro Page</title>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Delete Product with id = " + id)) {
                    window.location = "<%=request.getContextPath()%>/DeletePr?id=" + id;
                }
            }
        </script>   
    </head>
    <body>

        <%@include file="Header.jsp" %>


        <div class="row flex-lg-nowrap">
            <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                <div class="card p-3">
                    <div class="e-navlist e-navlist--active-bg">
                        <ul class="nav">
                            <li class="nav-item"><a class="nav-link px-2 active" href="AdminProPage.jsp"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Products</span></a></li>
                            <li class="nav-item"><a class="nav-link px-2" href="AdminCusPage.jsp" ><i class="fa fa-fw fa-th mr-1"></i><span>Customer</span></a></li>
                            <li class="nav-item"><a class="nav-link px-2" href="Setting.jsp" ><i class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="text-center px-xl-3">
                            <a href="CreatePro.jsp" class="btn btn-success btn-block"> New Product </a>
                        </div>
                        <hr class="my-3">

                        <form action="<%=request.getContextPath()%>/SearchPr">
                            <!--                            <div class="form-group">                              
                                                            <input name="search" class="form-control w-100" type="text" placeholder="Name" value="">
                                                            <input type="submit" value="SEARCH" />
                                                        </div>-->
                        </form>
                    </div>
                </div>

            </div>


            <div class="col">

                <div class="row flex-lg-nowrap">
                    <div class="col mb-3">
                        <div class="e-panel card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h6 class="mr-2"><span>Products</span></h6>

                                </div>
                                <div class="e-table">
                                    <div class="table-responsive table-lg mt-3">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>DisPrice</th>
                                                    <th>Brand</th>
                                                    <th>Screen</th>
                                                    <th>CPU</th>
                                                    <th>RAM</th>                                                                                                               
                                                    <th>HardDrive</th>
                                                    <th>Graphics</th>                                                         
                                                    <th>OS</th>
                                                    <!--                                                    <th>Weight</th>
                                                                                                        <th>Buy</th>
                                                                                                        <th>Quantity</th>-->
                                                    <th>Img</th>
                                                    <th>Action</th>

                                                </tr>
                                                <c:set value="${sessionScope.pagePro}" var="page"/> 
       
                                                <c:forEach items="${sessionScope.listPro}" var="i" >
                                                    <tr>
                                                        <td>${i.getId()}</td>
                                                        <td>${i.getTitle()}</td>
                                                        <td>${i.getPrice()}</td>
                                                        <td>${i.getDiscountPrice()}</td>
                                                        <td>${i.getBrand()}</td>
                                                        <td>${i.getScreen()}</td>
                                                        <td>${i.getCPU()}</td>
                                                        <td>${i.getRAM()}</td>
                                                        <td>${i.getHardDrive()}</td>
                                                        <td>${i.getGraphics()}</td>
                                                        <td>${i.getOS()}</td>
<!--                                                        <td>${i.getWeight()}</td>
                                                        <td>${i.getBuyed()}</td>
                                                        <td>${i.getQuantity()}</td>-->
                                                        <td><img src="<%=request.getContextPath()%>/img/products/${i.getImg()}" alt="alt" style="width: 80px;" /></td>
                                                        <td>
                                                            <a href ='#' onclick="doDelete('${i.getId()}')">Delete</a>
                                                            <a href ='<%=request.getContextPath()%>/UpdatePr?id=${i.getId()}' >Update</a> 
                                                        </td>  
                                                    </tr>
                                                </c:forEach>

                                            </thead>

                                        </table>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
        </div>

    </body>
</html>
