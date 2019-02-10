<%@include file="tarkistakirjautuminen.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Vene"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Tietojen muuttaminen</title>
</head>
<%
Vene vene=null;
if(request.getAttribute("vene")!=null){	
	vene = (Vene)request.getAttribute("vene");
}else{
	response.sendRedirect("haeveneet.jsp");
}
%>
<body>
<%
out.print("<form action='KirjauduUlos' method='post'>Kirjautuneena: " + session.getAttribute("kayttaja") + "<input type='submit' value='Kirjaudu ulos'></form>");
%>
<img src="img/vene.png" alt="logo_vene" style="width:200px">

<form action="MuutaVene" method="post" name="muuta" id="muuta">
	<table class="lisays" >
		<tr><th class="kapeampi">Nimi:</th><td class="levea"><input type="text" name="nimi" id="nimi" value="<%=vene.getNimi()%>"></td></tr>
		<tr><th class="kapeampi">Merkkimalli:</th><td class="levea"><input type="text" name="merkkimalli" id="merkkimalli" value="<%=vene.getMerkkimalli()%>"></td></tr>
		<tr><th class="kapeampi">Pituus:</th><td class="levea"><input type="text" name="pituus" id="pituus" value="<%=vene.getPituus()%>"></td></tr>
		<tr><th class="kapeampi">Leveys:</th><td class="levea"><input type="text" name="leveys" id="leveys" value="<%=vene.getLeveys()%>"></td></tr>
		<tr><th class="kapeampi">Hinta:</th><td class="levea"><input type="text" name="hinta" id="hinta" value="<%=vene.getHinta()%>"></td></tr>
	</table>
	<input type="submit" value="Tallenna">
	<input type="hidden" name="tunnus" value="<%=vene.getTunnus()%>">
	<input type="hidden" name="tila" value="<%=vene.getTila()%>">
</form>

<form action="haeveneet.jsp">
	<input type="submit" value="Etusivulle" id="palaa">
</form>

<script>
	$(document).ready(function(){
		$("#nimi").focus();
	    $("#muuta").validate({						
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
				document.forms["muuta"].submit();
			}		
		});
	});

</script>
</body>
</html>