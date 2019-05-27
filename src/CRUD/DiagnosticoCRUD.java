package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Aplicacao.Diagnostico;
import Conexao.Conexao;

public class DiagnosticoCRUD {

	public boolean atualizar(Diagnostico d) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("update DIAGNOSTICO set");
		Connection conn = Conexao.getConexaoMySQL();

		
		sql.append("\' ds_diagnostico = \'");
		sql.append(d.getDs_diagnostico());
		sql.append("\' and cd_especialidade = \'");
		sql.append(d.getCd_especialidade());
		sql.append("\' and valor = \'");
		sql.append(d.getValor());
				
		sql.append("\' where cd_diagnostico = \'");
		sql.append(d.getCd_diagnostico());
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

	
	public List<Diagnostico> buscar() throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("FROM DIAGNOSTICO ORDER BY CD_DIAGNOSTICO DESC");
		

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();
		
		/* Mapeamento objeto relacional */
		PreparedStatement comando = conn.prepareStatement(sql.toString());
		// comando.setString(1, "%" + u.getCd_usuario()+ "%");

		/* Executa a SQL e captura o resultado da consulta */
		ResultSet resultado = comando.executeQuery();

		/* Cria uma lista para armazenar o resultado da consulta */
		List<Diagnostico> lista = new ArrayList<Diagnostico>();

		/* Percorre o resultado armazenando os valores em uma lista */
		while (resultado.next()) {
			/* Cria um objeto para armazenar uma linha da consulta */
			Diagnostico linha = new Diagnostico();
			linha.setCd_diagnostico(resultado.getInt("cd_diagnostico"));
			linha.setDs_diagnostico(resultado.getString("ds_diagnostico"));
			linha.setCd_especialidade(resultado.getString("cd_especialidade"));
			linha.setValor(resultado.getFloat("valor"));
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

	public boolean adicionar(Diagnostico u) throws Exception {
		/* Define a SQL */
		StringBuilder sql = new StringBuilder();
		sql.append("insert into DIAGNOSTICO");
		sql.append(
				" (cd_especialidade, ds_diagnostico, ds_quadro, valor, assunto) values (");

		/* Abre a conexão que criamos o retorno é armazenado na variavel conn */
		Connection conn = Conexao.getConexaoMySQL();


		sql.append("\'");
		sql.append(u.getCd_especialidade());
		sql.append("\', \'");
		sql.append(u.getDs_diagnostico());
		sql.append("\', \'");
		sql.append(u.getValor());
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
	
	public int getDiagnosticoByDescricao(Diagnostico d) throws Exception{
		List<Diagnostico> lista = buscar();
		
		for(int i=0;i<lista.size();i++){
			if(lista.get(i).getDs_diagnostico().equals(d.getDs_diagnostico())){
				return lista.get(i).getCd_diagnostico();
			}
		}
		return 0;
	}
		
}
