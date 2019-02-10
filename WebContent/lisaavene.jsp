<%@include file="tarkistakirjautuminen.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Uusi vene</title>
</head>
<body>
<%
out.print("<form action='KirjauduUlos' method='post'>Kirjautuneena: " + session.getAttribute("kayttaja") + "<input type='submit' value='Kirjaudu ulos'></form>");
%>
<img src="img/vene.png" alt="logo_vene" style="width:200px">

<form action="LisaaVene" method="post" name="lisaa" id="lisaa">
	<table class="lisays" >
		<tr><th class="kapeampi">Nimi:</th><td class="levea"><input type="text" name="nimi" id="nimi"></td></tr>
		<tr><th class="kapeampi">Merkkimalli:</th><td class="levea"><input type="text" name="merkkimalli" id="merkkimalli"></td></tr>
		<tr><th class="kapeampi">Pituus:</th><td class="levea"><input type="text" name="pituus" id="pituus"></td></tr>
		<tr><th class="kapeampi">Leveys:</th><td class="levea"><input type="text" name="leveys" id="leveys"></td></tr>
		<tr><th class="kapeampi">Hinta:</th><td class="levea"><input type="text" name="hinta" id="hinta"></td></tr>
	</table>
<input type="submit" value="Tallenna">
<%
if(request.getParameter("ilmo")!=null){
	if(request.getParameter("ilmo").equals("1")){
		out.print("* veneen lisääminen onnistui");	
	}else if(request.getParameter("ilmo").equals("0")){
		out.print("* veneen lisääminen ei onnistunut");	
	}
}
%>
</form>
<form action="haeveneet.jsp">
	<input type="submit" value="Etusivulle" id="palaa">
</form>
<script>
	$(document).ready(function(){
		$("#nimi").focus();
	    $("#lisaa").validate({						
	    	rules: {
				nimi:  {
					required: true,
					minlength: 2,
					maxlength: 50
				},	
				merkkimalli:  {
					required: true,
					minlength: 2,
					maxlength: 50
				},
				pituus:  {
					required: true,
					minlength: 1,
					maxlength: 10,
					number: true
				},	
				leveys:  {
					required: true,
					minlength: 1,
					maxlength: 10,
					number: true
				},
				hinta:  {
					required: true,
					minlength: 1,
					maxlength: 10,
					digits: true
				}
			},
			messages: {
				nimi: {
					required: "* pakollinen",
					minlength: "* pituus ei riitä",
					maxlength: "* liian pitkä"
					
				},
				merkkimalli: {
					required: "* pakollinen",
					minlength: "* pituus ei riitä",
					maxlength: "* liian pitkä"
				},
				pituus: {
					required: "* pakollinen",
					minlength: "* pakollinen",
					maxlength: "* liian pitkä",
					number: " * kirjaimet ei sallittuja"
				},
				leveys: {
					required: "* pakollinen",
					minlength: "* pakollinen",
					maxlength: "* liian pitkä",
					number: "* kirjaimet ei sallittuja"
				},
				hinta: {
					required: "* pakollinen",
					minlength: "* pakollinen",
					maxlength: "* liian pitkä",
					digits: "* kirjaimet/merkit ei sallittuja"
				}
			},			
			submitHandler: function (form) {
				document.forms["lisaa"].submit();
			}		
		});
	});

</script>
</body>
</html>