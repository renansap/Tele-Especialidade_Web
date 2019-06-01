/**
 * 
 */
package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Aplicacao.Conselho;
import Aplicacao.Especialidade;
import Aplicacao.Usuario;
import Conexao.Conexao;

/**
 * @author renan
 *
 */
public class ConselhoCRUD {

	/**
	 * 
	 */
	public List<Conselho> buscar() throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM CONSELHO");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		/* Mapeamento objeto relacional */
		PreparedStatement comando = conn.prepareStatement(sql.toString());
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");

		System.out.println(comando);

		/* Executa a SQL e captura o resultado da consulta */
		ResultSet resultado = comando.executeQuery();

		/* Cria uma lista para armazenar o resultado da consulta */
		List<Conselho> listaConselho = new ArrayList<Conselho>();
		// TODO Auto-generated constructor stub

		while (resultado.next()) {
			/* Cria um objeto para armazenar uma linha da consulta */
			Conselho linha = new Conselho();
			// .setDs_nome(resultado.getString("ds_nome")); //ID Especialidade Conselho
			// Ativo
			linha.setCd_conselho(resultado.getInt("CD_CONSELHO"));
			linha.setDs_conselho(resultado.getString("DS_CONSELHO"));
			linha.setDs_sigla_conselho(resultado.getString("DS_SIGLA_CONSELHO"));
			// linha.setSn_ativo(resultado.getString("SN_ATIVO"));
			/* Armazena a linha lida em uma lista */
			listaConselho.add(linha);
		}

		/* Fecha a conexão */
		resultado.close();
		comando.close();
		conn.close();

		/* Retorna a lista contendo o resultado da consulta */
		return listaConselho;
	}

	public boolean adicionar(Conselho cn) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("insert into CONSELHO");
		sql.append(
				" (DS_CONSELHO, DS_SIGLA_CONSELHO) values (");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		//System.out.println("Senha; " + u.getSenha());
		System.out.println("Entrou ak insert conselho");

		sql.append("\'");
		sql.append(cn.getDs_conselho());
		sql.append("\', \'");
		sql.append(cn.getDs_sigla_conselho());
		sql.append("\');");
		

		/* Mapeamento objeto relacional */
		Statement st = conn.createStatement();
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");
		System.out.println("Entrou ak insert conselho1");
		System.out.println(sql.toString());
		System.out.println("Entrou ak insert conselho2");

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();

		return true;
	}

	public boolean remover(Conselho c) throws Exception {
		
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("delete from CONSELHO");
		sql.append(" where cd_conselho ='");
		//sql.append("42");
		sql.append(c.getCd_conselho());
		sql.append("';");
		System.out.println("cod =" + c.getCd_conselho());		
		
		Connection conn = Conexao.getConexaoMySQL();
		
		Statement st = conn.createStatement();

		System.out.println(sql.toString());
		System.out.println("Entrou ak insert conselho");

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();

		return true;
	}

	public boolean atualizar(Conselho c) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update CONSELHO set");
		//sql.append(
				//" (ds_nome, dt_nascimento, idade, cd_especialidade, nr_conselho, email, telefone, sexo, senha) values (");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		
		sql.append(" ds_conselho = \'");
		sql.append(c.getDs_conselho());
		sql.append("\' where cd_especialidade = \'");
		sql.append(c.getCd_conselho());
		sql.append("\'");

		/* Mapeamento objeto relacional */
		Statement st = conn.createStatement();
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");

		System.out.println(sql.toString());
		System.out.println("Entrou ak insert conselho");

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();
		
		return true;
	}
	
	public Conselho buscaConselho(String codConselho) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM CONSELHO where cd_conselho = \'");
		sql.append(codConselho);
		sql.append("\';");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		/* Mapeamento objeto relacional */
		PreparedStatement comando = conn.prepareStatement(sql.toString());
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");

		System.out.println(comando);

		/* Executa a SQL e captura o resultado da consulta */
		ResultSet resultado = comando.executeQuery();

		/* Cria uma lista para armazenar o resultado da consulta */
		
		Conselho linha = new Conselho();
		while (resultado.next()) {
			/* Cria um objeto para armazenar uma linha da consulta */
			
			// .setDs_nome(resultado.getString("ds_nome")); //ID Especialidade Conselho
			// Ativo
			linha.setCd_conselho(resultado.getInt("CD_CONSELHO"));
			linha.setDs_conselho(resultado.getString("DS_CONSELHO"));
			linha.setDs_sigla_conselho(resultado.getString("DS_SIGLA_CONSELHO"));
			// linha.setSn_ativo(resultado.getString("SN_ATIVO"));
			/* Armazena a linha lida em uma lista */
			
		}

		/* Fecha a conexão */
		resultado.close();
		comando.close();
		conn.close();

		/* Retorna a lista contendo o resultado da consulta */
		return linha;
	}

}
