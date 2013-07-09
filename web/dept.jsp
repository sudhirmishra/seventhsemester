
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page import="loginpack.UserDAO"%>
<%@page import="loginpack.ConnectionManager"%>
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
			<li class="active"><a href="#" accesskey="3" title="">Branch</a></li>
			<li><a href="aboutus.jsp" accesskey="4" title="">About Us</a></li>
		</ul>
	</div>
	<div id="splash"><img src="images/img05.jpg" alt=""  /></div>
</div>
<div id="content">
            <div id="posts">
                <form action="BlogServlet" method="post">
                    <label class="desc" id="title" name="title">
                        Tell us something new
                    </label>
                    <div>
                        <textarea id="posts1" 
                        name="post_header" 
                        class="field textarea medium" 
                        spellcheck="true" 
                        rows="1" cols="25" 
                        tabindex="15" 
                        onkeyup=""
                        ></textarea>
                        <textarea id="posts" 
                        name="post_body" 
                        class="field textarea medium" 
                        spellcheck="true" 
                        rows="5" cols="55" 
                        tabindex="15" 
                        onkeyup=""
                        ></textarea>
                    </div>
                    <div>
                        <input style="float: right" id="saveForm" name="saveForm" class="btTxt submit" 
                                    type="submit" value="Submit"/>
                    </div>
                </form>
                <%@page import="java.sql.*" %>
                <%@ page import="java.io.*" %> 
                <%@ page import="javax.*" %>
                <%@ page import="java.util.*" %>
                <%
                        int page_no;
                        if(request.getParameter("page_no")!=null){
                            page_no = Integer.parseInt(request.getParameter("page_no"));
                            if(page_no<0){
                                page_no=0;
                            }
                        }else{
                            page_no = 0;
                        }
                        blog.Blog b = new blog.Blog(page_no);
                        blog.Post[] p = b.getPost();
                        String con_header,con_body,con_by,con_date;
                        for(int i=0;i<p.length;i++){
               %>
                <div class="post">
                    <h2 class="title"><a href="post.jsp?p_no=<%=p[i].getPost_id()%>"><%= p[i].getHeader()%></a></h2>
			<h3 class="date">Posted on <%=p[i].getPost_date() %> by <%=p[i].getPost_user()%></h3>
			<div class="story">
                            <p><%=p[i].getBody()%></p>
                        </div>
                        <div>
                            <p style="float:right"><a href="post.jsp?p_no=<%=p[i].getPost_id()%>">Comments</a></p>
                        </div>
		</div>
                <%}             		
		%>
                <br/>
                <br/>
                <div>
                    <% if(page_no < blog.Blog.getMaxlength()){ %>
                    <a style="float: left" href="dept.jsp?page_no=<%= page_no + 1 %>">Older Posts</a>
                    <%}%>
                    <%if(page_no!=0){%>
                    <a style="float: right" href="dept.jsp?page_no=<%= page_no - 1 %>">Newer Posts</a>
                    <%}%>
                </div>
            </div>
                
	
        <div id="bar">
            <%@include file="bar.jsp"%>
            <div id="branch-link" class="boxed2">
                <ul>
                    <li><a href="http://in.groups.yahoo.com/group/ddu_it_2013/">Yahoo Groups</a></li>
                    <li><a href="https://www.facebook.com/groups/319660390658/">Alumni Facebook</a></li>
                </ul>
                
            </div>
            <div id="downloads" class="boxed1">
                <h2>Downloads</h2>
                <ul>
                    <li><a href="http://google.com">Google</a></li>
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
