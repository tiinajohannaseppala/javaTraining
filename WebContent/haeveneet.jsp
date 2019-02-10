<%@include file="tarkistakirjautuminen.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Vene"%>  
<%@ page import="dao.Dao"%>  
<%@ page import="java.util.ArrayList"%>  
<%! @SuppressWarnings("unchecked") %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Etusivu</title>
</head>
<body>
<%
out.print("<form action='KirjauduUlos' method='post'>Kirjautuneena: " + session.getAttribute("kayttaja") + "<input type='submit' value='Kirjaudu ulos'></form>");
%>

<img src="img/vene.png" alt="logo_vene" style="width:200px">

<form action="HaeVeneet" method="post">
	<input type="text" name="hakusana" id="hakusana">&nbsp;
	<input type="submit" value="Hae">
</form>

<br></br>
<table>
<tr>
<th>Tunnus</th>
<th>Nimi</th>
<th>Malli</th>
<th>Pituus</th>
<th>Leveys</th>
<th>Hinta</th>
<th>Toiminnot</th>
</tr>
<%

	// HUOM POIKKEUS TENTIN TEHTÄVÄNANTOON!
	// EI ERILISTÄ listaaveneet.jsp:tä vaan tämä vastaa molempia (listaa+hae)
	//tämä vastaa haeveneet toimintoja
if(request.getAttribute("veneet")!=null){	
	ArrayList<Vene> veneet = (ArrayList<Vene>)request.getAttribute("veneet");
	for(int i=0;i<veneet.size();i++){
		out.print("<tr>");
		out.print("<td>" + veneet.get(i).getTunnus() + "</td>");
		out.print("<td>" + veneet.get(i).getNimi() + "</td>");
		out.print("<td>" + veneet.get(i).getMerkkimalli() + "</td>");
		out.print("<td>" + veneet.get(i).getPituus() + "</td>");
		out.print("<td>" + veneet.get(i).getLeveys() + "</td>");
		out.print("<td>" + veneet.get(i).getHinta() + "</td>");
		//out.print("<td><a class='poista' href='PoistaVene?poista_tunnus="+veneet.get(i).getTunnus()+"'>poista</a><a class='muokkaa' href='muutavene.jsp?muokkaa_tunnus="+veneet.get(i).getTunnus()+"&nimi="+veneet.get(i).getNimi()+"&merkkimalli="+veneet.get(i).getMerkkimalli()+"&pituus="+veneet.get(i).getPituus()+"&leveys="+veneet.get(i).getLeveys()+"&hinta="+veneet.get(i).getHinta()+"'>muokkaa</a></td>");
		//out.print("</tr>");
		out.print("<td><a class='poista' href='PoistaVene?poista_tunnus="+veneet.get(i).getTunnus()+"'><abbr title='Poista'>poista</abbr></a>&nbsp;");
		out.print("<a class='muuta' href='EtsiMuutaVene?tunnus="+veneet.get(i).getTunnus()+"'><abbr title='Muuta'>muokkaa</abbr></a></td>\n");
		out.print("</tr>");
	}	
}
else {
	// tämä vastaa listaaveneet-toimintoja
	// mielestäni näin sivu toimii paremmin ja vähentää mahdollisten virheiden määrää toteutuksessa (esim. sivujen päivityksen yhteydessä)
	Dao dao = new Dao();
	ArrayList<Vene> veneet = dao.listaaKaikki();
		for(int i=0;i<veneet.size();i++){
			out.print("<tr>");
			out.print("<td>" + veneet.get(i).getTunnus() + "</td>");
			out.print("<td>" + veneet.get(i).getNimi() + "</td>");
			out.print("<td>" + veneet.get(i).getMerkkimalli() + "</td>");
			out.print("<td>" + veneet.get(i).getPituus() + "</td>");
			out.print("<td>" + veneet.get(i).getLeveys() + "</td>");
			out.print("<td>" + veneet.get(i).getHinta() + "</td>");
			out.print("<td><a class='poista' href='PoistaVene?poista_tunnus="+veneet.get(i).getTunnus()+"'><abbr title='Poista'>poista</abbr></a>&nbsp;");
			out.print("<a class='muuta' href='EtsiMuutaVene?tunnus="+veneet.get(i).getTunnus()+"'><abbr title='Muuta'>muokkaa</abbr></a></td>\n");
			out.print("</tr>");
		}
}
%>
</table>
<form action="lisaavene.jsp">
	<input type="submit" value="Lisää uusi" id="lisaa">
</form>
<script>
	$(document).ready(function(){
		$("#hakusana").focus();
	});
</script>
</body>
</html>