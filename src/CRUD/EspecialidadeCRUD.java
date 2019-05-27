/**
 * 
 */
package CRUD;

import Aplicacao.Especialidade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Aplicacao.Usuario;
import Conexao.Conexao;

/**
 * @author renan
 *
 */
public class EspecialidadeCRUD {

	/**
	 * 
	 */

	public List<Especialidade> buscar() throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM ESPECIALIDADE");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		/* Mapeamento objeto relacional */
		PreparedStatement comando = conn.prepareStatement(sql.toString());
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");

		System.out.println(comando);

		/* Executa a SQL e captura o resultado da consulta */
		ResultSet resultado = comando.executeQuery();

		/* Cria uma lista para armazenar o resultado da consulta */
		List<Especialidade> listaEspecialidade = new ArrayList<Especialidade>();
		// TODO Auto-generated constructor stub

		while (resultado.next()) {
			/* Cria um objeto para armazenar uma linha da consulta */
			Especialidade linha = new Especialidade();
			// .setDs_nome(resultado.getString("ds_nome")); //ID Especialidade Conselho
			// Ativo
			linha.setCd_especialidade(resultado.getString("CD_ESPECIALIDADE"));
			linha.setDs_especialidade(resultado.getString("DS_ESPECIALIDADE"));
			linha.setCd_conselho(resultado.getInt("CD_CONSELHO"));
			linha.setSn_ativo(resultado.getString("SN_ATIVO"));
			/* Armazena a linha lida em uma lista */
			listaEspecialidade.add(linha);
		}

		/* Fecha a conexão */
		resultado.close();
		comando.close();
		conn.close();
		
		/* Retorna a lista contendo o resultado da consulta */
		return listaEspecialidade;

	}
	
//	Adiciona Nova especialidade
	
	public boolean adicionar(Especialidade e) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO ESPECIALIDADE");
		sql.append(
				" (DS_ESPECIALIDADE, CD_CONSELHO,SN_ATIVO) values (");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		sql.append("\'");
		sql.append(e.getDs_especialidade());
		sql.append("\', \'");
		sql.append(e.getCd_conselho());
		sql.append("\', \'");
		sql.append(e.getSn_ativo());
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
	
	public boolean atualizar(Especialidade e) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update ESPECIALIDADE set");
		//sql.append(
				//" (ds_nome, dt_nascimento, idade, cd_especialidade, nr_conselho, email, telefone, sexo, senha) values (");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		
		sql.append(" ds_especialidade = \'");
		sql.append(e.getDs_especialidade());
		sql.append("\' where cd_especialidade = \'");
		sql.append(e.getCd_especialidade());
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


}
