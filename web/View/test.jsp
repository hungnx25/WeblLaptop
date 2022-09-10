<%-- 
    Document   : xxx
    Created on : Jul 11, 2022, 10:16:11 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach items="${sessionScope.cart.items}" var="i">
            <h1>${i.product.name}</h1>
            <div class="col-2"><img class="img-fluid" src="<%=request.getContextPath()%>/img/products/${i.product.img}"></div>
            
        </c:forEach>
            <c:forEach items="${sessionScope.searchlist}" var="i">
            <h1>${i.name}</h1>
            <div class="col-2"><img class="img-fluid" src="<%=request.getContextPath()%>/img/products/${i.img}"></div>           
        </c:forEach>
    </body>
</html>
