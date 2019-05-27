<%@ page language="java" contentType="text/html"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Aplicacao.Conselho"%>
<%@page import="CRUD.ConselhoCRUD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ include file="menu.jsp"%>

<%

Conselho c = new Conselho();
String ds_conselho = request.getParameter("ds_conselho");
String ds_sigla_conselho = request.getParameter("ds_sigla_conselho");


String cod = " ";
cod = request.getParameter("cod");
if(cod!=" "&&cod!=null){
	System.out.println("Cod:" + cod + "teste");
	c.setCd_conselho(Integer.parseInt(cod));
}
String del = " ";
del = request.getParameter("del");

if(ds_conselho!=null && ds_sigla_conselho != null){
	//String SN_ATIVO = "S";

	if(cod==" "||cod==null){
		if (c.InsertConselho(c)) {
			out.write("<script>alert(\"Conselho cadastrado com sucesso!\");</script>");
		} else {
			out.write("<script>alert(\"Erro ao cadastrar Conselho!\");</script>");
		}
	}
}
if(del!=null&&del!=" "&&del.equals("1")){
	c.setCd_conselho(Integer.parseInt(cod));
	if(c.DeleteConselho(c)){
		out.write("<script>alert(\"Conselho deletado com sucesso!\");</script>");
	}else{
		out.write("<script>alert(\"Erro ao deletar Conselho!\");</script>");
	}
}

if(cod!=" "&&cod!=null&&del!="1"&&del==" "){
	if(c.UpdateConselho(c)){
		out.write("<script>alert(\"Conselho atualizado com sucesso!\");</script>");
	}else{
		out.write("<script>alert(\"Erro ao atualizado Conselho!\");</script>");
	}
}


ConselhoCRUD cc = new ConselhoCRUD();
List<Conselho> lista = new ArrayList<Conselho>();
Conselho user = new Conselho();

if(cod==null){	
	user.setDs_conselho(" ");
	user.setDs_sigla_conselho(" ");

}else{
	lista= cc.buscar();
	for(int i=0;i<lista.size();i++){
		if(String.valueOf(lista.get(i).getCd_conselho()).equals(cod)){
			user = lista.get(i);
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
								<form action="CadastroConselho.jsp" method="rest">
									<h2 class="text-center">Cadastro de Conselho</h2>
									<div class="form-group">
										<input type="text" name="ds_conselho" class="form-control"
											placeholder="Descrição Conselho" required="required"
											
											<%
											if(cod!=null){
												out.write("value=\"" + user.getDs_conselho()+ "\"");
												//System.out.println("Cod:"+user.getDs_conselho() + cod + "testedentro form");
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
												out.write("value=\"" + user.getDs_sigla_conselho()+ "\"");
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