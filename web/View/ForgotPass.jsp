

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/signup.css"/>

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    
    <body>
       
        <%@include file="Header.jsp" %>

        <div class="container register">
            <div class="row">
                <div class="col-md-3 register-left">
                    <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                    <h3>Welcome</h3>
                    <a href="ControlSignIn" ><input type="submit" name="" value="Login"/></a> 

                </div>
                <div class="col-md-9 register-right">

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">Reset Password</h3>
                            <div class="row register-form">
                            <form action="<%=request.getContextPath()%>/ForgotPass" method="post">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" name="logName"class="form-control" placeholder="Log Name *" value="" required=""/>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="mail"class="form-control" placeholder="Your Email *" value="" required=""/>
                                        </div>

                                        <div class="form-group">
                                            <select name="quesId" class="form-control" required="required">
                                                <option required="required" class="hidden"  selected disabled>Please select your Security Question</option>
                                                <option value="1">What is your Birthdate?</option>
                                                <option value="2">What is Your old Phone Number</option>
                                                <option value="3">What is your Pet Name?</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input name="ans" type="text" class="form-control" placeholder="Enter Your Answer *" value="" />
                                        </div>
                                        <% if(request.getAttribute("Error") != null){%>
                                        <p style="color: red" >${requestScope.Error}</p>
                                        <%}%>

                                        <input  type="submit" class="btnReset"  value="Reset"/>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </div>

    </body>
</html>
