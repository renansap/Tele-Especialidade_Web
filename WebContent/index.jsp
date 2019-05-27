<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Conexao.Conexao"%>
<%@page import="CRUD.UsuarioCRUD"%>
<%@page import="Aplicacao.Usuario"%>
<%@page import="java.util.List"%>


<%
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");

	if (email != null && senha != null) {
		Usuario l = new Usuario();	
		
		if (l.validaLogin(email, senha)) {
			String cod = l.getCd_usuarioByEmail(email);
			l.enviaCookieUsuario(senha, email, cod, response);
			response.sendRedirect("lista_trabalho.jsp");
		} else {
			out.write("<script>alert(\"Usuário ou senha incorreto!\");</script>");
		}
	}
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<title>Sistema Tele - Log In</title>

<style type="text/css">
body {
	
	background-color: gray;
}
</style>
</head>
<body>

<img src="Imagens/telafundo2.png">
 
		<div class="container" background="gray" class="text-center">
		<div class="row align">&nbsp;</div>
		<div class="text-center" >
			<h2>Sistema Apoio de Diagnóstico</h2>
		</div>
		<div class="row align">&nbsp;</div>
		<div class="row jumbotron">
			<div class="col">
				<img src="Imagens/log_in.png">
			</div>
			<div class="col">
				&nbsp;
				<div class="col">
					<div class="login-form">
						<form action="index.jsp" method="post">
							<h2 class="text-center">Login</h2>
							<div class="form-group">
								<input type="text" name="email" class="form-control"
									placeholder="E-mail" required="required">
							</div>
							<div class="form-group">
								<input type="password" name="senha" class="form-control"
									placeholder="Senha" required="required">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-block">Log
									in</button>
							</div>
							<div class="clearfix">
								<label class="pull-left checkbox-inline"><input
									type="checkbox"> Lembrar senha</label>
							</div>
						</form>
						<p class="text-center">
							<a href="#" class="pull-right">Esqueceu sua senha?</a>
						</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
