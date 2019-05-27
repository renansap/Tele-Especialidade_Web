/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aplicacao;

import java.util.ArrayList;
import java.util.List;

import CRUD.ConselhoCRUD;
import CRUD.EspecialidadeCRUD;
import CRUD.PacienteCRUD;
import CRUD.UsuarioCRUD;

/**
 *
 * @author Martini
 */
public class Conselho {
    int cd_conselho;
    String ds_conselho;
    String ds_sigla_conselho;




	public int getCd_conselho() {
        return cd_conselho;
    }

    public void setCd_conselho(int cd_conselho) {
        this.cd_conselho = cd_conselho;
    }

    public String getDs_conselho() {
        return ds_conselho;
    }

    public void setDs_conselho(String ds_conselho) {
        this.ds_conselho = ds_conselho;
    }

    public String getDs_sigla_conselho() {
        return ds_sigla_conselho;
    }

    public void setDs_sigla_conselho(String ds_sigla_conselho) {
        this.ds_sigla_conselho = ds_sigla_conselho;
    }
    
    public List busca() throws Exception{
		ConselhoCRUD cc = new ConselhoCRUD();
		return cc.buscar();
	}
    
	public boolean InsertConselho(Conselho c) throws Exception{
        
    	ConselhoCRUD cn = new ConselhoCRUD();
    	System.out.println("Entrou ak insert conselho6");
        
        if(cn.adicionar(c)){
            return true;
        }else{
            return false;
        }
    }

    public boolean DeleteConselho(Conselho c) throws Exception{
    	ConselhoCRUD cn = new ConselhoCRUD();
    	 
        if(cn.remover(c)){
            return true;
        }else{
            return false;
        }
    }
    public boolean UpdateConselho(Conselho c) throws Exception{
        
    	ConselhoCRUD cn1 = new ConselhoCRUD();
        
        if(cn1.atualizar(c)){
            return true;
        }else{
            return false;
        }
    }
    
}
