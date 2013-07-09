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
<title>Branch | Clg</title>
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
			<li class="active"><a href="dept.jsp" accesskey="3" title="">Branch</a></li>
			<li><a href="aboutus.jsp" accesskey="4" title="">About Us</a></li>
		</ul>
	</div>
	<div id="splash"><img src="images/img05.jpg" alt=""  /></div>
</div>
<div id="content">
            <div id="posts">
                <%
                    int post_id = Integer.parseInt(request.getParameter("p_no"));
                    blog.Post p = new blog.Post(post_id);
                    blog.Comment []c = p.getComment();
                %>
                <div class="post">
			<h2 class="title"><%=p.getHeader()%></h2>
			<h3 class="date">Posted on <%=p.getPost_date()%> by <%=p.getPost_user()%></h3>
			<div class="story">
                            <p><%=p.getBody()%></p>
                        </div>
                </div>
                <h4>Comments</h4>
                <% if(c.length != 0){
                    for(int i=0;i<c.length;i++){
                %> 
                
                    <div class="post">
                        <div class="story">
                                <p><%=c[i].getBody()%><h3 style="float: right" class="date"><%c[i].getComment_date(); %> by <%=c[i].getComment_user()%></h3>
                            </p>
                        </div>    
                            <br style=""/>
                    </div>
                <% }
                }
                    else{      %>
                            <div class="post">
                                <h3>No Comments Yet</h3>
                            </div>
                <% } %>
                <form action="BlogServlet" method="post">
                    <label class="desc" id="title" name="title">
                        Tell us something new
                    </label>
                    <div>
                        <textarea style="float: left" id="posts" 
                        name="comment_body" 
                        class="field textarea medium" 
                        spellcheck="true" 
                        rows="3" cols="35" 
                        tabindex="15" 
                        onkeyup=""
                        ></textarea>
                    </div>
                               <input type="hidden" name="postID" value="<%=request.getParameter("p_no")%>"/>
                    <div>
                        <input style="float: right" id="saveForm" name="saveForm" class="btTxt submit" 
                                    type="submit" value="Comment"/>
                    </div>
                </form>
                    <%if(((beans.UserBean)session.getAttribute("currentSessionUser")).getRole().toString().equals("Faculty")){%>
                        <a href="BlogServlet?deletePost=<%=post_id%>">Delete Post</a>
                    <%}%>
	</div>
        <div id="bar">
            <%@include file="bar.jsp"%>
            <div id="branch-link" class="boxed1">
                <h2>Groups</h2>
                <ul>
                    <li><a href="http://in.groups.yahoo.com/group/ddu_it_2013/">Yahoo Groups</a></li>
                    <li><a href="https://www.facebook.com/groups/319660390658/">Alumni Facebook</a></li>
                </ul>
                
            </div>
            </div>
        </div>
</div>
<div id="footer">
	<p id="copy">&copy;2012 College-Connect. Designed by <a href="http://www.facebook.com/upasi.mehta">Upasi</a> and <a href="http://www.facebook.com/sudhir1011011">Sudhir</a></p>
        <p id="feed"><a href="https://www.facebook.com/groups/319660390658/" target="_blank" id="rss"><img src="images/img181.gif" alt="facebook"></img></a></p>
</div>
</body>
</html>
