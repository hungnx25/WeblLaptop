

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">


    </head>
    <body>

        <div class="login-form">
            <form action="<%=request.getContextPath()%>/Verify" method="post">
                <h2 class="text-center">Verify your account</h2>   
                <p class="text-center text-muted small">Enter the code we just send to your email ${logName} </p>
                <div class="form-group">
                    <div class="input-group">                      
                        <input type="text" class="form-control" name="code" required="required">				
                    </div>
                </div>
                <div class="form-group">
                    <input type="text" name="${logName}" hidden>
                    <button type="submit" class="btn btn-primary login-btn btn-block">Verify</button>
                </div>
                <% if(request.getAttribute("wrongCode") != null){%>
                <p style="color: red" >${requestScope.wrongCode}</p>
                <%}%>    

            </form>

            <form action="<%=request.getContextPath()%>/Verify" method="get">
                <p class="text-center text-muted small">Don't have OTP? 
                    <input type="submit" name="reSend" value="Resend OTP" />
            </form>

        </div>
    </body>
</html>