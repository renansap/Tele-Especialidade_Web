<%-- 
    Document   : cadastro_usuario
    Created on : 18/03/2019, 19:58:44
    Author     : Renan
--%>

<%@page import="Aplicacao.Usuario"%>
<%@page import="Aplicacao.Paciente"%>
<%@page import="Aplicacao.Especialidade"%>
<%@page import="CRUD.UsuarioCRUD"%>
<%@page import="CRUD.PacienteCRUD"%>
<%@page import="CRUD.EspecialidadeCRUD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>




<%

	Paciente p = new Paciente();
	String nm_paciente = request.getParameter("nome");
	String dt_nascimento = request.getParameter("dt_nascimento");
	String sexo = request.getParameter("Sexo");
	String altura = request.getParameter("Altura");
	String peso = request.getParameter("peso");

	p.setNm_paciente(request.getParameter("nome"));
	p.setDt_nascimento(request.getParameter("dt_nascimento"));
	p.setSexo(request.getParameter("Sexo"));
	p.setAltura(request.getParameter("Altura"));
	p.setPeso(request.getParameter("peso"));

	String cod = " ";
	
	cod = request.getParameter("cod");
	if(cod!=" "&&cod!=null){
		System.out.println("Cod:" + cod + "teste");
		p.setCd_paciente(Integer.parseInt(cod));
	}
	String del = " ";
	del = request.getParameter("del");

	if (nm_paciente != null && dt_nascimento != null) {
	
		
		System.out.println("cod: " + cod);
		if(cod!=null){
			if(del!=null&&del!=" "&&del.equals("1")){

				//System.out.println("teste aqui");
				if(p.DeletePaciente(p)){
					out.write("<script>alert(\"Paciente deletado com sucesso!\");</script>");
				}else{
					out.write("<script>alert(\"Erro ao deletar Paciente!\");</script>");
				}
			}else{
				if(p.UpdatePaciente(p)){
					out.write("<script>alert(\"Paciente atualizado com sucesso!\");</script>");
				}else{
					out.write("<script>alert(\"Erro ao atualizar Paciente!\");</script>");
				}
			}
		}else{
			Paciente pc = new Paciente();
			if (pc.InsertPaciente(p)) {
				out.write("<script>alert(\"Paciente cadastrado com sucesso!\");</script>");
				
			} else {
				out.write("<script>alert(\"Erro ao cadastrar Paciente!\");</script>");
			}
		}
	}
	
	if(del!=null&&del!=" "&&del.equals("1")){
		System.out.println(p.getNm_paciente());
		if(p.DeletePaciente(p)){
			out.write("<script>alert(\"Paciente deletado com sucesso!\");</script>");
			
			
		}else{
			out.write("<script>alert(\"Erro ao deletar Paciente!\");</script>");
		}
	}
	

	PacienteCRUD uc = new PacienteCRUD();
    List<Paciente> lista = new ArrayList<Paciente>();
    Paciente user = new Paciente();
    
    
	if(cod==null){

		user.setNm_paciente(" ");
		user.setDt_nascimento(" ");
		user.setSexo(" ");
		user.setAltura (" ");
		
	

	}else{
		lista= uc.buscar();
		for(int i=0;i<lista.size();i++){
			if(String.valueOf(lista.get(i).getCd_paciente()).equals(cod)){
				user = lista.get(i);
			}
		}
	}
	
	EspecialidadeCRUD ec = new EspecialidadeCRUD();
    List<Especialidade> listaEspecialidades = new ArrayList<Especialidade>();
    
    listaEspecialidades = ec.buscar();
	
    
%>



<!DOCTYPE html>
<html lang="pt-br">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Sistema Tele - Cadastro de Paciente</title>


<script type="text/javascript">
	$("#telefone").mask("(00) 00000-0000");
	$("#data_nascimento").mask("0000/00/00");
</script>

</head>
<%
	
%>
<body id="page-top">

	<div id="wrapper">
		<!-- Sidebar -->
		
		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href=cadastro_paciente.jsp>Cadastro de
							Paciente</a></li>
					<li class="breadcrumb-item active">Cadastrar</li>
				</ol>

				<div class="container" background="gray">
					<div class="row align">&nbsp;</div>
					<div class="row align">&nbsp;</div>
					<div class="row jumbotron">
						<div class="col" text-align: center>
							<img src="Imagens/cadastrousuario.png" width="165" height="180" >
						</div>
						<div class="col">
							<div class="login-form">
								<form action="cadastro_paciente.jsp<%if(cod!=null){out.print("?cod="+cod);}%>" method="post">
									<h2 class="text-center">Cadastro de Paciente</h2>
									<div class="form-group">
										<input type="text" name="nome" class="form-control"
											 required="required" <%
											if(cod!=null){
												out.write("value=\"" + user.getNm_paciente()+ "\"");
											}else{
												out.write("placeholder=\"Nome Paciente\"");
											}
											%>">
									</div>
									<div class="form-group">
										<input type="text" name="dt_nascimento" class="form-control"
											placeholder="Data de Nascimento" id="data_nascimento"
											required="required"
											<%
											if(cod!=null){
												out.write("value=\"" + user.getDt_nascimento()+ "\"");
											}else{
												out.write("placeholder=\"Data de Nascimento\"");
											}
											%>
											>
									</div>

									<div class="form-group">
										<input type="text" name="Sexo" class="form-control"
											placeholder="Sexo" required="required"
											<%
											if(cod!=null){
												out.write("value=\"" + user.getSexo()+ "\"");
											}else{
												out.write("placeholder=\"Sexo\"");
											}
											%>
											>
									</div>
									<div class="form-group">
										<input type="text" name="Altura" class="form-control"
											placeholder="Altura" required="required"
											<%
											if(cod!=null){
												out.write("value=\"" + user.getAltura()+ "\"");
											}else{
												out.write("placeholder=\"Altura\"");
											}
											%>
											>
									</div>
									<div class="form-group">
										<input type="text" name="peso" class="form-control"
											placeholder="Peso" required="required"
											<%
											if(cod!=null){
												out.write("value=\"" + user.getPeso()+ "\"");
											}else{
												out.write("placeholder=\"Peso\"");
											}
											%>
											>
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
											out.write("<td><a href=\"cadastro_paciente.jsp?del=1&cod=" + cod + "\" class=\"btn btn-danger\">Deletar</a></td>");
											
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