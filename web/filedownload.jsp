<% 
    if(session.getAttribute("currentSessionUser")==null)
        response.sendRedirect("index.jsp?status=loggedout");
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="loginpack.ConnectionManager"%>


<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />

        <title>Files | Clg</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="css/default.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" type="text/css" href="css/view.css" media="all"/>
        <script type="text/javascript" src="js/view.js"></script>
        <script type="text/javascript" src="js/view.js">
                function scrollChat(){
                    
                objDiv = document.getElementById('chatwindow');
                objDiv.validateNow();
                objDiv.verticalScrollPosition = objDiv.maxVerticalScrollPosition;
                
                }
        </script>
    </head>
    <body>
        <div id="header">
            <div id="logo">
                    <h1><a href="#">College</a></h1>
            </div>
            <div id="menu">
                    <ul>
                            <li><a href="home.jsp" accesskey="1" title="">Home</a></li>
                            <li><a href="aboutyou.jsp" accesskey="2" title="">You</a></li>
                            <li><a href="dept.jsp" accesskey="3" title="">Branch</a></li>
                            <li><a href="aboutus.jsp" accesskey="4" title="">About Us</a></li>
                    </ul>
            </div>
            <div id="splash"><img src="images/img05.jpg" alt=""  /></div>
        </div>
        <div id="content">
            <div id="posts">
                <div class="post">
                <%if(request.getParameter("branch")!=null){%>
                    <%if(request.getParameter("type")!=null){%>
                        <%
                                    Connection con = ConnectionManager.getConnection();
                                    Statement stmt = con.createStatement();
                                    String query = "SELECT * FROM files WHERE type='"+request.getParameter("type")+"'&& branch='"+request.getParameter("branch")+"'";

                                    ResultSet rs = stmt.executeQuery(query);
                                    rs.last();
                                    do{
                        %>
                                        <a href="UploadServlet?file=<%=rs.getInt("file_id")%>"><%=rs.getString("name")%></a><br/>

                                <%}while(rs.previous());%>
                    <%}else{%>
                        
                <h2>Select a Category</h2>
                        <ul style="list-style: none">
                            <li><a href="filedownload.jsp?branch=<%=request.getParameter("branch")%>&type=Lab_Manual">Lab Manuals</a></li>
                            <li><a href="filedownload.jsp?branch=<%=request.getParameter("branch")%>&type=E_book">E Books</a></li>
                            <li><a href="filedownload.jsp?branch=<%=request.getParameter("branch")%>&type=Ref_notes">Reference Notes</a></li>
                        </ul>
                    <%}%>
                <%}else{%>
                <h2>Select a branch</h2>
                <ul style="list-style: none">
                    <li><a href="filedownload.jsp?branch=IT">Information Technology</a></li>
                    <li><a href="filedownload.jsp?branch=CE">Computer Engineering</a></li>
                    <li><a href="filedownload.jsp?branch=EC">Electronics and Communication Engineering</a></li>
                    <li><a href="filedownload.jsp?branch=MECH">Mechanical Engineering</a></li>
                    <li><a href="filedownload.jsp?branch=CL">Civil Engineering</a></li>
                    <li><a href="filedownload.jsp?branch=CH">Chemical Engineering</a></li>
                </ul>
                <%}%>
                            
                </div>
            </div>
            <div id="bar">
                s<%@include file="bar.jsp"%>
            </div>
        </div>
         
        <div id="footer">
            <p id="copy">&copy;2012 College-Connect. Designed by <a href="http://www.facebook.com/upasi.mehta">Upasi</a> and <a href="http://www.facebook.com/sudhir1011011">Sudhir</a></p>
            <p id="feed"><a href="https://www.facebook.com/groups/319660390658/" target="_blank" id="rss"><img src="images/img181.gif" alt="facebook"></img></a></p>
        </div>
    </body>
</html>