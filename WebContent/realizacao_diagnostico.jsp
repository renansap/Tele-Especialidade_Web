<%-- 
    Document   : solicitacao_diagnostico
    Created on : 18/03/2019, 19:59:31
    Author     : 0154761
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Aplicacao.Pedido"%>
<%@page import="Aplicacao.Especialidade"%>
<%@page import="CRUD.PedidoCRUD"%>
<%@page import="Aplicacao.Diagnostico"%>
<%@page import="Aplicacao.Paciente"%>
<%@page import="CRUD.DiagnosticoCRUD"%>
<%@page import="CRUD.EspecialidadeCRUD"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="menu.jsp"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Sistema Tele - Solicitação</title>

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

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<%
	String cod = request.getParameter("cod");
	System.out.println("codigo: " + cod);

	Pedido pe = new Pedido();
	pe.setCd_pedido(cod);
	pe = pe.buscarPedido(pe);
	
	String resposta = request.getParameter("resposta");
	pe.setDs_resposta(resposta);
	
	if(resposta !=null && cod!=null && pe.getCd_status().equals("PENDENTE")){
		if (pe.respondePedido(pe)) {
			System.out.println("resposta: " + pe.getDs_resposta());
			out.write("<script>alert(\"Resposta enviada com sucesso!\");</script>");
		} else {
			out.write("<script>alert(\"Erro ao enviar resposta!\");</script>");
		}
	}
%>

<body id="page-top">

	<div id="wrapper">
		<!-- Sidebar -->

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="solicitacao_diagnostico.jsp">Solicitação de Diagnóstico</a>
					</li>
					<li class="breadcrumb-item active">Analisar</li>
				</ol>

				<div class="container" background="gray">
					<div class="row jumbotron">

						<div class="col">
							

							<form
								action="realizacao_diagnostico.jsp<%if (cod != null) {
				out.print("?cod=" + cod);
			}%>"
								method="post">
								<div class="container">
									<h2 class="text-center">Realização de Diagnóstico</h2>
									
									<div class="container">
										<div class="row">
											<div class="col-md-4">
												<address>
													<strong>Nome: <%out.print(pe.getNm_paciente()); %></strong>
													<br> Data de Nascimento: <%out.print(pe.getDt_nascimento()); %>
													<br> Sexo: <%
																	if(pe.getSexo().equals("M")){
																		out.println("Masculino");
																	}else{
																		out.print("Feminino");
																	}
																	%>
													<br> Peso: <%out.println(pe.getPeso()); %> Kg
													<br> Altura: <%out.print(pe.getAltura()); %>  m
													
												</address>

												<address>
													<strong>Diagnóstico: </strong> <%out.print(pe.getDs_diagnostico()); %>  
												</address>
												
																								<address>
													<strong>Solicitação: </strong> <%out.print(pe.getDs_observacao()); %>  
												</address>
												<address>
													<strong>Status: </strong> <%out.print(pe.getCd_status()); %>  
												</address>
												<address>
													<strong>Anexo: </strong> <%out.write("<a href=\"UploadDownloadFileServlet?fileName="+pe.getAnexo()+"\">Download"+"</a>");%>
												</address>
											</div>
										</div>
									</div>
									
									<div class="col">
										<div class="form-group">
											<label for="exampleFormControlTextarea1">Resposta da
												solicitação</label>
											<textarea class="form-control" name="resposta"
												id="exampleFormControlTextarea1" rows="18" required <%if(pe.getCd_status().equals("ATENDIDO")){out.print("disabled");} %>><%if(pe.getCd_status().equals("ATENDIDO")){out.print(pe.getDs_resposta());} %></textarea>
										</div>

										<div class="form-group">
											<button type="submit" class="btn btn-success btn-block">Responder</button>
										</div>
									</div>
								</div>
						</div>
					</div>
					</form>
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