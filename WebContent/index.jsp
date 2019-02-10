<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>

<link rel="stylesheet" type="text/css" href="style.css">

<title>Kirjautuminen</title>
</head>

<body>
<div class="loginform" align="center">
	<img src="img/vene.png" alt="logo_vene" style="width:350px">
	
	<form action="TarkistaKirjautuminen" method="post" name="kirjaudu" id="kirjaudu">
	
	<table class="sisaan" >
		<tr><th class="otsikko">Käyttäjä:</th><td class="sisalto"><input type="text" name="user_id" id="user_id" value=""></td></tr>
		<tr><th class="otsikko">Salasana:</th><td class="sisalto"><input type="password" name="password" value=""></td></tr>
	</table>
		<input type="submit" value="Kirjaudu">
	</form>
	<%
	if(request.getParameter("login")!=null){
		if(request.getParameter("login").equals("0")){
			out.print("Antamasi tunnus/salasana ei kelpaa!");
		}	
	}
	%>
</div>
<script>
	$(document).ready(function(){
		$("#user_id").focus();
	    $("#kirjaudu").validate({						
	    	rules: {
				user_id:  {
					required: true,
					//minlength: 6,
					//maxlength: 6
				},	
				password:  {
					required: true,
					//alla olevat eivät kuulu login-sivun määrittelyihin (vaan rekisteröitymiseen kuuluvia)
					//minlength: 5,
					//maxlength: 20,
					//minUpperCase: 1,
					//minDigits: 1,
					//minSpecial: 1,
					//maxRepeats: 3
				}
			},
			messages: {
				user_id: {
					required: "*pakollinen",
					//minlength: "* pituus oltava 6 merkkiä",
					//maxlength: "* pituus oltava 6 merkkiä"	
				},
				password: {
					required: "*pakollinen",
					//alla olevat eivät kuulu login-sivun määrittelyihin
					//minlength: "* liian lyhyt",
					//maxlength: "* liian pitkä",
					//MinUpperCase: "* vähintään 1 iso kirjain",
					//minDigits: "* vähintään 1 numero",
					//minSpecial: "* vähintään 1 erikoismerkki",
					//maxRepeats: "* max 3 samaa merkkiä peräkkäin"
				}
			},			
			submitHandler: function (form) {
				document.forms["kirjaudu"].submit();
			}		
		});
	});
</script>
</body>
</html>