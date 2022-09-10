
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <section class="h-100 " style="margin-top: 50px">
            <div class="container py-5">
                <div class="row d-flex justify-content-center my-4">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Cart - ${sessionScope.size} items</h5>
                            </div>
                            <div class="card-body">
                                <!-- Single item -->
                                <c:if test="${sessionScope.rolename!=null}">
                                    <c:forEach items="${sessionScope.cart.items}" var="i">
                                        <div class="row" style="color: black">

                                            <div class="col-lg-8 col-md-8 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                ${i.getProduct().name}
                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-4 col-md-4 mb-4 mb-lg-0">
                                                Quantity: ${i.quantity}
                                                <p></p>
                                                <strong>Price: ${i.getProduct().price * (1 - i.getProduct().discount/100) * i.quantity}</strong>
                                                <!-- Price -->
                                            </div>
                                        </div>
                                        <!-- Single item -->

                                        <hr class="my-4" />
                                    </c:forEach>
                                </c:if>

                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <c:set value="${sessionScope.size}" var="s"/>
                                        <li
                                            class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                            Products
                                            <span>${s}</span>
                                        </li>
                                        <hr/>
                                        <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                            Shipping
                                            <span>Free Ship</span>
                                        </li>
                                        <c:set value="${sessionScope.cart}" var="i"/>
                                        <li
                                            class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                            <div>
                                                <strong>Total amount</strong>
                                                <strong>
                                                    <p class="mb-0">(including VAT)</p>
                                                </strong>
                                            </div>
                                            <span>${i.getTotalPay()}</span>
                                        </li>
                                    </ul>
                                    <hr/>
                                    <form action="<%=request.getContextPath()%>/Bill" method="post" name="f">
                                        Thông tin đặt hàng 
                                        <p></p>
                                        <c:set value="${sessionScope.cus}" var="c"/>
                                        <div class="row">
                                            <!-- First Name -->
                                            <div class="input-group col-lg-6 mb-4">
                                                <input id="Name" type="text" name="name" placeholder="Full Name" 
                                                       class="form-control bg-white  border-md" readonly="" value="${c.name}">
                                            </div>


                                            <div class="input-group col-lg-12 mb-4">
                                                <input id="email" type="email" name="logname" placeholder="Login Name" 
                                                       class="form-control bg-white  border-md" readonly="" value="${c.loginName}">
                                            </div>

                                            <!-- Phone Number -->
                                            <div class="input-group col-lg-12 mb-4">
                                                <input id="phoneNumber" type="tel" name="phone" placeholder="Phone Number" 
                                                       class="form-control bg-white border-md  pl-3" readonly="" value="${c.phone}" required="">
                                            </div>

                                            <!-- Detail Address -->
                                            <div class="input-group col-lg-12 mb-4">
                                                <input  type="text" name="add" placeholder="Address" 
                                                        class="form-control bg-white  border-md" required="">
                                            </div>
                                            <!-- Divider Text -->        
                                        </div>

                                        <button type="submit" class="btn  btn-lg btn-block">
                                            CHECK OUT
                                        </button>
                                    </form>
                                    <p></p>
                                    <button type="button" class="btn  btn-lg btn-block">
                                        <a style="color: black" href="<%=request.getContextPath()%>/View/Cart.jsp">Back To Cart</a>
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
    </body>
</html>
