

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
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
        <!-- Navbar -->
         <%@include file="Header.jsp" %>
        <!-- Navbar -->

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
                            <h3 class="register-heading">Create an account</h3>
                            <form class="row register-form" action="<%=request.getContextPath()%>/ControlSignUp" method="post">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input name="name" type="text" class="form-control" placeholder="Full Name *" value="" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <input name="logname" type="text" class="form-control" placeholder="SignIn Name *" value="" required="required"/>

                                    </div>
                                    <% if(request.getAttribute("Existed") != null){%>
                                    <p style="color: red" >${requestScope.Existed}</p>
                                    <%}%>
                                    <div class="form-group">
                                        <input name="pass" type="password" class="form-control" placeholder="Password *" value="" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <input name="cfpass" type="password" class="form-control"  placeholder="Confirm Password *" value="" required="required"/>
                                    </div>
                                    <% if(request.getAttribute("ErrorPass") != null){%>
                                    <p style="color: red" >${requestScope.ErrorPass}</p>
                                    <%}%>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input name="email" type="email" class="form-control" placeholder="Your Email *" value="" />
                                    </div>
                                    <% if(request.getAttribute("MailExisted") != null){%>
                                    <p style="color: red" >${requestScope.MailExisted}</p>
                                    <%}%>
                                    
                                    <% if(request.getAttribute("ErrorPhone") != null){%>
                                    <p style="color: red" >${requestScope.ErrorPhone}</p>
                                    <%}%>
                                    <div class="form-group">
                                        <input name="phone" type="text" minlength="10" maxlength="10" name="txtEmpPhone" class="form-control" placeholder="Your Phone *" value="" />
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

                                    <input type="submit" class="btnRegister"  value="Register"/>

                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
