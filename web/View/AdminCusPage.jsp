

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
        <title>Admin Cus Page</title>

        <script type="text/javascript">
            function doDelete(logname) {
                if (confirm("Delete Customer with Logname = " + logname)) {
                    window.location = "<%=request.getContextPath()%>/DeleteCus?logname=" + logname;
                }
            }
        </script>  
    </head>
    <body>
         <%@include file="Header.jsp" %>

        <br/>
        <div class="container">
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
                            <hr class="my-3">
                            <div class="form-group">                              
                                <input name="search" class="form-control w-100" type="text" placeholder="Name" value="">
                                <input type="submit" value="SEARCH" />
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col">

                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Users</span></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Name</th>                                                            
                                                        <th>Login Name</th>
                                                        <th>Email</th>
                                                        <th>Phone</th>                                                                                                              
                                                        <th>Active</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    <c:forEach items="${sessionScope.listCus}" var="i">
                                                        <tr>
                                                            <th>${i.getName()}</th>
                                                            <th>${i.getLoginName()}</th>                                                            
                                                            <th>${i.getEmail()}</th>                                                            
                                                            <th>${i.getPhone()}</th>                                                            
                                                            <th>${i.isActive()?"Active":"Inactive"}</th>                                                            
                                                            <td>
                                                                <a href = '#' onclick="doDelete('${i.getLoginName()}')">Delete</a>
                                                                <a href = '<%=request.getContextPath()%>/UpdateCus?logname=${i.getLoginName()}' >Update</a> 
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
        </div>
    </body>
</html>
