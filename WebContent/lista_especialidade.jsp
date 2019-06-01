<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="CRUD.EspecialidadeCRUD"%>
<%@page import="Aplicacao.Especialidade"%>
<%@page import="Aplicacao.Conselho"%>
<%@ include file="menu.jsp"%>



<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="ISO-8859-1">
<title>Lista de Especialidade</title>
</head>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	

<body id="page-top">


	<div id="wrapper">
		<!-- Sidebar -->

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="lista_especialidade.jsp">Lista de
							Especialidades</a></li>
					<li class="breadcrumb-item active">Todas Especialidades</li>
				</ol>

				<%
					EspecialidadeCRUD ec = new EspecialidadeCRUD();
					List<Especialidade> lista = new ArrayList<Especialidade>();
					lista = ec.buscar();
				%>
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Lista de Trabalhos
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<div class="form-group input-group">
            				<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
            				<input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
        					</div>
							
							<table class="table table-bordered" id="tabela" width="100%"
								cellspacing="0">

								<thead>
									<tr>
										<th>ID</th>
										<th>Especialidade</th>
										<th>Conselho</th>
										<th>Status</th>
										<th>Açao</th>
									</tr>
								</thead>
								<tbody>
											<%
					Conselho c = new Conselho();
					for (int i = 0; i < lista.size(); i++) {
						String con = c.buscaConselho(Integer.toString(lista.get(i).getCd_conselho())).getDs_conselho();
						
						out.write("<tr>");
						out.write("<td> " + lista.get(i).getCd_especialidade() + " </td>");
						out.write("<td> " + lista.get(i).getDs_especialidade() + " </td>");
						out.write("<td> " + con + " </td>");
						out.write("<td>"); 
						if(lista.get(i).getSn_ativo().equals("S")){
							out.write("Ativo");
						}else{
							out.write("Inativo");
						}
						out.write("</td>");
						out.write("<td><a href=\"CadastroEspecialidade.jsp?cod=" + lista.get(i).getCd_especialidade() + "\"class=\"btn btn-default\">Alterar</a></td>");
					}
				%>

				</tbody>
				</table>
											<script>
            					$('input#txt_consulta').quicksearch('table#tabela tbody tr');
        					</script>
			</div>
		</div>
<div class="card-footer small text-muted">Atualizado hoje às
						11:59 PM</div>
				</div>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © Sistema Tele 2019</span>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="js/demo/datatables-demo.js"></script>
	<script src="js/demo/chart-area-demo.js"></script>

</body>

</html>