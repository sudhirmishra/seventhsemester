
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <script type="text/javascript" src="js/view.js">
                function scrollChat(){
                    
                objDiv = document.getElementById('chatwindow');
                objDiv.validateNow();
                objDiv.verticalScrollPosition = objDiv.maxVerticalScrollPosition;
                
                }
        </script>

        <script src="js/ajax.js"></script>
        
        <script>
            function event() {                        // When the HTML DOM is ready loading, then execute the following function...
                $('#shoutButton').click(function() {               // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
                    $('#somediv').append('hekko \n');
                });
                 var psconsole = $('#somediv');
                psconsole.scrollTop(
                psconsole[0].scrollHeight
                        );
        
            }
            
            $(document).ready(event);
           
        </script>
        
    </head>
    <body>
        <textarea id="somediv" style="height: 200px; width:600px" >
        </textarea>        
        <button id="shoutButton">SHOUT</button>
    </body>
</html>