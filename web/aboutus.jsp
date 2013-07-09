<% 
    if(session.getAttribute("currentSessionUser")==null)
        response.sendRedirect("index.jsp?status=loggedout");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>You | Clg</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header">
	<div id="logo">
		<h1><a href="home.jsp">College</a></h1>
	</div>
	<div id="menu">
		<ul>
			<li ><a href="home.jsp" accesskey="1" title="">Home</a></li>
			<li ><a href="aboutyou.jsp" accesskey="2" title="">You</a></li>
			<li ><a href="dept.jsp" accesskey="3" title="">Branch</a></li>
			<li class="active"><a href="#" accesskey="4" title="">About Us</a></li>
		</ul>
	</div>
	<div id="splash"><img src="images/img05.jpg" alt="" /></div>
</div>
<div id="content">
	<div id="posts">
		<div class="post">
			<h2 class="title">Welcome to the college!</h2>
			<div class="story">
				<p><strong>College Connect</strong> is all about connecting to your college while not at college! You can know about the latest events happening in your college. You can also connect with your respective faculties as well as seniors.</p>
                        </div>
		</div>
		
	</div>
        <div id="bar">
            <%@include file="bar.jsp"%>
        </div> 
</div>
<div id="footer">
	<p id="copy">&copy;2012 College-Connect. Designed by <a href="http://www.facebook.com/upasi.mehta">Upasi</a> and <a href="http://www.facebook.com/sudhir1011011">Sudhir</a></p>
        <p id="feed"><a href="https://www.facebook.com/groups/319660390658/" target="_blank" id="rss"><img src="images/img181.gif" alt="facebook"></img></a></p>
</div>
</body>
</html>
