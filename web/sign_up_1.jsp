<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Sign Up | Clg</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="css/default.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="css/view.css" media="all"/>
    <script type="text/javascript" src="js/view.js"></script>

    <script language="javascript">
                function validatePassword (pw, options) {
                // default options (allows any password)
                var o = {
                        lower:    0,
                        upper:    0,
                        alpha:    0, /* lower + upper */
                        numeric:  0,
                        special:  0,
                        length:   [0, Infinity],
                        custom:   [ /* regexes and/or functions */ ],
                        badWords: [],
                        badSequenceLength: 0,
                        noQwertySequences: false,
                        noSequential:      false
                };

                for (var property in options)
                        o[property] = options[property];

                var	re = {
                                lower:   /[a-z]/g,
                                upper:   /[A-Z]/g,
                                alpha:   /[A-Z]/gi,
                                numeric: /[0-9]/g,
                                special: /[\W_]/g
                        },
                        rule, i;

                // enforce min/max length
                if (pw.length < o.length[0] || pw.length > o.length[1])
                        return false;

                // enforce lower/upper/alpha/numeric/special rules
                for (rule in re) {
                        if ((pw.match(re[rule]) || []).length < o[rule])
                                return false;
                }

                // enforce word ban (case insensitive)
                for (i = 0; i < o.badWords.length; i++) {
                        if (pw.toLowerCase().indexOf(o.badWords[i].toLowerCase()) > -1)
                                return false;
                }

                // enforce the no sequential, identical characters rule
                if (o.noSequential && /([\S\s])\1/.test(pw))
                        return false;

                // enforce alphanumeric/qwerty sequence ban rules
                if (o.badSequenceLength) {
                        var	lower   = "abcdefghijklmnopqrstuvwxyz",
                                upper   = lower.toUpperCase(),
                                numbers = "0123456789",
                                qwerty  = "qwertyuiopasdfghjklzxcvbnm",
                                start   = o.badSequenceLength - 1,
                                seq     = "_" + pw.slice(0, start);
                        for (i = start; i < pw.length; i++) {
                                seq = seq.slice(1) + pw.charAt(i);
                                if (
                                        lower.indexOf(seq)   > -1 ||
                                        upper.indexOf(seq)   > -1 ||
                                        numbers.indexOf(seq) > -1 ||
                                        (o.noQwertySequences && qwerty.indexOf(seq) > -1)
                                ) {
                                        return false;
                                }
                        }
                }

                // enforce custom regex/function rules
                for (i = 0; i < o.custom.length; i++) {
                        rule = o.custom[i];
                        if (rule instanceof RegExp) {
                                if (!rule.test(pw))
                                        return false;
                        } else if (rule instanceof Function) {
                                if (!rule(pw))
                                        return false;
                        }
                }

                // great success!
                return true;
            }
            function checkForm()
            {

                    //Prompt if missing firstname
                    if(document.myForm.username.value == "")
                    {
                            alert("Please enter the username.");
                            document.myForm.username.focus();
                            return false;
                    }
                    if(document.myForm.password.value == "")
                    {
                            alert("Please enter the password.");
                            document.myForm.password.focus();
                            return false;
                    }
                    if(document.myForm.conpassword.value == "" || document.myForm.conpassword.value != document.myForm.password.value)
                    {
                            alert("Password doesn't match.");
                            document.myForm.conpassword.focus();
                            return false;
                    }
                    
                    return false;
            }
    </script>

</head>
<body>
<div id="header">
	<div id="logo">
		<h1><a href=;"#">College</a></h1>
		
	</div>
        
</div>
    
    <div style="padding-left: 350px">
        <form id="form_490840" class="appnitro"  name="myForm" method="post" onsubmit="return checkForm()" action="SignUpServlet" >
                        <input type="hidden" name="htmlFormName" value="form_1"/>
					<div class="form_description">
			<h2>Sign Up</h2>
			<p>Get Yourself Registered at College-Connect</p>
		</div>						
			<ul >
			
            <li id="li_3" >
		<label class="description" for="element_3">Username </label>
		<div>
			<input id="element_3" name="username" class="element text small" type="text" maxlength="255" value=""/> 
		</div><p class="guidelines" id="guide_2"><small>A unique name that you would be using at the time of login</small></p>
		</li>		<li id="li_4" >
		<label class="description" for="element_4">Password </label>
		<div>
			<input id="element_4" name="password" class="element text small" type="password"  value=""/> 
		</div>
                <p class="guidelines" id="guide_2"><small>Enter a password with a minimum length of 6 characters</small></p>
		</li>		<li id="li_5" >
		<label class="description" for="element_5">Confirm Password </label>
		<div>
			<input id="element_5" name="conpassword" class="element text small" type="password" maxlength="255" value=""/> 
		</div>
                <p class="guidelines" id="guide_2"><small>Should match with the above password</small></p>
		</li>		<li id="li_7" >
		<label class="description" for="element_7">You are a </label>
		<div>
		<select class="element select small" id="element_7" name="role"> 
			<option value="Student" selected="selected">Student</option>
                        <option value="Faculty" >Faculty</option>

		</select>
		</div> 
                <p class="guidelines" id="guide_2"><small>Select the appropriate role</small></p>
		</li>		
					<li class="buttons">
			    <input type="hidden" name="form_id" value="490840" />
			    
                            <input id="saveForm" class="button_text" type="submit" name="submit" value="Next" />
		</li>
			</ul>
		</form>	
    
        </div>    
    
<div id="footer">
	<p id="copy">&copy;2012 College-Connect. Designed by <a href="http://www.facebook.com/upasi.mehta">Upasi</a> and <a href="http://www.facebook.com/sudhir1011011">Sudhir</a></p>
        <p id="feed"><a href="https://www.facebook.com/groups/319660390658/" target="_blank" id="rss"><img src="images/img181.gif" alt="facebook"></img></a></p>
</div>
</body>
</html>