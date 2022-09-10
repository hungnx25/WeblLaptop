
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css"/>

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
    </head>

    <body>
        <%@include file="Header.jsp" %>

        <div class="card ">
                <c:set value="${sessionScope.size}" var="c"/>
                <div class="cart">
                    <div class="title">
                        <div class="row">
                            <div class="col"><h4><b>Shopping Cart</b></h4></div>
                            <div class="col align-self-center text-right text-muted">${c} items</div>
                        </div>
                    </div> 

                    <c:forEach items="${sessionScope.cart.items}" var="i">
                        <div class="row border-top border-bottom">
                            <div class="col">
                                <div class="row main align-items-center">
                                <div class="col-md-2"><img class="img-fluid" src="<%=request.getContextPath()%>/img/products/${i.getProduct().img}"></div>
                                <div class="col-md-4">
                                    <div class="" style="color: red;">${i.product.id}</div>                        
                                    <div class="">${i.product.name}</div>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn" style="padding: 5px; height: 30px">
                                        <a href="<%=request.getContextPath()%>/UpdateCart?act=minus&pid=${i.product.id}" style="color: black"><i class="fa fa-minus"></i></a>
                                    </button>
                                    <div class="row" style="padding-left: 54%;">${i.quantity}</div>
                                    <button class="btn" style="padding: 5px; height: 30px">
                                        <a href="<%=request.getContextPath()%>/UpdateCart?act=plus&pid=${i.product.id}" style="color: black"><i class="fa fa-plus"></i></a>
                                    </button>
                                </div>
                                <div class="col-md-4">${i.price} 
                                    <a href="<%=request.getContextPath()%>/UpdateCart?act=cancel&pid=${i.product.id}" style="color: black"><i class="fas fa-window-close"></i><a/>
                                </div>
                            </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <c:set value="${sessionScope.cart}" var="p"/>
                <div class="summary">

                    <div><h5><b>Summary</b></h5></div>
                    <hr>
                    <div class="row">
                        <div class="col" style="padding-left:40%;">${c} ITEMS</div>
                    </div>

                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                        <div class="col">SHIP</div>
                        <div class="col text-right">Free Ship</div>
                    </div>

                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                        <div class="col">TOTAL PRICE</div>
                        <div class="col text-right">${p.getTotalPay()}</div>
                    </div>
                    <div>
                        <a href="<%=request.getContextPath()%>/Bill">
                            <input type="submit" value="BUY" />
                        </a>
                        <div class="back-to-shop"><a href="<%=request.getContextPath()%>/View/Shop.jsp">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
                    </div>

                </div>

        </div>


    </body>
    <!--    <script type="text/javascript">
            function buy(id) {
                var m = document.cart.quantity.value;
                document.cart.action = "buy?id" + id + "&quantity" + m;
                document.cart.submit();
            }
        </script>-->
</html>
