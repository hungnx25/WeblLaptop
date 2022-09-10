
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

        <title>Create Pro Page</title>
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
                                <li class="nav-item"><a class="nav-link px-2" href="AdminProPage.jsp" ><i class="fa fa-fw fa-th mr-1"></i><span>Product</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="AdminCusPage.jsp" ><i class="fa fa-fw fa-th mr-1"></i><span>Customer</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="Setting.jsp" ><i class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center px-xl-3">
                                <a href="LogOut.jsp" class="btn btn-success btn-block"> LogOut </a>
                            </div>
                        </div>
                    </div>

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
                                            <h1 class="h4 text-gray-900 mb-4">Add more product!</h1>
                                            <c:if test="${requestScope.IdExisted!=null}" >
                                                <h4 style="color: red">${requestScope.IdExisted}</h4>
                                            </c:if>
                                        </div>
                                        <form class="user" action="<%=request.getContextPath()%>/AddPr" method="post">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user"  name="name"
                                                       placeholder="Product name"required>
                                            </div>                                    

                                            <div class="form-group row">
                                                <div class="col-sm-4 mb-3 mb-sm-0">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Product Id" name="id" required="">
                                                </div>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Price" name="price" required>
                                                </div>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="DiscountPrice" name="disprice" required>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <div class="col-sm-4 mb-3 mb-sm-0">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Brand" name="Brand" required="">
                                                </div>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="CPU" name="CPU" required>
                                                </div>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Screen" name="Screen" required>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="RAM" name="RAM" required>
                                                </div>
                                                <div class="col-sm-4 mb-3 mb-sm-0">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="HardDrive" name="HardDrive" required="">
                                                </div>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Graphics" name="Graphics" required>
                                                </div>

                                            </div>

                                            <div class="form-group row">

                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="OS" name="OS" required>
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control form-control-user"
                                                           placeholder="Weight" name="Weight" required>
                                                </div>
                                            </div>

                                            <!--upload img-->

                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user" name="quantity"
                                                       placeholder="Số Lượng">
                                            </div>

                                            <div class="form-group row">
                                                <input type="file" id="img" name="img" accept="image/*" multiple="">
                                            </div>

                                            <div class="form-group row flex-column">
                                                <textarea class=""  name="des" id="editor" cols="75" rows="10" placeholder="Description" required>
                                                </textarea>
                                            </div>

                                            <input type="submit" value="Add" class="btn btn-primary btn-user btn-block" />
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
