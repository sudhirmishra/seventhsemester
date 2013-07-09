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
        <script type="text/javascript" src="js/calendar.js"></script>
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
        
        <title>SendSMS |ADMIN</title>
        
    </head>
    <body>
        
    <div id="header">
	<div id="logo">
		<h1><a href="#">College</a></h1>
		
	</div>
        
    </div>
    <div id="content">
        <div id="posts">
											
<div id="form_container">
	
		<form id="form_509752" class="appnitro"  method="post" action="SMSSend">
					<div class="form_description">
			<h2>Placement</h2>
			<p>Inform the students about the placement schedule</p>
		</div>						
			<ul >
			
					<li id="li_1" >
		<label class="description" for="element_1">Name of the company </label>
		<div>
			<input id="element_1" name="Company" class="element text medium" type="text" maxlength="255" value=""/> 
		</div> 
		</li>		<li id="li_2" >
		<label class="description" for="element_2">Date </label>
		<span>
			<input id="element_2_1" name="Month" class="element text" size="2" maxlength="2" value="" type="text"> /
			<label for="element_2_1">MM</label>
		</span>
		<span>
			<input id="element_2_2" name="Date" class="element text" size="2" maxlength="2" value="" type="text"> /
			<label for="element_2_2">DD</label>
		</span>
		<span>
	 		<input id="element_2_3" name="Year" class="element text" size="4" maxlength="4" value="" type="text">
			<label for="element_2_3">YYYY</label>
		</span>
	
		<span id="calendar_2">
			<img id="cal_img_2" class="datepicker" src="calendar.gif" alt="Pick a date.">	
		</span>
		<script type="text/javascript">
			Calendar.setup({
			inputField	 : "element_2_3",
			baseField    : "element_2",
			displayArea  : "calendar_2",
			button		 : "cal_img_2",
			ifFormat	 : "%B %e, %Y",
			onSelect	 : selectDate
			});
		</script>
		 
		</li>		<li id="li_3" >
		<label class="description" for="element_3">Time </label>
		<span>
			<input id="element_3_1" name="Hour" class="element text " size="2" type="text" maxlength="2" value=""/> : 
			<label>HH</label>
		</span>
		<span>
			<input id="element_3_2" name="Min" class="element text " size="2" type="text" maxlength="2" value=""/> : 
			<label>MM</label>
		</span>
		<span>
			<select class="element select" style="width:4em" id="element_3_4" name="AMPM">
				<option value="AM" >AM</option>
				<option value="PM" >PM</option>
			</select>
			<label>AM/PM</label>
		</span> 
		</li>		<li id="li_4" >
		<label class="description" for="element_4">Description </label>
		<div>
			<textarea id="element_4" name="Desc" class="element textarea medium"></textarea> 
		</div> 
		</li>		<li id="li_6" >
		<label class="description" for="element_6">Branch </label>
		<span>
			<input id="element_6_1" name="Branch" class="element checkbox" type="checkbox" value="IT" />
                        <label class="choice" for="element_6_1">Information Technology</label>
                        <input id="element_6_2" name="Branch" class="element checkbox" type="checkbox" value="CE" />
                        <label class="choice" for="element_6_2">Computer Engineering</label>
                        <input id="element_6_3" name="Branch" class="element checkbox" type="checkbox" value="EC" />
                        <label class="choice" for="element_6_3">Electronics and Communication Engineering</label>

		</span> 
		</li>		<li id="li_5" >
		<label class="description" for="element_5">Criteria </label>
		<div>
			<input id="element_5" name="Criteria" class="element text small" type="text" maxlength="255" value=""/> 
		</div> 
		</li>
			
					<li class="buttons">
			    <input type="hidden" name="form_id" value="509752" />
			    
				<input id="saveForm" class="button_text" type="submit" name="submit" value="Send" />
		</li>
			</ul>
		</form>
	</div>
        
	</div>

        <div id="bar">
        <div id="college-link" class="boxed2">
        <h2>Admin</h2>
        <ul>
            <li><a href="user.jsp">Users</a></li>
            <li><a href="#">connectSMS</a></li>
            <li><a href="file_upload.jsp">Files Upload Panel</a></li>
            <li><a href="LogoutServlet">Logout</a></li>
        </ul>
        
        </div>
        </div>
        </div>
        
        <div id="footer">
            <p id="copy">&copy;2012 College-Connect. Designed by <a href="http://www.facebook.com/upasi.mehta">Upasi</a> and <a href="http://www.facebook.com/sudhir1011011">Sudhir</a></p>
            <p id="feed"><a href="https://www.facebook.com/groups/319660390658/" target="_blank" id="rss"><img src="images/img181.gif" alt="facebook"></img></a></p>
        </div>
        
    </body>
</html>
