/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aplicacao;

import java.util.ArrayList;
import java.util.List;

import CRUD.EspecialidadeCRUD;
import CRUD.UsuarioCRUD;

/**
 *
 * @author Martini
 */
public class Especialidade {
    String cd_especialidade;
    String ds_especialidade;    
    String cd_conselho;
    String sn_ativo;

    public String getCd_especialidade() {
        return cd_especialidade;
    }


	public void setCd_especialidade(String cd_especialidade) {
        this.cd_especialidade = cd_especialidade;
    }

    public String getDs_especialidade() {
        return ds_especialidade;
    }

    public void setDs_especialidade(String ds_especialidade) {
        this.ds_especialidade = ds_especialidade;
    }


    public String getCd_conselho() {
    	//cd_conselho = (Integer) null;
        return cd_conselho;
    }

    public void setCd_conselho(String cd_conselho) {
        this.cd_conselho = cd_conselho;
    }

    public String getSn_ativo() {
        return sn_ativo;
    }

    public void setSn_ativo(String sn_ativo) {
		this.sn_ativo = sn_ativo;
	}
    
    public boolean InsertEspecialidade(Especialidade e) throws Exception{
        
        EspecialidadeCRUD es = new EspecialidadeCRUD();
        
        
        if(es.adicionar(e)){
            return true;
        }else{
            return false;
        }
    }
    
    public List<Especialidade> BuscaEspecialidades() throws Exception{
        
        EspecialidadeCRUD es = new EspecialidadeCRUD();
        
        return es.buscar();
    }
    
    public boolean DeleteEspecialidade(Especialidade e) throws Exception{
    	EspecialidadeCRUD es = new EspecialidadeCRUD();
    	 
        if(es.remover(e)){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean UpdateEspecialidade(Especialidade e) throws Exception{
        
        EspecialidadeCRUD ec1 = new EspecialidadeCRUD();
        
        if(ec1.atualizar(e)){
            return true;
        }else{
            return false;
        }
    }
    
    public String getEspecialidadeByDescricao(Especialidade e) throws Exception{
    	EspecialidadeCRUD ec = new EspecialidadeCRUD();
    
        List<Especialidade> lista = new ArrayList<Especialidade>();
    	lista = ec.buscar();
    	
    	for(int i=0;i<lista.size();i++) {
    		if(e.getDs_especialidade().equals(lista.get(i).getDs_especialidade())) {
    			return lista.get(i).getCd_especialidade();
    		}
    	}
        
        return "0";
    }
    
    public String getEspecialidadeByCd_especialidade(Especialidade e) throws Exception{
    	EspecialidadeCRUD ec = new EspecialidadeCRUD();
    
        List<Especialidade> lista = new ArrayList<Especialidade>();
    	lista = ec.buscar();
    	
    	for(int i=0;i<lista.size();i++) {
    		if(e.getCd_especialidade().equals(lista.get(i).getCd_especialidade())) {
    			return lista.get(i).getDs_especialidade();
    		}
    	}
        
        return "0";
    }
    
}
   
    
    

