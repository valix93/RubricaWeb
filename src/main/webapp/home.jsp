<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="it.rdev.rubrica.dto.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  
		List<User> users = (List<User>) request.getAttribute("users");
		User user = (User) request.getSession().getAttribute("USER");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Rubrica Web</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
    color: #404E67;
    background: #F5F7FA;
    font-family: 'Open Sans', sans-serif;
}
.table-wrapper {
    width: 700px;
    margin: 30px auto;
    background: #fff;
    padding: 20px;	
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
}
.table-title h2 {
    margin: 6px 0 0;
    font-size: 22px;
}
.table-title .add-new {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
}
.table-title .add-new i {
    margin-right: 4px;
}
table.table {
    table-layout: fixed;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table th:last-child {
    width: 100px;
}
table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 0 5px;
    min-width: 24px;
}    
table.table td a.add {
    color: #27C46B;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}
table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
}    
table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
}
table.table .form-control.error {
    border-color: #f50000;
}
table.table td .add {
    display: none;
}
</style>
<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	var actions = $("table td:last-child").html();
	// Edit row on edit button click
	$(document).on("click", ".edit", function(){		
        $(this).parents("tr").find("td:not(:last-child)").each(function(){
			$(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
		});		
		$(this).parents("tr").find(".add, .edit").toggle();
		$(".add-new").attr("disabled", "disabled");
    });
	// Delete row on delete button click
	$(document).on("click", ".delete", function(){
        $(this).parents("tr").remove();
		$(".add-new").removeAttr("disabled");
    });
});
</script>
</head>
<body>
<div class="container-lg">
	<div class="row justify-content-end">
		<div class="col-sm-4">
		<% 				
			String testo = "Effettua ";
			String url = request.getContextPath()+"/";
			if (user==null) { 
				testo+="login";
				url = "/login.jsp";
			} 
			else {
				testo+="logout";
				url = "/LoginServlet?action=logout";
			}
		%>
			
	<!--  ${pageContext.request.contextPath}/login.jsp -->
			<a href="${pageContext.request.contextPath}<%=url%>" type="button" class="btn btn-info"><i class="fa fa-user-o"></i> <%=testo%></a>
	     </div>
     </div>
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h2>Elenco <b>Contatti</b></h2></div>
                <%
					if (user!=null){
				%>                    
                    	<div class="col-sm-4">
                    		<a href="${pageContext.request.contextPath}/secure/nuovocontatto.jsp" type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i>Aggiungi contatto</a>
    	                </div>
			    <% 
					}
			    %>    
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Cognome</th>
 	<%
		if (user!=null){
	%>                    
                        <th style="width:22%"><p class="text-center">Actions</p></th>
    <% 
		}
    %>    
                    
                    </tr>
                </thead>
                <tbody>
	<c:forEach items="${users}" var="u">
		<tr>
			<td><c:out value="${u.username }"></c:out></td>
			<td><c:out value="${u.password }"></c:out></td>
	<%
		if (user!=null){
	%>
	
	<td>
      <a onclick="document.getElementById('form-dettagli').submit();" class="info" title="Dettagli" data-toggle="tooltip"><i class="material-icons info">&#xe88e;</i>
      </a>
      <a onclick="document.getElementById('form-modifica').submit();" class="edit" title="Modifica" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
      <a onclick="document.getElementById('form-cancella').submit();" class="delete" title="Cancella" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
    
			<div style="display:none">
				<form method="post" id="form-modifica" action="/RubricaWebMaven/ContactServlet?action=modifica">
					<input type="hidden" name="username" value="${u.username}"/>
					<button type="submit">modifica contatto</button>
				</form>
				<form method="post" id="form-cancella" action="/RubricaWebMaven/ContactServlet?action=cancella">
					<input type="hidden" name="username" value="${u.username}"/>
					<button type="submit">cancella contatto</button>
				</form>
			</div>
	</td>
	<% 
		}
	%>
		</tr>
	</c:forEach>
	 </tbody>
    </table>
    <a href="secure/SecureResourceServlet">Risorsa Protetta</a>
    
        </div>
    </div>
</div>     


</body>
</html>