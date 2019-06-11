/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUD;

import Aplicacao.Usuario;
import Conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Martini
 */
public class UsuarioCRUD {

	public boolean atualizar(Usuario u) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update USUARIO set");
		Connection conn = Conexao.getConexaoMySQL();

		
		sql.append(" ds_nome = \'");
		sql.append(u.getDs_nome());
		sql.append("\' and dt_nascimento = \'");
		sql.append(formatDate(u.getDt_nascimento()));
		sql.append("\' and idade = \'");
		sql.append(u.getIdade());
		sql.append("\' and cd_especialidade = \'");
		sql.append(u.getCd_especialidade());
		sql.append("\' and nr_conselho = \'");
		sql.append(u.getNr_conselho());
		sql.append("\' and email = \'");
		sql.append(u.getEmail());
		sql.append("\' and telefone = \'");
		sql.append(u.getTelefone());
		sql.append("\' and sexo = \'");
		sql.append(u.getSexo());
		sql.append("\' and senha = \'");
		sql.append(u.getSenha());
				
		sql.append("\' where cd_usuario = \'");
		sql.append(u.getCd_usuario());
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
	
	
	private String formatDate(String datanasc) {
		String array[] = new String[3];
		array = datanasc.split("/");
		return array[2]+"/"+array[1]+"/"+array[0];
	}
	
	private String formatDatefromDatabase(String datanasc) {
		String array[] = new String[3];
		array = datanasc.split("-");
		return array[2]+"/"+array[1]+"/"+array[0];
	}



	
	public List<Usuario> buscar() throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM USUARIO");
		

     	/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();


      	
		/* Mapeamento objeto relacional */
		PreparedStatement comando = conn.prepareStatement(sql.toString());
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");



		/* Executa a SQL e captura o resultado da consulta */
		ResultSet resultado = comando.executeQuery();

		/* Cria uma lista para armazenar o resultado da consulta */
		List<Usuario> lista = new ArrayList<Usuario>();

		/* Percorre o resultado armazenando os valores em uma lista */
		while (resultado.next()) {
			/* Cria um objeto para armazenar uma linha da consulta */
			Usuario linha = new Usuario();
			linha.setCd_usuario(resultado.getInt("cd_usuario"));
			linha.setDs_nome(resultado.getString("ds_nome"));
			linha.setDt_nascimento(formatDatefromDatabase(resultado.getString("dt_nascimento")));
			linha.setIdade(resultado.getInt("idade"));
			linha.setCd_especialidade(resultado.getString("cd_especialidade"));
			linha.setNr_conselho(resultado.getInt("nr_conselho"));
			linha.setEmail(resultado.getString("email"));
			linha.setTelefone(resultado.getString("telefone"));
			linha.setSexo(resultado.getString("sexo"));
			linha.setSenha(resultado.getString("senha"));
			/* Armazena a linha lida em uma lista */
			lista.add(linha);
		}
		
	
		/* Fecha a conexão */
		resultado.close();
		comando.close();
		conn.close();

		/* Retorna a lista contendo o resultado da consulta */
		return lista;
	}

	public boolean adicionar(Usuario u) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("insert into USUARIO");
		sql.append(
				" (ds_nome, dt_nascimento, idade, cd_especialidade, nr_conselho, email, telefone, sexo, senha) values (");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();


		sql.append("\'");
		sql.append(u.getDs_nome());
		sql.append("\', \'");
		sql.append(formatDate(u.getDt_nascimento()));
		sql.append("\', \'");
		sql.append(u.getIdade());
		sql.append("\', \'");
		sql.append(u.getCd_especialidade());
		sql.append("\', \'");
		sql.append(u.getNr_conselho());
		sql.append("\', \'");
		sql.append(u.getEmail());
		sql.append("\', \'");
		sql.append(u.getTelefone());
		sql.append("\', \'");
		sql.append(u.getSexo());
		sql.append("\', \'");
		sql.append(u.getSenha());
		sql.append("\');");

		/* Mapeamento objeto relacional */
		Statement st = conn.createStatement();
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");

		System.out.println(sql.toString());

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();
		
		return true;
	}
	
	public boolean remover(Usuario u) throws Exception {
		System.out.println("cod =" + u.getCd_usuario());
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("delete from USUARIO");
		sql.append(" where cd_usuario ='");
		//sql.append("42");
		sql.append(u.getCd_usuario());
		sql.append("';");
		System.out.println("cod =" + u.getCd_usuario());		
		
		Connection conn = Conexao.getConexaoMySQL();
		
		System.out.println("cod =" + u.getCd_usuario());
		
		Statement st = conn.createStatement();

		System.out.println(sql.toString());

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();

		return true;
	}
}
