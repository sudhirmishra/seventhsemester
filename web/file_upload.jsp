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
	<script language="javascript">
			function checkForm()
			{
				function checkFiles()
				{
					var fup = document.getElementById('file1');
					var fileName = fup.value;
					var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
					if(ext == "pdf" || ext == "PDF") {
						return true;
					} else {
						alert("Upload pdf files only");
						fup.focus();
						return false;
					}
				}
                                
                                function addSubject(branch)
				{
                                    var ele = document.getElementById("sub");
                                    ele.add();
				}
				//Prompt if missing firstname
				if(document.myform.filename.value == "")
				{
					alert("Please enter the Filename.");
					document.myform.filename.focus();
					return false;
				}
				if(!checkFiles())
				{
					return false;
				}
				return true;
			}
		</script>
        
        <title>File Upload |ADMIN</title>
        
    </head>
    <body>
        
    <div id="header">
	<div id="logo">
		<h1><a href="#">College</a></h1>
		
	</div>
        
    </div>
    <div id="content">
        <div id="posts">
											<header>
										<h2>Upload Books</h2><%
										if(request.getAttribute("UploadStatus")==null)
												{%>
										<h3>Enter book details.</h3>
										<%}
											else if(request.getAttribute("UploadStatus").equals("true")){%>
											<h3>Upload Success!</h3>
											<%}
											else if(request.getAttribute("UploadStatus").equals("false")){%>
											<h3>Upload Failed!</h3>
											<%}%>
									</header>
                                    <form action="UploadServlet" name="myform" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
                                    	<table>
                                        	
                                        	<tr>
                                            	<td>Filename:</td>
                                            	<td><input type="text" name="filename"></td>
                                            </tr>
                                        	<tr>
                                            	<td>Branch:</td>
                                                <td><select name="branch" onchange="addSubject()">
															<option value="IT">IT</option>
															<option value="CE">CE</option>
															<option value="IC">IC</option>
															<option value="CH">CH</option>
															<option value="CL">CL</option>
															<option value="EC">EC</option>
															<option value="MECH">MECH</option>
															
												</select></td>
                                            </tr><tr>
                                            	<td>Subject:</td>
												<td><select id="sub" name="subject">
															
															
												</select></td>
                                            </tr><tr>
                                            	<td>Type:</td>
												<td><select name="type">
															<option value="Lab Manual">Lab Manual</option>
															<option value="Reference Book">Reference</option>
															<option value="Text Book">Text</option>
                                                                                                </select></td>
                                            </tr>
                                        	<tr>
                                            	<td>File:</td>
												<td><input id="file1" type="file" name="file"></td>
                                            </tr>
                                        	<tr>
												<td colspan="2"><input type="submit" value="add"></td>
                                            </tr>
                                        </table>
                                    </form>
	</div>
        <div id="bar">
        <div id="college-link" class="boxed2">
        <h2>Admin</h2>
        <ul>
            <li><a href="user.jsp">Users</a></li>
            <li><a href="sendSMS.jsp">connectSMS</a></li>
            <li><a href="file_upload.jsp">Files Upload Panel</a></li>
           <li><a href="LogoutServlet">Logout</a></li>
        </ul>
       </div>
        </div>
        </div>
    </body>
</html>
