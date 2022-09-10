

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--Paging-->
        <div class="d-flex justify-content-center">
            <ul class="pagination mt-3 mb-0">
                <!--                            <li class="page-item"><a href="#" class="page-link">‹‹</a></li>-->
                <c:if test="${page.cp >1}" >                            
                    <li class="page-item"><a href="<%=request.getContextPath()%>/LoadAll?cp=${page.cp-1}" class="page-link">‹</a></li>
                </c:if>
                <c:forEach begin="${page.pageStart}" end="${page.pageEnd}" var="i">

                    <li class="
                        <c:if test="${i == page.cp}" >
                        active
                        </c:if>
                        page-item"><a href="<%=request.getContextPath()%>/LoadAll?cp=${i}" class="page-link">${i}</a></li>                          
                </c:forEach>    
                <c:if test="${page.cp < page.np}" >
                    <li class="page-item"><a href="<%=request.getContextPath()%>/LoadAll?cp=${page.cp+1}" class="page-link">›</a></li>
                </c:if>
                <!--<li class="page-item"><a href="#" class="page-link">»</a></li>-->
            </ul>
        </div>

        <script type="text/javascript">
            function select() {
                document.F.action = "../LoadAll?nrpp=" + document.getElementsByName("nrpp").values();
                document.F.submit();
            }
        </script>
    </body>
</html>
