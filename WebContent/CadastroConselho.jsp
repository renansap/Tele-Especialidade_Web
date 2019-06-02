<%@ page language="java" contentType="text/html"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Aplicacao.Conselho"%>
<%@page import="CRUD.ConselhoCRUD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ include file="menu.jsp"%>

<%

String cad = request.getParameter("cad");
String up = request.getParameter("up");
String del = request.getParameter("del");
String cod = request.getParameter("cod");

System.out.println("cad=" + cad);
Conselho con = new Conselho();

if (cad != null && cad.equals("1")) {
	System.out.println("cadastro");
	String ds_conselho = request.getParameter("ds_conselho");
	String cd_conselho = request.getParameter("cd_conselho");
	String ds_sigla_conselho = request.getParameter("ds_sigla_conselho");

	con.setDs_conselho(ds_conselho);
	con.setDs_sigla_conselho(ds_sigla_conselho);

	if (con.InsertConselho(con)) {
		out.print("<script>alert(\"Conselho cadastrado com sucesso!\");</script>");
	} else {
		out.print("<script>alert(\"Erro ao cadastrar conselho.\");</script>");
	}

}
if (up != null && up.equals("1") && cod != null) {
	System.out.println("Upload");
	String ds_conselho = request.getParameter("ds_conselho");
	String cd_conselho = request.getParameter("cd_conselho");
	String ds_sigla_conselho = request.getParameter("ds_sigla_conselho");

	con.setCd_conselho(cod);
	con.setDs_conselho(ds_conselho);
	con.setDs_sigla_conselho(ds_sigla_conselho);

	if (con.UpdateConselho(con)) {
		out.print("<script>alert(\"Conselho atualizado com sucesso!\");</script>");
	} else {
		out.print("<script>alert(\"Erro ao atualizar conselho.\");</script>");
	}

}
if (del != null && del.equals("1") && cod != null) {
	System.out.println("Delete");

	con.setCd_conselho(cod);

	if (con.DeleteConselho(con)) {
		out.print("<script>alert(\"Conselho deletado com sucesso!\");</script>");
	} else {
		out.print("<script>alert(\"Erro ao deletar conselho.\");</script>");
	}
}

if (cod != null) {
	List<Conselho> list = new ArrayList();
	list = con.busca();

	for (int i = 0; i < list.size(); i++) {
		if (list.get(i).getCd_conselho().equals(cod)) {
			con.setCd_conselho(list.get(i).getCd_conselho());
			con.setDs_conselho(list.get(i).getDs_conselho());
			con.setDs_sigla_conselho(list.get(i).getDs_sigla_conselho());
		}
	}

}
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Cadastro Conselho</title>

</head>
<body id="page-top">
	
<div id="wrapper">

<!-- Sidebar -->
		
		<div id="content-wrapper">

			<div class="container-fluid">
			
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="CadastroConselho.jsp">Cadastro Conselho</a>
          </li>
          <li class="breadcrumb-item active">Cadastrar</li>
        </ol>
						<div class="col">
							<div class="con-form">
								<form action="CadastroConselho.jsp?<%if(cod!=null){out.print("up=1&cod="+cod);}else{out.print("cad=1");}%>" method="POST">
									<h2 class="text-center">Cadastro de Conselho</h2>
									<div class="form-group">
										<input type="text" name="ds_conselho" class="form-control"
											placeholder="Descrição Conselho" required="required"
											
											<%
											if(cod!=null){
												out.write("value=\"" + con.getDs_conselho()+ "\"");
											}else{
												out.write("placeholder=\"Descrição Conselho\"");
											}
											%>">
									</div>
									<div class="form-group">
										<input type="text" name="ds_sigla_conselho" class="form-control"
											placeholder="Sigla Conselho" required="required"
											
											<%
											if(cod!=null){
												out.write("value=\"" + con.getDs_sigla_conselho()+ "\"");
											}else{
												out.write("placeholder=\"Sigla do Conselho\"");
											}
											%>">
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-success btn-block">
										<%
											if(cod!=null){
												out.print("Atualizar");
											}else{
												out.print("Cadastrar");
											}
										%></button>
									</div>
									<%
										if(cod!=null){
											out.print("<div class=\"form-group\">");
											out.write("<td><a href=\"CadastroConselho.jsp?del=1&cod=" + cod + "\" class=\"btn btn-danger\">Deletar</a></td>");
											
										}
									%>
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