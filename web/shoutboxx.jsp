<% 
if(session.getAttribute("currentSessionUser")==null)
response.sendRedirect("index.jsp?status=loggedout");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />

        <title>Shoutboxx | Clg</title>
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

        <script src="js/ajax.js"></script>
        
    <script type="text/javascript">
        $(document).ready(function() {
            var psconsole = $('#somediv');
            psconsole.scrollTop(
                psconsole[0].scrollHeight - psconsole.height()
            );
        });
    </script>
        <script>
            function event() {                        // When the HTML DOM is ready loading, then execute the following function...
                $('#shoutButton').click(function() {               // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
                    $.get('Ajax',{message:$('#abc').val()}, function(responseText) { // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                        $('#somediv').text(responseText);         // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
                    });
                });
                $('#somediv').scrollTop($('#somediv')[0].scrollHeight)
            }
            window.setInterval(function() {               // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
                    $.get('Ajax', function(responseText) { // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                        $('#somediv').text(responseText);         // Locate HTML DO`M element with ID "somediv" and set its text content with the response text.
                    });
                },1000 );
            $(document).ready(event);
           
        </script>
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
                            <li ><a href="#" accesskey="3" title="">Branch</a></li>
                            <li ><a href="aboutus.jsp" accesskey="4" title="">About Us</a></li>
                    </ul>
            </div>
            <div id="splash"><img src="images/img05.jpg" alt=""  /></div>
    </div>
    <div id="content">
            <div id="posts">
                <h1><a>SHOUTBOXX</a></h1>
                <div class="form_description">
                    <p>This is where you shout out loud your doubts, opinions. Shout here to get the attention.</p>
                </div>						
                <ul style="list-style-type: none">

                            <li id="li_1" >
                                <center><label class="description" for="element_1">Shouts</label></center>
                                <textarea readonly="readonly" style="overflow: scroll;" id="somediv"  class="element textarea medium"></textarea>
                            </li>
                            <li id="li_2" >              
                                <div>
                                    <input type="text" name="shout" id="abc" class="element textarea large"/>
                                </div> 
                            </li>
                            <li class="buttons">
                                <button id="shoutButton">SHOUT</button>
                            </li>
                </ul>
            </div>    
            <div id="bar">
                <%@include file="bar.jsp"%>
                <div id="branch-link" class="boxed2">
                    <ul>
                        <li><a href="http://in.groups.yahoo.com/group/ddu_it_2013/">Yahoo Groups</a></li>
                        <li><a href="https://www.facebook.com/groups/319660390658/">Alumni Facebook</a></li>
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