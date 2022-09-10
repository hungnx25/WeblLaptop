
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
        <title>Setting Page</title>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="Header.jsp" %>
        <!-- Navbar -->

        <br/>
        <div class="container">
            <div class="row flex-lg-nowrap">

                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item"><a href="<%=request.getContextPath()%>/SettingCus" class="active nav-link">Settings</a></li>
                                    </ul>
                                    <div class="tab-content pt-3">
                                        <div class="tab-pane active">
                                            <form class="form" novalidate="" action="<%=request.getContextPath()%>/SettingCus" method="post">
                                                <c:set value="${sessionScope.cus}" var="c"/>
                                                <div class="row">

                                                    <div class="col">
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>FullName</label>
                                                                    <input class="form-control" type="text" name="name" placeholder="John Smith" value="${c.name}">
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Login Name</label>
                                                                    <input class="form-control" type="text" name="username" readonly="" placeholder="johnny.s" value="${c.loginName}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Email</label>
                                                                    <input class="form-control" type="text" name="email" placeholder="user@example.com" value="${c.email}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6 mb-3">
                                                                <div class="form-group">
                                                                    <label>Phone</label>
                                                                    <input class="form-control" type="text" name="phone" placeholder="0123456789" value="${c.phone}">
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <c:if test="${requestScope.ErrorUpdate!=null}">
                                                        <p style="color: red;">${requestScope.ErrorUpdate}</p>
                                                    </c:if>
                                                    <div class="mb-2"><b>Change Password</b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Current Password</label>
                                                                <input name="pass"class="form-control" type="password" placeholder="••••••">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>New Password</label>
                                                                <input name="npass" class="form-control" type="password" placeholder="••••••">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Confirm <span class="d-none d-xl-inline">Password</span></label>
                                                                <input name="cfpass" class="form-control" type="password" placeholder="••••••"></div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <br>
                                                <div class="row">
                                                    <div class="col d-flex justify-content-end">
                                                        <input class="btn btn-primary" type="submit" value="Save Changes">
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
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
