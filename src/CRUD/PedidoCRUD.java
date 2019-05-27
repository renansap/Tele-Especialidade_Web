package CRUD;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Aplicacao.Especialidade;
import Aplicacao.Paciente;
import Aplicacao.Pedido;
import Conexao.Conexao;

public class PedidoCRUD {

	public List<Pedido> buscar() throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT P.CD_PEDIDO, P.CD_PACIENTE, P.CD_DIAGNOSTICO, P.DS_OBSERVACAO, P.CD_USUARIO, P.CD_DATA_HR, P.CD_STATUS, P.DS_RESPOSTA, D.CD_DIAGNOSTICO, D.DS_DIAGNOSTICO, D.CD_ESPECIALIDADE, D.VALOR, E.DS_ESPECIALIDADE, PA.CD_PACIENTE, PA.NM_PACIENTE, PA.DT_NASCIMENTO, PA.SEXO, PA.ALTURA, PA.PESO, U.DS_NOME\r\n");
		sql.append("FROM PEDIDO P JOIN DIAGNOSTICO D ON D.CD_DIAGNOSTICO = P.CD_DIAGNOSTICO JOIN ESPECIALIDADE E ON E.CD_ESPECIALIDADE = D.CD_ESPECIALIDADE JOIN PACIENTE PA ON P.CD_PACIENTE = PA.CD_PACIENTE JOIN USUARIO U ON P.CD_USUARIO = U.CD_USUARIO ORDER BY CD_data_hr DESC");
		
		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		/* Mapeamento objeto relacional */
		PreparedStatement comando = conn.prepareStatement(sql.toString());
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");

		System.out.println(comando);

		/* Executa a SQL e captura o resultado da consulta */
		ResultSet resultado = comando.executeQuery();

		/* Cria uma lista para armazenar o resultado da consulta */
		List<Pedido> listaPedido = new ArrayList<Pedido>();
		// TODO Auto-generated constructor stub

		while (resultado.next()) {
			/* Cria um objeto para armazenar uma linha da consulta */
			Pedido linha = new Pedido();
			linha.setCd_pedido(resultado.getString("CD_PEDIDO"));
			linha.setCd_paciente(resultado.getString("CD_PACIENTE"));
			linha.setCd_diagnostico(resultado.getString("CD_DIAGNOSTICO"));
			linha.setDs_observacao(resultado.getString("DS_OBSERVACAO"));
			linha.setCd_usuario(resultado.getString("CD_USUARIO"));
			linha.setCd_data_hr(resultado.getDate("CD_DATA_HR").toString());
			linha.setCd_hr_data(resultado.getTime("CD_DATA_HR").toString());
			linha.setCd_status(resultado.getString("CD_STATUS"));
			linha.setDs_resposta(resultado.getString("DS_RESPOSTA"));
			linha.setDs_diagnostico(resultado.getString("DS_RESPOSTA"));
			linha.setCd_especialidade(resultado.getString("CD_ESPECIALIDADE"));
			linha.setValor(resultado.getFloat("VALOR"));
			linha.setDs_especialidade(resultado.getString("DS_ESPECIALIDADE"));
			linha.setNm_paciente(resultado.getString("NM_PACIENTE"));
			linha.setDt_nascimento(resultado.getString("DT_NASCIMENTO"));
			linha.setSexo(resultado.getString("SEXO"));
			linha.setPeso(resultado.getString("PESO"));
			linha.setAltura(resultado.getString("ALTURA"));
			linha.setDs_nome(resultado.getString("DS_NOME"));
		    
			
			/* Armazena a linha lida em uma lista */
			listaPedido.add(linha);
		}

		/* Fecha a conexão */
		resultado.close();
		comando.close();
		conn.close();
		
		/* Retorna a lista contendo o resultado da consulta */
		return listaPedido;

	}

	public boolean adicionar(Pedido p) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO PEDIDO");
		sql.append(
				" (CD_PACIENTE, CD_DIAGNOSTICO, DS_OBSERVACAO, CD_USUARIO, CD_STATUS, CD_ANEXO) values (");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();
		
		sql.append("\'");
		sql.append(p.getCd_paciente());
		sql.append("\', \'");
		sql.append(p.getCd_diagnostico());
		sql.append("\', \'");
		sql.append(p.getDs_diagnostico());
		sql.append("\', \'");
		sql.append(p.getCd_usuario());
		sql.append("\', \'");
		sql.append(p.getCd_status());
		sql.append("\', \'");
		sql.append("0");
		sql.append("\');");

		/* Mapeamento objeto relacional */
		Statement st = conn.createStatement();
		 //comando.setString(1, "%" + u.getCd_usuario()+ "%");
		
		 
		System.out.println(sql.toString());

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();

		return true;
	}
	
	public boolean remover(Especialidade e) throws Exception {
		
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("delete from ESPECIALIDADE");
		sql.append(" where cd_especialidade ='");
		//sql.append("42");
		sql.append(e.getCd_especialidade());
		sql.append("';");
		System.out.println("cod =" + e.getCd_especialidade());		
		
		Connection conn = Conexao.getConexaoMySQL();
		
		Statement st = conn.createStatement();

		System.out.println(sql.toString());

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();

		return true;
	}
	
	public boolean atualizar(Pedido p) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update PEDIDO set ");
	
		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		sql.append(" CD_PACIENTE = \'");
		sql.append(p.getCd_paciente());
		sql.append("\', CD_DIAGNOSTICO = \'");
		sql.append(p.getCd_diagnostico());
		sql.append("\', DS_OBSERVACAO = \'");
		sql.append(p.getDs_diagnostico());
		sql.append("\', CD_USUARIO = \'");
		sql.append(p.getCd_usuario());
		sql.append("\', CD_STATUS = \'");
		sql.append(p.getCd_status());
		sql.append("\' where CD_PEDIDO = \'");
		sql.append(p.getCd_pedido());
		sql.append("\'");

		/* Mapeamento objeto relacional */
		Statement st = conn.createStatement();
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");

		System.out.println(sql.toString());

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();
		
		return true;
	}
	
	private String getDateTime() { 
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
		Date date = new Date(); 
		return dateFormat.format(date); 
	}
	
	public String getCodUltimoPedido() throws SQLException {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("select max(cd_pedido) as CD_PEDIDO from PEDIDO");
		
		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		/* Mapeamento objeto relacional */
		PreparedStatement comando = conn.prepareStatement(sql.toString());
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");

		/* Executa a SQL e captura o resultado da consulta */
		ResultSet resultado = comando.executeQuery();
		String cod = null;

		// TODO Auto-generated constructor stub

		while (resultado.next()) {
			/* Cria um objeto para armazenar uma linha da consulta */
			Pedido linha = new Pedido();
			cod =  resultado.getString("CD_PEDIDO");
			System.out.println("cod pedido:" + resultado.getString("CD_PEDIDO"));
		}

		/* Fecha a conexão */
		resultado.close();
		comando.close();
		conn.close();
		
		/* Retorna a lista contendo o resultado da consulta */
		return cod;

	}

}
