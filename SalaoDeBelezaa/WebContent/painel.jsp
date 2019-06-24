<!DOCTYPE html>


<%@page import="SalaoModelo.Painel"%>
<html>
<head>

<meta charset="ISO-8859-1">

<title>Salão de Beleza</title>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

 </head>
 <body>
  <p>
   <img height="80" width="90"
    src="https://www.opas.org.br/wp-content/uploads/2018/01/cabelo.jpg">
   Controle de Clientes Salão de Beleza 
  </p>
  <table class="table table-striped">
   <thead>
    <tr>
     <th width="40%">Nome</th>
     <th width="10%">Telefone</th>
     <th width="20%">Horário Marcado</th>
     <th width="10%">Tipo Serviço</th>
     <th width="10%">Valor</th>
     <th width="10%">Situação</th>
    </tr>
  </thead>
 <tbody>

 <script> 
 function prepararEditar(cod){
 
  window.location.replace('gerenciarPainel.jsp?cod='+cod);
 }
 </script>

  <%
   Painel painel = new Painel();
   for (Painel p : painel.getLista()) {
    out.print("<tr onclick='prepararEditar("+p.getCod()+")'>");
 //	 out.print("<td>" + p.getCod()+"</td>");
    out.println("<td>"+p.getNome()+"</td>");
	out.print("<td class='"+p.getCorStatus()+"'>"+p.getTelefone()+"</td>");
    out.print("<td>"+p.getHorarioMarcado()+"</td>");
    out.print("<td>"+p.getTipoServico()+"</td>");
    out.print("<td>"+p.getValor()+"</td>");
    out.print("<td>"+p.getSituacao()+"</td>");
    out.print("</td>");
   }
  %>
  </tbody>
 </table>
</body>
</html>
