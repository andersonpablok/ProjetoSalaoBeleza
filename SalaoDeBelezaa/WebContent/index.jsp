<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pagina Inicial</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<body>
<script>
	function pagPainel() {
			window.location.replace('painel.jsp');
		}
	function gerenciamento() {
		window.location.replace('gerenciarPainel.jsp');
	}
	
	</script>

<center>
<h2>Sistema de Agendamento Para Salão de Beleza</h2>

<img height="160" width="220"
src="https://www.opas.org.br/wp-content/uploads/2018/01/cabelo.jpg">
<p>

<tr>


<div>
		<th>	<button type="button" class="btn btn-secondary" onclick="pagPainel()">Agenda</button> </th>
		<th>	<button type="button" class="btn btn-secondary" onclick="gerenciamento()">Gerenciamento</button> </th>
		
	</div>
	</tr>
	</center>
</body>
</html>