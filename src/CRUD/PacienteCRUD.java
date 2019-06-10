/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUD;

import Aplicacao.Usuario;
import Aplicacao.Paciente;
import Aplicacao.Pedido;
import Conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Renan
 */
public class PacienteCRUD {

	public boolean atualizar(Paciente p) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update PACIENTE set");
		Connection conn = Conexao.getConexaoMySQL();

		sql.append(" NM_PACIENTE = \'");
		sql.append(p.getNm_paciente());
		sql.append("\'DT_NASCIMENTO = \'");
		sql.append(p.getDt_nascimento());
		sql.append("\'SEXO = \'");
		sql.append(p.getSexo());
		sql.append("\'ALTURA = \'");
		sql.append(p.getAltura());
				
		sql.append("\' where cd_paciente = \'");
		sql.append(p.getCd_paciente());
		sql.append("\'");

		/* Mapeamento objeto relacional */
		Statement st = conn.createStatement();
		// comando.setString(1, "%" + u.getCd_Paciente()+ "%");

		System.out.println(sql.toString());

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();
		
		return true;
	}

	
	public List<Paciente> buscar() throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM PACIENTE");
		

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();

		/* Mapeamento objeto relacional */
		PreparedStatement comando = conn.prepareStatement(sql.toString());
		// comando.setString(1, "%" + u.getCd_Paciente()+ "%");

		/* Executa a SQL e captura o resultado da consulta */
		ResultSet resultado = comando.executeQuery();

		/* Cria uma lista para armazenar o resultado da consulta */
		List<Paciente> lista = new ArrayList<Paciente>();

		/* Percorre o resultado armazenando os valores em uma lista */
		while (resultado.next()) {
			/* Cria um objeto para armazenar uma linha da consulta */
			Paciente linha = new Paciente();
			linha.setCd_paciente(resultado.getInt("cd_Paciente"));
			linha.setDt_nascimento(resultado.getString("dt_nascimento"));
			linha.setSexo(resultado.getString("sexo"));
			linha.setAltura(resultado.getString("altura"));
			linha.setPeso(resultado.getString("peso"));
			linha.setNm_paciente(resultado.getString("NM_PACIENTE"));

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

	public boolean adicionar(Paciente p) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("insert into PACIENTE");
		sql.append(
				"(NM_PACIENTE, DT_NASCIMENTO, SEXO, ALTURA) values (");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();


		sql.append("\'");
		sql.append(p.getNm_paciente());
		sql.append("\', \'");
		sql.append(p.getDt_nascimento());
		sql.append("\', \'");
		sql.append(p.getSexo());
		sql.append("\', \'");
		sql.append(p.getAltura());
		sql.append("\');");

		/* Mapeamento objeto relacional */
		Statement st = conn.createStatement();
	

		System.out.println(sql.toString());

		st.executeUpdate(sql.toString());

		st.close();
		conn.close();
		
		return true;
	}
	
	public boolean remover(Paciente p) throws Exception {
		
		List<Pedido> pedidos = new ArrayList();
		Pedido pe = new Pedido();
		
		pedidos = pe.BuscaPedido();
		
		for(int i=0;i<pedidos.size();i++) {
			System.out.println("pedido:" + pedidos.get(i).getCd_pedido());
			System.out.println(pedidos.get(i).getCd_paciente() + " = " + p.getCd_paciente());
			if(pedidos.get(i).getCd_paciente().equals(p.getCd_paciente())) {
				System.out.println("teste");
				return false;
			}
		}
		
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("delete from PACIENTE");
		sql.append(" where cd_paciente ='");
		//sql.append("42");
		sql.append(p.getCd_paciente());
		sql.append("';");
		System.out.println("cod =" + p.getCd_paciente());		
		
		Connection conn = Conexao.getConexaoMySQL();
		
		System.out.println("cod =" + p.getCd_paciente());
		
		Statement st = conn.createStatement();

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

}
