<% 
    if(session.getAttribute("currentSessionUser")==null)
        response.sendRedirect("index.jsp?status=loggedout");
%>
<%-- 
    Document   : admin_1
    Created on : Oct 8, 2012, 2:55:04 PM
    Author     : ADMIN
--%>

<%@page import="java.sql.*"%>
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
        
        <title>User Banish |ADMIN</title>
        <script type="text/javascript">
            
            function showHint(str)
{
var xmlhttp;
if (str.length==0)
  { 
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","gethint?q="+str,true);
xmlhttp.send();
}
        </script>
        
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
                    <form action="admin_del" method="post" >
                        <select class="element select medium" id="element_6" name="Username">
                    <%
                    try{
                        Connection con = loginpack.ConnectionManager.getConnection();
                        Statement stmt = con.createStatement();
                        ResultSet rs = null;
                        String username;
                        String selectQuery = "SELECT Username FROM user_login";
                        rs = stmt.executeQuery(selectQuery);
                        while(rs.next()){
                            username = rs.getString("Username");
                        %>
                        <option value="<%=username%>" ><%=username%></option>
                        <% }
                    }catch(SQLException sqle1){
                        
                    }
                    

                    %>
                        </select>
                        <input type="submit"  name="deleteButton" value="Delete User"/>
 
                    </form>
		</div>
		
	</div>
        <div id="bar">
        <div id="college-link" class="boxed2">
        <h2>Admin</h2>
        <ul>
            <li><a href="#">Users</a></li>
            <li><a href="sendSMS.jsp">connectSMS</a></li>
            <li><a href="file_upload.jsp">Files Upload Panel</a></li>
            <li><a href="LogoutServlet">Logout</a></li>
        </ul>
        </div>
        </div>
        </div>
    </body>
</html>
