/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aplicacao;

import java.util.ArrayList;
import java.util.List;

import CRUD.DiagnosticoCRUD;

/**
 *
 * @author Martini
 */
public class Diagnostico {
    
    int cd_diagnostico;
    String ds_diagnostico;
    String cd_especialidade;
    float valor;
    

	public int getCd_diagnostico() {
        return cd_diagnostico;
    }

    public void setCd_diagnostico(int cd_diagnostico) {
        this.cd_diagnostico = cd_diagnostico;
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
    
    public List<Diagnostico> BuscaDiagnostico() throws Exception{
    	
		List<Diagnostico> lista = new ArrayList<Diagnostico>();
		DiagnosticoCRUD dc = new DiagnosticoCRUD();
		lista = dc.buscar();
		return lista;
    	
    }
    
    public boolean InsertDiagnostico(Diagnostico d) throws Exception{
        
        DiagnosticoCRUD dc = new DiagnosticoCRUD();
        
        if(dc.adicionar(d)){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean UpdateDiagnostico(Diagnostico d) throws Exception{
        
        DiagnosticoCRUD dc = new DiagnosticoCRUD();
    	
        if(dc.atualizar(d)){
            return true;
        }else{
            return false;
        }
    }
    
}
