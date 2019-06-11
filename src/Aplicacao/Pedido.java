/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aplicacao;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.swing.JFileChooser;

import CRUD.DiagnosticoCRUD;
import CRUD.PedidoCRUD;
import Conexao.Conexao;

/**
 *
 * @author Martini
 */
public class Pedido {
    
	
	String cd_pedido;
	String cd_paciente;
	String cd_diagnostico;
	String ds_observacao;
	String cd_usuario;
	String cd_data_hr;
	String cd_hr_data;
	String cd_status;
	String ds_resposta;
    String ds_diagnostico;
    String cd_especialidade;
    float valor;
    String ds_especialidade;
    String nm_paciente;
    String dt_nascimento;
    String sexo;
    String peso;
    String altura;
    String ds_nome;
    String anexo;
	String urgente;    
    
    
	
	public String getUrgente() {
		return urgente;
	}

	public void setUrgente(String urgente) {
		this.urgente = urgente;
	}

   

	public String getAnexo() {
		return anexo;
	}

	public void setAnexo(String anexo) {
		this.anexo = anexo;
	}

	public String getCd_hr_data() {
		return cd_hr_data;
	}

	public void setCd_hr_data(String cd_hr_data) {
		this.cd_hr_data = cd_hr_data;
	}

	public String getCd_pedido() {
		return cd_pedido;
	}

	public void setCd_pedido(String cd_pedido) {
		this.cd_pedido = cd_pedido;
	}

	public String getCd_paciente() {
		return cd_paciente;
	}

	public void setCd_paciente(String cd_paciente) {
		this.cd_paciente = cd_paciente;
	}

	public String getCd_diagnostico() {
		return cd_diagnostico;
	}

	public void setCd_diagnostico(String cd_diagnostico) {
		this.cd_diagnostico = cd_diagnostico;
	}

	public String getDs_observacao() {
		return ds_observacao;
	}

	public void setDs_observacao(String ds_observacao) {
		this.ds_observacao = ds_observacao;
	}

	public String getCd_usuario() {
		return cd_usuario;
	}

	public void setCd_usuario(String cd_usuario) {
		this.cd_usuario = cd_usuario;
	}

	public String getCd_data_hr() {
		return cd_data_hr;
	}

	public void setCd_data_hr(String cd_data_hr) {
		this.cd_data_hr = cd_data_hr;
	}

	public String getCd_status() {
		return cd_status;
	}

	public void setCd_status(String cd_status) {
		this.cd_status = cd_status;
	}

	public String getDs_resposta() {
		return ds_resposta;
	}

	public void setDs_resposta(String ds_resposta) {
		this.ds_resposta = ds_resposta;
	}

	public String getDs_diagnostico() {
		return ds_diagnostico;
	}

	public void setDs_diagnostico(String ds_diagnostico) {
		this.ds_diagnostico = ds_diagnostico;
	}

	public String getCd_especialidade() {
		return cd_especialidade;
	}

	public void setCd_especialidade(String cd_especialidade) {
		this.cd_especialidade = cd_especialidade;
	}

	public float getValor() {
		return valor;
	}

	public void setValor(float valor) {
		this.valor = valor;
	}

	public String getDs_especialidade() {
		return ds_especialidade;
	}

	public void setDs_especialidade(String ds_especialidade) {
		this.ds_especialidade = ds_especialidade;
	}

	public String getNm_paciente() {
		return nm_paciente;
	}

	public void setNm_paciente(String nm_paciente) {
		this.nm_paciente = nm_paciente;
	}

	public String getDt_nascimento() {
		return dt_nascimento;
	}

	public void setDt_nascimento(String dt_nascimento) {
		this.dt_nascimento = dt_nascimento;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}

	public String getAltura() {
		return altura;
	}

	public void setAltura(String altura) {
		this.altura = altura;
	}

	public String getDs_nome() {
		return ds_nome;
	}

	public void setDs_nome(String ds_nome) {
		this.ds_nome = ds_nome;
	}

	public List<Pedido> BuscaPedido() throws Exception{
    	
		List<Pedido> lista = new ArrayList<Pedido>();
		PedidoCRUD pc = new PedidoCRUD();
		lista = pc.buscar();
		return lista;
    	
    }
    
    public boolean InsertPedido(Pedido p) throws Exception{
        
        PedidoCRUD pc = new PedidoCRUD();
        
        if(pc.adicionar(p)){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean UpdatePedido(Pedido p) throws Exception{
        
    	PedidoCRUD pc = new PedidoCRUD();
        
        if(pc.atualizar(p)){
            return true;
        }else{
            return false;
        }
    }
	
    public String getCodUltimoPedido() {
    	PedidoCRUD pc = new PedidoCRUD();
    	
    	try {
			return pc.getCodUltimoPedido();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return null;
    }
    
    public boolean UpdateImagemPedido(Pedido p) {
    	PedidoCRUD pc = new PedidoCRUD();
    	
    	try {
			return pc.UpdateImagemPedido(p);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
    	
    }
    
    public Pedido buscarPedido(Pedido p) {
    	PedidoCRUD pc = new PedidoCRUD();
    	
    	try {
			return pc.buscarPedido(p);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
    	
    }
    
    public boolean respondePedido(Pedido p) {
    	PedidoCRUD pc = new PedidoCRUD();
    	try {
    		return pc.respondePedido(p);
    	}catch(Exception e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public int solicitacoesPendentes() {
    	PedidoCRUD pc = new PedidoCRUD();
    	try {
    		return pc.solicitacoesPendentes();
    	}catch(Exception e) {
    		e.printStackTrace();
    		return 0;
    	}
    }
}
