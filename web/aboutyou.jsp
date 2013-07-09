<%@page import="signup.UserRe"%>
<%@page import="beans.UserBean"%>
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
<title>Clg | About Us</title>
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
			<li class="active"><a href="#" accesskey="2" title="">You</a></li>
			<li><a href="dept.jsp" accesskey="3" title="">Branch</a></li>
			<li><a href="aboutus.jsp" accesskey="4" title="">About Us</a></li>
		</ul>
	</div>
	<div id="splash"><img src="images/img05.jpg" alt=""  /></div>
</div>
    <% 
                        UserBean u = (UserBean)session.getAttribute("currentSessionUser");
                        UserRe re = new UserRe(u);
                        boolean b = false;
                        if(request.getParameter("edit")!=null)
                        {
                            b = true;
                        }
                        %>
<div id="content">
	<div id="posts">
		<div class="post">
                        <div class="form_description">
                            <h2>Profile Info</h2>
                        </div>						
                        <%if(!b){%>
                        <ul style="list-style: none">
                            <li ><label>Firstname: <%= re.getFirstName() %> </label></li>
                            <li ><label>Lastname: <%= re.getLastName() %> </label></li>
                            <li ><label>Gender: <%= re.getGender() %> </label></li>
                            <li ><label>DOB: <%= re.getDOB() %> </label></li>
                            <li ><label>Address: <%= re.getAddreessLine1() %> </label></li>
                            <li ><label><%= re.getAddressLine2() %> </label></li>
                            <li ><label>City:<%= re.getCity() %> </label></li>
                            <li ><label>State:<%= re.getState() %> </label></li>
                            <li ><label>ZIP: <%= re.getZip() %> </label></li>
                            <li ><label>Country:<%= re.getCountry() %> </label></li>
                            <li ><label>Mobile Number: <%= re.getMob() %> </label></li>
                            <li ><label>Email:<%= re.getEmail() %> </label></li>
                            <li ><label>About You:<%= re.getAboutYou() %> </label></li>
                        </ul>
                        <%}else{%>
                        
                    <form id="form_491449" class="appnitro"  method="post" action="SignUpServlet">
                       <input type="hidden" name="htmlFormName" value="form_3"/>
                        <ul style="list-style: none">
                            <li id="edit_li_2" >
                                <label class="description" for="element_2">And your College ID is </label>
                                <div>
                                    <input  id="edit_element_2" name="CollegeID" class="element text small" type="text" maxlength="6" value="<%=re.getCollegeID()%>"/> 
                                </div>
                            </li>		
                            <li id="edit_li_6" >
                                <label class="description" for="element_6">Branch </label>
                                <div>
                                    <select class="element select medium" id="edit_element_6" name="Branch"> 
                                        <option value="<%=re.getBranch()%>" selected="selected"></option>
                                        <option value="IT" >Information Technology</option>
                                        <option value="CE" >Computer Engineering</option>
                                        <option value="MECH" >Mechanical Engineering</option>
                                        <option value="CL" >Civil Engineering</option>
                                        <option value="CH" >Chemical Engineering</option>
                                        <option value="IC" >Instrumentation and Control Engineering</option>
                                        <option value="EC" >Electronics and Communication Engineering</option>
                                    </select>
                                </div> 

                                <p class="guidelines" id="edit_guide_2"><small>The branch you belong to</small></p>
                            </li>

                            <li id="edit_li_1" >
                                <label class="description" for="element_1">Name </label>
                                <span>
                                    <input  id="edit_element_1_1" name= "FirstName" class="element text" maxlength="255" size="8" value="<%=re.getFirstName()%>"/>
                                    <label>First</label>
                                </span>
                                <span>
                                    <input  id="edit_element_1_2" name= "LastName" class="element text" maxlength="255" size="14" value="<%=re.getLastName()%>"/>
                                    <label>Last</label>
                                </span> 
                            </li>		
                            <li id="edit_li_8" >
                                <label class="description" for="element_8">Gender </label>
                                <span>
                                    <input  id="edit_element_8_1" name="Gender" class="element radio" type="radio" value="Male" />
                                    <label class="choice" for="element_8_1">Male</label>

                                    <input  id="edit_element_8_2" name="Gender" class="element radio" type="radio" value="Female" />
                                    <label class="choice" for="element_8_2">Female</label>
                                </span> 
                            </li>
                            
                            <li id="edit_li_5" >
                                <label class="description" for="element_5">DOB </label>
                                <span>
                                    <input  id="edit_element_5_1" name="MM" class="element text" size="2" maxlength="2" value="" type="text"/> 
                                    <label for="element_5_1">MM</label>
                                </span>
                                <span>
                                    <input  id="edit_element_5_2" name="DD" class="element text" size="2" maxlength="2" value="" type="text"/>
                                    <label for="element_5_2">DD</label>
                                </span>
                                <span>
                                    <input  id="edit_element_5_3" name="YYYY" class="element text" size="4" maxlength="4" value="" type="text"/>
                                    <label for="element_5_3">YYYY</label>
                                </span>

                                <span id="edit_calendar_5">
                                        <img id="edit_cal_img_5" class="datepicker" src="calendar.gif" alt="Pick a date."/>	
                                </span>
                                <script type="text/javascript">
                                    Calendar.setup({
                                    inputField	 : "element_5_3",
                                    baseField    : "element_5",
                                    displayArea  : "calendar_5",
                                    button		 : "cal_img_5",
                                    ifFormat	 : "%B %e, %Y",
                                    onSelect	 : selectDate
                                    });
                                </script>

                                </li>	
                            <li class="section_break">
                                <h3>Contact Information</h3>
                                <p></p>
                            </li>
                            
                            <li id="edit_li_2" >
                                <label class="description" for="element_2">Address </label>

                                <div>
                                    <input  id="edit_element_2_1" name="Add_Str" class="element text large" value="<%= re.getAddreessLine1() %>" type="text"/>
                                    <label for="element_2_1">Street Address</label>
                                </div>

                                <div>
                                    <input  id="edit_element_2_2" name="Add_Line2" class="element text large" value="<%= re.getAddressLine2() %>" type="text"/>
                                    <label for="element_2_2">Address Line 2</label>
                                </div>

                                <div class="left">
                                    <input  id="edit_element_2_3" name="City" class="element text medium" value="<%=re.getCity()%>" type="text"/>
                                    <label for="element_2_3">City</label>
                                </div>

                                <div class="right">
                                    <input  id="edit_element_2_4" name="State" class="element text medium" value="<%= re.getState() %>" type="text"/>
                                    <label for="element_2_4">State / Province / Region</label>
                                </div>

                                <div class="left">
                                    <input  id="edit_element_2_5" name="Zip" class="element text medium" maxlength="15" value="<%=re.getZip()%>" type="text"/>
                                    <label for="element_2_5">Postal / Zip Code</label>
                                </div>

                                <div class="right">
                                    <select class="element select medium" id="edit_element_2_6" name="Country"> 
                                        <option value="<%=re.getCountry()%>" selected="selected"></option>
                                        <option value="Afghanistan" >Afghanistan</option>
                                        <option value="Albania" >Albania</option>
                                        <option value="Algeria" >Algeria</option>
                                        <option value="Andorra" >Andorra</option>
                                        <option value="Antigua and Barbuda" >Antigua and Barbuda</option>
                                        <option value="Argentina" >Argentina</option>
                                        <option value="Armenia" >Armenia</option>
                                        <option value="Australia" >Australia</option>
                                        <option value="Austria" >Austria</option>
                                        <option value="Azerbaijan" >Azerbaijan</option>
                                        <option value="Bahamas" >Bahamas</option>
                                        <option value="Bahrain" >Bahrain</option>
                                        <option value="Bangladesh" >Bangladesh</option>
                                        <option value="Barbados" >Barbados</option>
                                        <option value="Belarus" >Belarus</option>
                                        <option value="Belgium" >Belgium</option>
                                        <option value="Belize" >Belize</option>
                                        <option value="Benin" >Benin</option>
                                        <option value="Bhutan" >Bhutan</option>
                                        <option value="Bolivia" >Bolivia</option>
                                        <option value="Bosnia and Herzegovina" >Bosnia and Herzegovina</option>
                                        <option value="Botswana" >Botswana</option>
                                        <option value="Brazil" >Brazil</option>
                                        <option value="Brunei" >Brunei</option>
                                        <option value="Bulgaria" >Bulgaria</option>
                                        <option value="Burkina Faso" >Burkina Faso</option>
                                        <option value="Burundi" >Burundi</option>
                                        <option value="Cambodia" >Cambodia</option>
                                        <option value="Cameroon" >Cameroon</option>
                                        <option value="Canada" >Canada</option>
                                        <option value="Cape Verde" >Cape Verde</option>
                                        <option value="Central African Republic" >Central African Republic</option>
                                        <option value="Chad" >Chad</option>
                                        <option value="Chile" >Chile</option>
                                        <option value="China" >China</option>
                                        <option value="Colombia" >Colombia</option>
                                        <option value="Comoros" >Comoros</option>
                                        <option value="Congo" >Congo</option>
                                        <option value="Costa Rica" >Costa Rica</option>
                                        <option value="Côte d'Ivoire" >Côte d'Ivoire</option>
                                        <option value="Croatia" >Croatia</option>
                                        <option value="Cuba" >Cuba</option>
                                        <option value="Cyprus" >Cyprus</option>
                                        <option value="Czech Republic" >Czech Republic</option>
                                        <option value="Denmark" >Denmark</option>
                                        <option value="Djibouti" >Djibouti</option>
                                        <option value="Dominica" >Dominica</option>
                                        <option value="Dominican Republic" >Dominican Republic</option>
                                        <option value="East Timor" >East Timor</option>
                                        <option value="Ecuador" >Ecuador</option>
                                        <option value="Egypt" >Egypt</option>
                                        <option value="El Salvador" >El Salvador</option>
                                        <option value="Equatorial Guinea" >Equatorial Guinea</option>
                                        <option value="Eritrea" >Eritrea</option>
                                        <option value="Estonia" >Estonia</option>
                                        <option value="Ethiopia" >Ethiopia</option>
                                        <option value="Fiji" >Fiji</option>
                                        <option value="Finland" >Finland</option>
                                        <option value="France" >France</option>
                                        <option value="Gabon" >Gabon</option>
                                        <option value="Gambia" >Gambia</option>
                                        <option value="Georgia" >Georgia</option>
                                        <option value="Germany" >Germany</option>
                                        <option value="Ghana" >Ghana</option>
                                        <option value="Greece" >Greece</option>
                                        <option value="Grenada" >Grenada</option>
                                        <option value="Guatemala" >Guatemala</option>
                                        <option value="Guinea" >Guinea</option>
                                        <option value="Guinea-Bissau" >Guinea-Bissau</option>
                                        <option value="Guyana" >Guyana</option>
                                        <option value="Haiti" >Haiti</option>
                                        <option value="Honduras" >Honduras</option>
                                        <option value="Hong Kong" >Hong Kong</option>
                                        <option value="Hungary" >Hungary</option>
                                        <option value="Iceland" >Iceland</option>
                                        <option value="India" >India</option>
                                        <option value="Indonesia" >Indonesia</option>
                                        <option value="Iran" >Iran</option>
                                        <option value="Iraq" >Iraq</option>
                                        <option value="Ireland" >Ireland</option>
                                        <option value="Israel" >Israel</option>
                                        <option value="Italy" >Italy</option>
                                        <option value="Jamaica" >Jamaica</option>
                                        <option value="Japan" >Japan</option>
                                        <option value="Jordan" >Jordan</option>
                                        <option value="Kazakhstan" >Kazakhstan</option>
                                        <option value="Kenya" >Kenya</option>
                                        <option value="Kiribati" >Kiribati</option>
                                        <option value="North Korea" >North Korea</option>
                                        <option value="South Korea" >South Korea</option>
                                        <option value="Kuwait" >Kuwait</option>
                                        <option value="Kyrgyzstan" >Kyrgyzstan</option>
                                        <option value="Laos" >Laos</option>
                                        <option value="Latvia" >Latvia</option>
                                        <option value="Lebanon" >Lebanon</option>
                                        <option value="Lesotho" >Lesotho</option>
                                        <option value="Liberia" >Liberia</option>
                                        <option value="Libya" >Libya</option>
                                        <option value="Liechtenstein" >Liechtenstein</option>
                                        <option value="Lithuania" >Lithuania</option>
                                        <option value="Luxembourg" >Luxembourg</option>
                                        <option value="Macedonia" >Macedonia</option>
                                        <option value="Madagascar" >Madagascar</option>
                                        <option value="Malawi" >Malawi</option>
                                        <option value="Malaysia" >Malaysia</option>
                                        <option value="Maldives" >Maldives</option>
                                        <option value="Mali" >Mali</option>
                                        <option value="Malta" >Malta</option>
                                        <option value="Marshall Islands" >Marshall Islands</option>
                                        <option value="Mauritania" >Mauritania</option>
                                        <option value="Mauritius" >Mauritius</option>
                                        <option value="Mexico" >Mexico</option>
                                        <option value="Micronesia" >Micronesia</option>
                                        <option value="Moldova" >Moldova</option>
                                        <option value="Monaco" >Monaco</option>
                                        <option value="Mongolia" >Mongolia</option>
                                        <option value="Montenegro" >Montenegro</option>
                                        <option value="Morocco" >Morocco</option>
                                        <option value="Mozambique" >Mozambique</option>
                                        <option value="Myanmar" >Myanmar</option>
                                        <option value="Namibia" >Namibia</option>
                                        <option value="Nauru" >Nauru</option>
                                        <option value="Nepal" >Nepal</option>
                                        <option value="Netherlands" >Netherlands</option>
                                        <option value="New Zealand" >New Zealand</option>
                                        <option value="Nicaragua" >Nicaragua</option>
                                        <option value="Niger" >Niger</option>
                                        <option value="Nigeria" >Nigeria</option>
                                        <option value="Norway" >Norway</option>
                                        <option value="Oman" >Oman</option>
                                        <option value="Pakistan" >Pakistan</option>
                                        <option value="Palau" >Palau</option>
                                        <option value="Panama" >Panama</option>
                                        <option value="Papua New Guinea" >Papua New Guinea</option>
                                        <option value="Paraguay" >Paraguay</option>
                                        <option value="Peru" >Peru</option>
                                        <option value="Philippines" >Philippines</option>
                                        <option value="Poland" >Poland</option>
                                        <option value="Portugal" >Portugal</option>
                                        <option value="Puerto Rico" >Puerto Rico</option>
                                        <option value="Qatar" >Qatar</option>
                                        <option value="Romania" >Romania</option>
                                        <option value="Russia" >Russia</option>
                                        <option value="Rwanda" >Rwanda</option>
                                        <option value="Saint Kitts and Nevis" >Saint Kitts and Nevis</option>
                                        <option value="Saint Lucia" >Saint Lucia</option>
                                        <option value="Saint Vincent and the Grenadines" >Saint Vincent and the Grenadines</option>
                                        <option value="Samoa" >Samoa</option>
                                        <option value="San Marino" >San Marino</option>
                                        <option value="Sao Tome and Principe" >Sao Tome and Principe</option>
                                        <option value="Saudi Arabia" >Saudi Arabia</option>
                                        <option value="Senegal" >Senegal</option>
                                        <option value="Serbia and Montenegro" >Serbia and Montenegro</option>
                                        <option value="Seychelles" >Seychelles</option>
                                        <option value="Sierra Leone" >Sierra Leone</option>
                                        <option value="Singapore" >Singapore</option>
                                        <option value="Slovakia" >Slovakia</option>
                                        <option value="Slovenia" >Slovenia</option>
                                        <option value="Solomon Islands" >Solomon Islands</option>
                                        <option value="Somalia" >Somalia</option>
                                        <option value="South Africa" >South Africa</option>
                                        <option value="Spain" >Spain</option>
                                        <option value="Sri Lanka" >Sri Lanka</option>
                                        <option value="Sudan" >Sudan</option>
                                        <option value="Suriname" >Suriname</option>
                                        <option value="Swaziland" >Swaziland</option>
                                        <option value="Sweden" >Sweden</option>
                                        <option value="Switzerland" >Switzerland</option>
                                        <option value="Syria" >Syria</option>
                                        <option value="Taiwan" >Taiwan</option>
                                        <option value="Tajikistan" >Tajikistan</option>
                                        <option value="Tanzania" >Tanzania</option>
                                        <option value="Thailand" >Thailand</option>
                                        <option value="Togo" >Togo</option>
                                        <option value="Tonga" >Tonga</option>
                                        <option value="Trinidad and Tobago" >Trinidad and Tobago</option>
                                        <option value="Tunisia" >Tunisia</option>
                                        <option value="Turkey" >Turkey</option>
                                        <option value="Turkmenistan" >Turkmenistan</option>
                                        <option value="Tuvalu" >Tuvalu</option>
                                        <option value="Uganda" >Uganda</option>
                                        <option value="Ukraine" >Ukraine</option>
                                        <option value="United Arab Emirates" >United Arab Emirates</option>
                                        <option value="United Kingdom" >United Kingdom</option>
                                        <option value="United States" >United States</option>
                                        <option value="Uruguay" >Uruguay</option>
                                        <option value="Uzbekistan" >Uzbekistan</option>
                                        <option value="Vanuatu" >Vanuatu</option>
                                        <option value="Vatican City" >Vatican City</option>
                                        <option value="Venezuela" >Venezuela</option>
                                        <option value="Vietnam" >Vietnam</option>
                                        <option value="Yemen" >Yemen</option>
                                        <option value="Zambia" >Zambia</option>
                                        <option value="Zimbabwe" >Zimbabwe</option>

                                    </select>
                                    <label for="element_2_6">Country</label>
                                </div> 
                            </li>
                            
                            <li id="edit_li_3" >
                                <label class="description" for="element_3">Mobile Number </label>
                                <div>
                                    <input  id="edit_element_3" name="Mob" class="element text medium" type="text" maxlength="255" value="<%= re.getMob()%>"/> 
                                </div> 
                            </li>	
                            
                            <li id="edit_li_4" >
                                <label class="description" for="element_4">Email </label>
                                <div>
                                    <input  value="<%= re.getEmail() %>" id="edit_element_4" name="Email" class="element text medium" type="text" maxlength="255" /> 
                                </div> 
                            </li>		
                            
                            <li id="edit_li_7" >
                                <label class="description" for="element_7">About Yourself </label>
                                <div>
                                    <textarea  id="edit_element_7" name="Abt_you" class="element textarea medium"><%= re.getAboutYou() %></textarea> 
                                </div> 
                            </li>

                            <li class="buttons">
                                <input type="hidden" name="form_id" value="491449" />
                                <input id="edit_saveForm" class="button_text" type="submit" name="submit" value="Connect" />
                            </li>
                        </ul>
                        <%}%>
                    </form>
                    <a href="aboutyou.jsp?edit=true">Edit Profile</a>
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
