<%-- 
    Document   : solicitacao_diagnostico
    Created on : 18/03/2019, 19:59:31
    Author     : 0154761
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Aplicacao.Pedido"%>
<%@page import="Aplicacao.Especialidade"%>
<%@page import="CRUD.PedidoCRUD" %>
<%@page import="Aplicacao.Diagnostico"%>
<%@page import="Aplicacao.Paciente"%>
<%@page import="CRUD.DiagnosticoCRUD" %>
<%@page import="CRUD.EspecialidadeCRUD" %>
<%@page import="javax.servlet.http.Cookie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="menu.jsp"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Sistema Tele - Solicitação</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

      <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>

  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  

</head>
<%
	Cookie[] cookies = request.getCookies();

	String codigoUsuario = "";
	
	String cadastro = request.getParameter("cadastro");
	if(cadastro!=null){
		out.print("<script>alert(\"Solicitação cadastrada com sucesso!\");</script>");
	}

	for(Cookie cookie: cookies){
		if(cookie.getName().equals("codigo")){
			codigoUsuario = cookie.getValue();
		}
	}


	String paciente = request.getParameter("paciente");
	String diagnostico = request.getParameter("diagnostico");
	String especialidade = request.getParameter("especialidade");
	System.out.println(especialidade);
	String anexo = request.getParameter("anexo");
	String descricao = request.getParameter("descricao");
	Pedido p = new Pedido();
	Pedido pe = new Pedido();	
	Diagnostico d = new Diagnostico();
	
	if(paciente!=null && diagnostico != null){
		String array[] = new String[3];
		array = paciente.split(" - ");
		paciente = array[0];
		array = diagnostico.split(" - ");
		diagnostico = array[0];
		array = especialidade.split(" - ");
		especialidade = array[0];
	

		p.setCd_diagnostico(diagnostico);
		p.setCd_especialidade(especialidade);
		p.setCd_paciente(paciente);
		p.setDs_diagnostico(descricao);
		p.setCd_usuario(codigoUsuario);
		p.setCd_status("PENDENTE");
		
	}

	String cod = " ";
	cod = request.getParameter("cod");
	if(cod!=" "&&cod!=null){
		p.setCd_pedido(cod);
	}

	System.out.println("Diagnostico: " + diagnostico + " especialidade: " + especialidade + " codigo: " + cod);
	if (diagnostico != null && especialidade != null) {
		if(cod!=null){
				if(pe.UpdatePedido(p)){
					out.write("<script>alert(\"Solicitação atualizada com sucesso!\");</script>");
				}else{
					out.write("<script>alert(\"Erro ao atualizar solicitação!\");</script>");
				}
			}else{
			if (pe.InsertPedido(p)) {
				out.write("<script>alert(\"Solicitação cadastrada com sucesso!\");</script>");
				response.sendRedirect("upload.jsp?cod=" + pe.getCodUltimoPedido());
				

			} else {
				out.write("<script>alert(\"Erro ao cadastrar solicitação!\");</script>");
			}
		}
	}
	
	
	List<Pedido> lista = new ArrayList<Pedido>();
    
    
	if(cod==null){
		p.setCd_data_hr("");
		p.setCd_paciente("");
		p.setCd_status("");
		p.setCd_usuario("");
		p.setDs_observacao("");
	}else{
		lista= p.BuscaPedido();
		for(int i=0;i<lista.size();i++){
			if(String.valueOf(lista.get(i).getCd_pedido()).equals(cod)){
				p = lista.get(i);
			}
		}
	}
	
	EspecialidadeCRUD ec = new EspecialidadeCRUD();

	List<Especialidade> listaEspecialidades = new ArrayList<Especialidade>();
    
    listaEspecialidades = ec.buscar();
	
    Paciente pac = new Paciente();
    List<Paciente> listaPacientes = new ArrayList<Paciente>();
    listaPacientes = pac.BuscaPaciente();

%>

<body id="page-top">

  <div id="wrapper">
    <!-- Sidebar -->

		<div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="solicitacao_diagnostico.jsp">Solicitação de Diagnóstico</a>
          </li>
          <li class="breadcrumb-item active">Cadastrar</li>
        </ol>

<div class="container" background="gray">
        <div class="row jumbotron">
            
            <div class="col">
                <div class="login-form">
            <form action="solicitacao_diagnostico.jsp<%if(cod!=null){out.print("?cod="+cod);}%>" method="post">
                <h2 class="text-center">Solicitação de Diagnóstico</h2> 
                                <div align="right">
                    <td><a href="cadastro_paciente.jsp" btn btn-default\">Inserir Paciente</a></td>
                </div>   
                <div class="form-group">
                	
                    <select class="form-control" id="exampleFormControlSelect1" name="paciente">
                   

                    
                        <option disabled selected>Paciente</option>                    

						<%if(cod==null){
								for(int i=0;i<listaPacientes.size();i++){
									out.write("<option>");
									out.write(listaPacientes.get(i).getCd_paciente() + " - " + listaPacientes.get(i).getNm_paciente());
									out.write("</option>");
								}
							}else{
								for(int i=0;i<listaPacientes.size();i++){ 	
									System.out.println("Codigo: " + cod + "cd_paciente " + listaPacientes.get(i).getCd_paciente());
									if(listaPacientes.get(i).getCd_paciente()==Integer.parseInt(p.getCd_paciente())){
										System.out.println("Tste");
										out.write("<option selected>");
										out.write(listaPacientes.get(i).getCd_paciente() + " - " + listaPacientes.get(i).getNm_paciente());
										out.write("</option>");
									}else{
										System.out.println("Tste");
										out.write("<option>");
										out.write(listaPacientes.get(i).getCd_paciente() + " - " + listaPacientes.get(i).getNm_paciente());
										out.write("</option>");
									}
								}
							}
						%>
                    </select>
                </div>
   
                <div class="form-group">
                    <select class="form-control" id="exampleFormControlSelect1" name="diagnostico">
                        <option disabled selected>Diagnostico</option>
						<%
							List<Diagnostico> listaDiagnostico = d.BuscaDiagnostico();
							
							if(cod==null){
								for(int i=0;i<listaDiagnostico.size();i++){
									out.write("<option>");
									out.write(listaDiagnostico.get(i).getCd_diagnostico() + " - " + listaDiagnostico.get(i).getDs_diagnostico());
									out.write("</option>");
								}
							}else{
								for(int i=0;i<listaDiagnostico.size();i++){
									if(listaDiagnostico.get(i).getCd_diagnostico()==Integer.parseInt(p.getCd_diagnostico())){
										out.write("<option selected>");
										out.write(listaDiagnostico.get(i).getCd_diagnostico() + " - " + listaDiagnostico.get(i).getDs_diagnostico());
										out.write("</option>");
									}else{
										out.write("<option>");
										out.write(listaDiagnostico.get(i).getCd_diagnostico() + " - " + listaDiagnostico.get(i).getDs_diagnostico());
										out.write("</option>");
									}
								}
							}
						%>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control" id="exampleFormControlSelect1" name="especialidade" placeholder="Especialidade" required>
                        <option disabled selected>Especialidade</option>
                        <%
					    	List<Especialidade> listaEspecialidade = ec.buscar();
                        	if(cod==null){
                        		for(int i=0;i<listaEspecialidade.size();i++){
    								out.write("<option>");
    								out.write(listaEspecialidade.get(i).getCd_especialidade() + " - " + listaEspecialidade.get(i).getDs_especialidade());
    								out.write("</option>");
    							}
                        	}else{
                        		for(int i=0;i<listaEspecialidade.size();i++){
                        			if(listaEspecialidade.get(i).getCd_especialidade().equals(p.getCd_especialidade())){
                        				out.write("<option selected>");
        								out.write(listaEspecialidade.get(i).getCd_especialidade() + " - " + listaEspecialidade.get(i).getDs_especialidade());
        								out.write("</option>");
                        			}else{
                        				out.write("<option>");
        								out.write(listaEspecialidade.get(i).getCd_especialidade() + " - " + listaEspecialidade.get(i).getDs_especialidade());
        								out.write("</option>");                        				
                        			}
    							}
                        	}
						%>
                    </select>
                </div>
<!--                   <div class="form-group">
                    <label for="exampleFormControlFile1">Anexar Arquivo</label>
                    <input type="file" class="form-control-file" name="arquivo" id="exampleFormControlFile1">
                  </div> -->
                

            <div class="col">
                <div class="form-group">
                  <label for="exampleFormControlTextarea1">Descrição da solicitação</label>
                  <textarea class="form-control" name="descricao" id="exampleFormControlTextarea1" rows="18" required><%if(cod!=null){out.write(p.getDs_observacao());}%></textarea>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-block">
                    <%
                    if(cod!=null){
						out.print("Atualizar");
					}else{
						out.print("Cadastrar");
					}
                    %>
                    </button>
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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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