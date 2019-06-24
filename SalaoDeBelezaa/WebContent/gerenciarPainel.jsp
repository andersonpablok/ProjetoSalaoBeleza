
<%@page import="SalaoModelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gerenciar Painel</title>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


</head>
<body>

<script type="text/javascript">
 function dadosForm() {
  var dados = "";
  dados += "nome="+ document.getElementById("nome").value;
  dados += "&telefone="+ document.getElementById("telefone").value;
  dados += "&horarioMarcado="+ document.getElementById("horarioMarcado").value;
  dados += "&tipoServico="+ document.getElementById("tipoServico").value;
  dados += "&valor="+ document.getElementById("valor").value;
  dados += "&situacao="+ document.getElementById("situacao").value;
  dados += "&cod="+ document.getElementById("cod").value;
  return dados;
 }

 function gravar() {
  
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
   if (this.readyState == 4 && this.status == 200) {
    // Typical action to be performed when the document is ready:
    var msg = xhttp.responseText;
    document.getElementById("msg").innerHTML = msg;
    if (msg == "Gravado com sucesso.") {
     document.getElementById("msg").className = "alert alert-info";
    } else {
     document.getElementById("msg").className = "alert alert-danger";
    }
   }
  };

  xhttp.open("GET", "servletPainel?" + dadosForm(), true);
  xhttp.send();
 }
 

  
  function apagar() {
   
   if (confirm("Realmente deseja apagar esse registro?")) {
    

   var xhttp = new XMLHttpRequest();
   xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     // Typical action to be performed when the document is ready:
     var msg = xhttp.responseText;
    
     if (msg == "Gravado com sucesso.") {
      document.getElementById("msg").className = "alert alert-info";
      document.getElementById("msg").innerHTML = "informação apagada";
      document.getElementById("formulario").reset();
     } else {
      document.getElementById("msg").className = "alert alert-danger";
      document.getElementById("msg").innerHTML = "Erro ao apagar";
     }
    }
   };

   xhttp.open("GET", "servletPainel?" + dadosForm()+"&apagar", true);
   xhttp.send();
   }
 }
  
  function novo() {
   window.location.replace('gerenciarPainel.jsp');
  }
</script>

<%
//java



Painel painel = new Painel(); 

if(request.getParameter("cod")!=null){
 int cod = Integer.parseInt(request.getParameter("cod"));
 painel = painel.getPainel(cod);
}
 
%>

<div class="container">
 <h2>Gerenciar o Painel do Salão de Beleza</h2>
 <form id="formulario">
 <input type="hidden" 
 value="<% out.print(painel.getCod()); %>" 
 id="cod" 
 /> 
  <div id="msg"></div>
  <div class="form-row">

   <div class="form-group col-md-6">

    <label for="nome">Nome Completo:</label> <input type="text"
     class="form-control" id="nome" value="<% out.print(painel.getNome()); %>" placeholder="Nome do Cliente"
     name="nome">
   </div>


   <div class="form-group col-md-3" >
     <label for="local">Telefone:</label> <input type="text"
     class="form-control" id="telefone" value="<% out.print(painel.getTelefone()); %>" placeholder="Telefone do Cliente"
     name="telefone">
   </div>

   <div class="form-group col-md-3">
    <label for="local">Horario Marcado:</label> <input type="time"
     class="form-control" id="horarioMarcado" value="<% out.print(painel.getHorarioMarcado()); %>" placeholder="Horario Marcado"
     name="local" >
   </div>
  </div>

  <div class="form-row">
    <div class="form-group col-md-3" >
    <label for="local">Status:</label> <select class="form-control"
     value="<% out.print(painel.getTipoServico()); %> "id=tipoServico name="local"> 
     <option>Corte de Cabelo</option>
     <option>Unha</option>
     <option>Hidratação</option>
     <option>Escova</option>
    </select>
    
   </div>
   <div class="form-group col-md-3">
    <label for="local">Valor:</label> <input type="text"
     class="form-control" id="valor" value="<% out.print(painel.getValor()); %>" name="local">
   </div>
   
   <div class="form-group col-md-3">
    <label for="local">Situação Pagamento</label> <select class="form-control"
     value="<% out.print(painel.getSituacao()); %> "id=situacao name="local"> 
     <option>Debito</option>
     <option>Crédito</option>
     <option>Dinheiro</option>
    </select>  
   </div> 
   
   
  </div>
  <button type="button" class="btn btn-secondary" onclick="novo()">Novo</button>
  <button type="button" class="btn btn-primary" onclick="gravar()">Gravar</button>
  <button type="button" class="btn btn-danger" onclick="apagar()">Apagar</button>
 </form>
</div>
</body>
</html>
