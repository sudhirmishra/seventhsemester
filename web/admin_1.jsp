<% 
    if(session.getAttribute("currentSessionUser")==null)
        response.sendRedirect("index.jsp?status=loggedout");
%>
<%-- 
    Document   : admin_1
    Created on : Oct 8, 2012, 2:55:04 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="css/default.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" type="text/css" href="css/view.css" media="all">
        <script type="text/javascript" src="js/view.js"></script>
        
        <title>ADMIN | COLLEGECONNECT</title>
        
    </head>
    <body>
        
    <div id="header">
	<div id="logo">
		<h1><a href="#">College</a></h1>
		
	</div>
        
    </div>
    <div id="content">
        <div id="posts">
		<div class="post">
                    <h2>A brief description about what admin can do and some guidelines.</h2>
		</div>
		
	</div>
        <div id="bar">
        <div id="college-link" class="boxed2">
        <h2>Admin</h2>
        <ul>
            <li><a href="user.jsp">Users</a></li>
            <li><a href="file_upload.jsp">Files Upload Panel</a></li>
            <li><a href="sendSMS.jsp">connectSMS</a></li>
            <li><a href="LogoutServlet">Logout</a></li>
        </ul>
        </div>
        </div>
        </div>
    </body>
</html>
