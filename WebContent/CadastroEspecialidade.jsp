<%-- 
    Document   : CadastroEspecialidade
    Created on : 18/03/2019, 19:48:15
    Author     : 0154761
--%>
<%@page import="Aplicacao.Especialidade"%>
<%@page import="Aplicacao.Conselho"%>
<%@page import="CRUD.EspecialidadeCRUD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
	String cad = request.getParameter("cad");
	String up = request.getParameter("up");
	String del = request.getParameter("del");
	String cod = request.getParameter("cod");

	System.out.println("cad=" + cad);
	Especialidade esp = new Especialidade();

	if (cad != null && cad.equals("1")) {
		System.out.println("cadastro");
		String ds_especialidade = request.getParameter("ds_especialidade");
		String cd_conselho = request.getParameter("cd_conselho");

		esp.setCd_conselho(Integer.parseInt(cd_conselho));
		esp.setDs_especialidade(ds_especialidade);
		esp.setSn_ativo("Ativo");

		if (esp.InsertEspecialidade(esp)) {
			out.print("<script>alert(\"Especialidade cadastrada com sucesso!\");</script>");
		} else {
			out.print("<script>alert(\"Erro ao cadastrar especialidade.\");</script>");
		}

	}
	if (up != null && up.equals("1") && cod != null) {
		System.out.println("Upload");
		String ds_especialidade = request.getParameter("ds_especialidade");
		String cd_conselho = request.getParameter("cd_conselho");

		esp.setCd_conselho(Integer.parseInt(cd_conselho));
		esp.setDs_especialidade(ds_especialidade);
		esp.setCd_especialidade(cod);
		esp.setSn_ativo("Ativo");
		
		

		if (esp.UpdateEspecialidade(esp)) {
			out.print("<script>alert(\"Especialidade atualizada com sucesso!\");</script>");
		} else {
			out.print("<script>alert(\"Erro ao atualizar especialidade.\");</script>");
		}

	}
	if (del != null && del.equals("1") && cod != null) {
		System.out.println("Delete");

		esp.setCd_especialidade(cod);

		if (esp.DeleteEspecialidade(esp)) {
			out.print("<script>alert(\"Especialidade deletada com sucesso!\");</script>");
		} else {
			out.print("<script>alert(\"Erro ao deletar especialidade.\");</script>");
		}
	}

	if (cod != null) {
		List<Especialidade> list = new ArrayList();
		list = esp.BuscaEspecialidades();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCd_especialidade().equals(cod)) {
				esp.setCd_conselho(list.get(i).getCd_conselho());
				esp.setCd_especialidade(cod);
				esp.setDs_especialidade(list.get(i).getDs_especialidade());
				esp.setSn_ativo(list.get(i).getSn_ativo());
			}
		}

	}
%>

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

<title>Cadastro de Especialidade</title>

</head>

<body id="page-top">


	<div id="wrapper">
		<!-- Sidebar -->

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="CadastroEspecialidade.jsp"> Cadastro de Especialidade</a></li>
					<li class="breadcrumb-item active">Cadastrar</li>
				</ol>

				<div class="container" background="gray">
					<div class="row align">&nbsp;</div>
					<div class="row align">&nbsp;</div>
					<div class="row jumbotron">
						<div class="col" align="center">
							<img src="Imagens/iconCadEsp.png">
						</div>
						<div class="col">
							<div class="esp-form">
								<form
									action="CadastroEspecialidade.jsp<%if (cod != null) {
				out.print("?up=1&cod=" + cod + "");
			} else {
				out.print("?cad=1");
			}%>"
									method="Post">
									<h2 class="text-center">Cadastro de Especialidade</h2>
									<div class="form-group">
										<input type="text" name="ds_especialidade"
											class="form-control" placeholder="Descrição Especialidade"
											required="required"<%if (cod != null) {
				out.write("value=\"" + esp.getDs_especialidade() + "\"");
			} else {
				out.write("placeholder=\"Descriçao especialidade\"");
			}%>">
									</div>
									<div class="form-group">
										<select class="form-control" placeholder="Conselho"
											required="required" name="cd_conselho">
											<%
												if (cod == null) {
													Conselho c = new Conselho();
													List<Conselho> list = new ArrayList();
													list = c.busca();
													for (int i = 0; i < list.size(); i++) {
														out.print("<option value=" + list.get(i).getCd_conselho() + ">" + list.get(i).getDs_conselho()
																+ "</option>");
													}
												} else {
													Conselho c = new Conselho();
													List<Conselho> list = new ArrayList();
													list = c.busca();
													for (int i = 0; i < list.size(); i++) {
														if (list.get(i).getCd_conselho() == esp.getCd_conselho()) {
															out.print("<option selected value=" + list.get(i).getCd_conselho() + ">"
																	+ list.get(i).getDs_conselho() + "</option>");
														} else {
															out.print("<option value=" + list.get(i).getCd_conselho() + ">" + list.get(i).getDs_conselho()
																	+ "</option>");
														}
													}
												}
											%>
											<option value=2>CRM</option>
											<!-- 											<option value="CRF">1</option>
											<option value="CRN">1</option>
											<option value="CFM">1</option> -->
										</select>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-success btn-block">
											<%
												if (cod != null) {
													out.print("Atualizar");
												} else {
													out.print("Cadastrar");
												}
											%>
										</button>
									</div>
									<%
										if (cod != null) {
											out.print("<div class=\"form-group\">");
											out.write("<td><a href=\"CadastroEspecialidade.jsp?del=1&cod=" + cod
													+ "\" class=\"btn btn-danger\">Deletar</a></td>");

										}
									%>
								
							</div>
						</div>
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
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
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
