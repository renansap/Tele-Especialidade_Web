<%-- 
    Document   : lista trabalho.jsp
    Created on : 18/03/2019, 19:52:23
    Author     : 0154761
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@include file="menu.jsp"%>
<%@page import="Aplicacao.Pedido"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">

<head>

<meta charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  

<title>Sistema Apoio Diagnóstico - Lista de Trabalho</title>

</head>

<%

	Pedido p = new Pedido();
	List<Pedido> lista = new ArrayList<Pedido>();
	lista = p.BuscaPedido();
	
%>

<body id="page-top">


<div id="wrapper">

		<div id="content-wrapper">

			<div class="container-fluid">
			
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="lista_trabalho">Lista de trabalho</a>
					</li>
					<li class="breadcrumb-item active">Todos Trabalhos</li>
				</ol>

				<!-- Icon Cards-->
				<div class="row">
					<div class="col-xl-3 col-sm-6 mb-3">					
					<div><%if (p.solicitacoesPendentes() == 0)
					{
						out.write("<div class=\"card text-white bg-success o-hidden h-100");					
						
					}else{
						out.write("<div class=\"card text-white bg-danger o-hidden h-100");
					}
					%>		
					
						<div class="card text-white bg-success o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-shopping-cart"></i>
								</div>
								<div class="mr-5"><%out.print(p.solicitacoesPendentes()); %> Solicitações!</div>
							</div>
						</div>
						</div>
					</div>
				</div>

				<!-- DataTables Example -->
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
										<th>Código</th>
										<th>Solicitante</th>
										<th>Data/Hora</th>
										<th>Status</th>
										<th>Ação</th>
										<th> </th>
									</tr>
								</thead>
							
								<tbody>
									<%
										for (int i=0;i<lista.size(); i++) {
											
											System.out.println("Urgente"+lista.get(i).getUrgente());
											
											if(lista.get(i).getCd_status().equals("PENDENTE")&&lista.get(i).getUrgente().equals("1")){
												out.write("<tr class=\"table-danger\">");
												out.write("<td> " + lista.get(i).getCd_diagnostico() + " </td>");
												out.write("<td> " + lista.get(i).getDs_nome() + "</td>");
											//	out.write("<td> " + lista.get(i).getDs_especialidade() + "</td>");
												out.write("<td> " + lista.get(i).getCd_data_hr() + " - " + lista.get(i).getCd_hr_data() + "</td>");
												out.write("<td><b>" + lista.get(i).getCd_status() + " </b></td>");
												out.write("<td><a href=\"solicitacao_diagnostico.jsp?cod=" + lista.get(i).getCd_pedido() + "\"class=\"btn btn-default\">Acessar</a></td>");
												out.write("<td><a href=\"realizacao_diagnostico.jsp?cod=" + lista.get(i).getCd_pedido() + "\"class=\"btn btn-success\">Atender</a></td>");
											}
											if(lista.get(i).getCd_status().equals("PENDENTE")&&lista.get(i).getUrgente().equals("0")){
												out.write("<tr class=\"table-success\">");
												out.write("<td> " + lista.get(i).getCd_diagnostico() + " </td>");
												out.write("<td> " + lista.get(i).getDs_nome() + "</td>");
											//	out.write("<td> " + lista.get(i).getDs_especialidade() + "</td>");
												out.write("<td> " + lista.get(i).getCd_data_hr() + " - " + lista.get(i).getCd_hr_data() + "</td>");
												out.write("<td><b>" + lista.get(i).getCd_status() + " </b></td>");
												out.write("<td><a href=\"solicitacao_diagnostico.jsp?cod=" + lista.get(i).getCd_pedido() + "\"class=\"btn btn-default\">Acessar</a></td>");
												out.write("<td><a href=\"realizacao_diagnostico.jsp?cod=" + lista.get(i).getCd_pedido() + "\"class=\"btn btn-success\">Atender</a></td>");
											}else{
												out.write("<tr>");
												out.write("<td> " + lista.get(i).getCd_diagnostico() + " </td>");
												out.write("<td> " + lista.get(i).getDs_nome() + "</td>");
											//	out.write("<td> " + lista.get(i).getDs_especialidade() + "</td>");
												out.write("<td> " + lista.get(i).getCd_data_hr() + " - " + lista.get(i).getCd_hr_data() + "</td>");
												out.write("<td>" + lista.get(i).getCd_status() + " </td>");
												out.write("<td><a href=\"realizacao_diagnostico.jsp?cod=" + lista.get(i).getCd_pedido() + "\"class=\"btn btn-default\">Acessar</a></td>");
												
											}
											out.write("</tr>");
										}
									%>
								</tbody>
							</table>
							<script>
            					$('input#txt_consulta').quicksearch('table#tabela tbody tr');
        					</script>
						</div>
					</div>
					<div class="card-footer small text-muted"><% %>Atualizado hoje às
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