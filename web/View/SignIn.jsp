

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/signin.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    </head>
    <body>
        <!-- Navbar -->
        <%@include file="Header.jsp" %>
        <!-- Navbar -->

        <div class="login-form">
            <c:set var="cookie" value="${pageContext.request.cookies}" />
            <form action="<%=request.getContextPath()%>/ControlSignIn" method="post">
                <h2 class="text-center">Sign in</h2>   
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-user"></span>
                            </span>                    
                        </div>
                        <input type="text" class="form-control" name="username" value="${cookie.cname.value}" placeholder="Username" required="required">				
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-lock"></i>
                            </span>                    
                        </div>
                        <input type="password" class="form-control" name="password" value="${cookie.cpass.value}" placeholder="Password" required="required">				
                    </div>
                </div>        
                <div class="form-group">
                    <button type="submit" class="btn btn-primary login-btn btn-block" value="signin">Sign in</button>
                </div>
                <div class="clearfix">
                    <label class="float-left form-check-label"><input name="remember" 
                    value="${(cookie.cremember!=null?'checked':'')}" type="checkbox"> Remember me</label>
                    <a href="<%=request.getContextPath()%>/ForgotPass" class="float-right">Forgot Password?</a>
                </div>
            </form>
            <p class="text-center text-muted small">Don't have an account? <a href="SignUp.jsp">Sign up here!</a></p>
        </div>
    </body>
</html>