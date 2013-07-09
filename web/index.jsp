<%
    if(session.getAttribute("currentSessionUser")!=null)
           {    
        response.sendRedirect("home.jsp");
                               }
                %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="javax.*" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>College Connect</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="scripts/jquery.tabs.setup.js"></script>
	<script language="javascript">
			function checkForm()
			{
				
				//Prompt if missing firstname
				if(document.myform.un.value == "")
				{
					alert("Please enter username.");
					document.myform.un.focus();
					return false;
				}
				//Prompt if missing lastname
				if(document.myform.pw.value == "")
				{
					alert("Please enter password.");
					document.myform.pw.focus();
					return false;
				}
				return true;
			}
		</script>

</head>
<body style="background-image:url(/images/Nakshatra.jpg)">
<div class="wrapper col0">
  <div id="topbar">
    <div id="slidepanel">
      <div class="topbox">
        <h2>College Connect</h2>
        <p>Connect to your college while not at college, have fruitful discussions.</p>
        <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
        <p><a href="SignUpServlet">Register Here</a></p>
      </div>
      <div class="topbox">
        <h2>Faculty Login Here</h2>
        <form name="myform" action="LoginServlet" method="post">
          <fieldset>
            <legend>Faculty Login Form</legend>
            <label for="teachername">Username:
              <input type="text" name="un" id="teachername" value="" />
            </label>
            <label for="teacherpass">Password:
              <input type="password" name="pw" id="teacherpass" value="" />
            </label>
            <input type="radio" name="role" value="faculty" /> Faculty
            <input type="radio" name="role" value="student" checked="true"/> Student<br /><br/>
            <label for="teacherremember">
              <input class="checkbox" type="checkbox" name="teacherremember" id="teacherremember" checked="checked" />
              Remember me</label>
            <p>
              <input type="submit" name="teacherlogin" id="teacherlogin" value="Login" />
              &nbsp;
              <input type="reset" name="teacherreset" id="teacherreset" value="Reset" />
            </p>
          </fieldset>
        </form>
      </div>
      <div class="topbox last">
        
      </div>
      <br class="clear" />
    </div>
    <div id="loginpanel">
      <ul>
        <li class="left">Log In Here &raquo;</li>
        <li class="right" id="toggle"><a id="slideit" href="#slidepanel">Administration</a><a id="closeit" style="display: none;" href="#slidepanel">Close Panel</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div>
    <%
    if(request.getParameter("status")!=null){
        if(request.getParameter("status").equals("logout")){%>
    <center><h1>You have successfully logged out.</h1></center>
    <%}else if(request.getParameter("status").equals("loggedout")){%>
    <center><h1>You need to be logged in.</h1></center>    
    <%}else{
    %>
    <center><h1>Welcome to College-Connect.</h1></center>
    <%
    }
       }%>
    
</div>

</body>
</html>
