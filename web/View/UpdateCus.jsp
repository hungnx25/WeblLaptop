
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sb-admin-2.min.css"/>

        <!-- Load fonts style after rendering the layout styles -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
              rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">

        <title>Update Cus Page</title>
    </head>

    <body>
        <%@include file="Header.jsp" %>

        <div class="container">
            <div id="wrapper">

                <!-- Sidebar -->
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">                                
                                <li class="nav-item"><a class="nav-link px-2" href="<%=request.getContextPath()%>/AdProPage" ><i class="fa fa-fw fa-th mr-1"></i><span>Product</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="<%=request.getContextPath()%>/AdminCusPage" ><i class="fa fa-fw fa-th mr-1"></i><span>Customer</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="<%=request.getContextPath()%>/SettingCus" ><i class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <!--                    <div class="card">
                                            <div class="card-body">
                                                <div class="text-center px-xl-3">
                                                    <a href="<%=request.getContextPath()%>/LogOut" class="btn btn-success btn-block"> LogOut </a>
                                                </div>
                                            </div>
                                        </div>-->

                </div>
                <!-- End of Sidebar -->

                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">
                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <!-- Content Row -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Update customer!</h1>

                                        </div>
                                        <c:set var="p" value="${sessionScope.Cuss}"/>
                                        <form class="user" action="<%=request.getContextPath()%>/UpdateCus" method="post">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user"  name="logname"
                                                       placeholder="Login name" readonly="" required value="${p.loginName}">
                                            </div>                                    

                                            <div class="form-group row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Customer Name" name="name" required="" value="${p.name}">
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Email" name="email" required value="${p.email}">
                                                </div>
                                            </div>
                                            <% if(request.getAttribute("ErrorPhone") != null){%>
                                            <p style="color: red" >${requestScope.ErrorPhone}</p>
                                            <%}%>
                                            <div class="form-group row">
                                                <div class="col-sm-6">
                                                    <input type="tel" class="form-control form-control-user"
                                                           placeholder="Phone" name="phone" required value="${p.phone}">
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="QuestionId" name="quesid" required value="${p.questionId}">
                                                </div>
                                            </div>    

                                            <div class="form-group row">

                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Answer" name="answer" readonly="" required="" value="${p.answer}">
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Active" name="active" readonly="" required value="${p.active}">
                                                </div>

                                            </div>

                                            <input type="submit" value="Update" class="btn btn-primary btn-user btn-block" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /.container-fluid -->
                        </div>
                        <!-- End of Main Content -->
                    </div>
                    <!-- End of Content Wrapper -->
                </div>

                <!-- End of Page Wrapper -->
            </div>



            <!-- Bootstrap core JavaScript-->

            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="vendor/chart.js/Chart.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="js/demo/chart-area-demo.js"></script>
            <script src="js/demo/chart-pie-demo.js"></script>
            <script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/classic/ckeditor.js"></script>
            <script>
                var value;
                ClassicEditor
                        .create(document.querySelector('#editor'))
                        .then(editor => {
                            value = editor;
                        })
                        .catch(error => {
                            console.error(error);
                        });

                const handleSubmit = () => {
                    document.getElementById('a').innerHTML = value.getData();
                };
            </script>

    </body>
</html>
