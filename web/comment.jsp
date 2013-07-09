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
<link href="default.css" rel="stylesheet" type="text/css" />
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
                <%@page import="java.sql.*" %>
                <%@ page import="java.io.*" %> 
                <%@ page import="javax.*" %>
                <%@ page import="java.util.*" %>
                <%
			String connectionURL = "jdbc:mysql://localhost:3306/college_connect";
                        Connection connection = null;
			String con_header="",con_body="",con_by="";
                        String con_date="";
                        Statement statement = null;
			ResultSet rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			try {
				connection = DriverManager.getConnection(connectionURL, "root", "");
				String queryString = "SELECT * FROM group_comment where comment_id='"+request.getParameter("p_no")+"'";
				statement = connection.createStatement();
				rs = statement.executeQuery(queryString);
				rs.last();
                                
                                       con_header = rs.getString("header");
                                       con_body = rs.getString("body");
                                       con_by = rs.getString("poster_id");
                                       Calendar cal = Calendar.getInstance();
                                       Timestamp t = rs.getTimestamp("date", cal);
                                       con_date = t.toString();
                                       con_date = con_date.trim();
                %>
                <div class="post">
			<h2 class="title"><% out.print(con_header); %></h2>
			<h3 class="date">Posted on <% out.print(con_date); %> by <% out.print(con_by); %></h3>
			<div class="story">
                            <p><% out.print(con_body); %></p>
                        </div>
                        <div>
                            <p style="float:right">Comments</p>
                        </div>
		</div>
                <%
                                                        
						}
						catch (SQLException ex) {
							out.println("<h1>You haven't registered yourself </h1>.");
						}finally {
						// close all the connections.
						statement.close();
						connection.close();
						
						}
		%>
                           <form action="comment" method="post">
                    <label class="desc" id="title" name="title">
                        Tell us something new
                    </label>
                    <div>
                        <textarea style="float: left" id="posts" 
                        name="comment-body" 
                        class="field textarea medium" 
                        spellcheck="true" 
                        rows="3" cols="35" 
                        tabindex="15" 
                        onkeyup=""
                        ></textarea>
                    </div>
                               <input type="hidden" name="postID" value="4"/>
                    <div>
                        <input style="float: right" id="saveForm" name="saveForm" class="btTxt submit" 
                                    type="submit" value="Comment"/>
                    </div>
                </form>
                
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
