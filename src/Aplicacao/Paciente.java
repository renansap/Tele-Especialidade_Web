/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aplicacao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import CRUD.PacienteCRUD;
import CRUD.UsuarioCRUD;

/**
 *
 * @author Renan
 */
public class Paciente {
    int cd_paciente;
    String nm_paciente;
    String dt_nascimento;
    String idade;
    String sexo;
    String altura;
    String peso;

    public int getCd_paciente() {
        return cd_paciente;
    }

    public void setCd_paciente(int cd_paciente) {
        this.cd_paciente = cd_paciente;
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

    public String getIdade() {
        return idade;
    }

    public void setIdade(String idade) {
        this.idade = idade;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getAltura() {
        return altura;
    }

    public void setAltura(String altura) {
        this.altura = altura;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public List BuscaPaciente() throws Exception{
		PacienteCRUD pc = new PacienteCRUD();
		return pc.buscar();
	}
    
    public boolean InsertPaciente(Paciente p) throws Exception{
        
        PacienteCRUD pa = new PacienteCRUD();
        
        
        if(pa.adicionar(p)){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean UpdatePaciente(Paciente p) throws Exception{
        
        PacienteCRUD pc = new PacienteCRUD();
        
        if(pc.atualizar(p)){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean DeletePaciente(Paciente p) throws Exception {
    	PacienteCRUD pcd = new PacienteCRUD();
    	if(pcd.remover(p)) {
    		return true;
    	}else {
    		return false;
    	}
    }
    
    
    
}
