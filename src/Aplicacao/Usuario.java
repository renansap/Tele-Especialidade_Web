/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Aplicacao;

import CRUD.UsuarioCRUD;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Martini
 */
public class Usuario {
    int cd_usuario;
    String ds_nome;
    String dt_nascimento;
    int idade;
    int cd_especialidade;
    int nr_conselho;
    String email;
    String telefone;
    String sexo;
    String senha;
    Cookie emailCookie = new Cookie("Senha", "Senha");
    Cookie senhaCookie = new Cookie("Senha", "Senha");

    public int getCd_usuario() {
        return cd_usuario;
    }

    public void setCd_usuario(int cd_usuario) {
        this.cd_usuario = cd_usuario;
    }

    public String getDs_nome() {
        return ds_nome;
    }

    public void setDs_nome(String ds_nome) {
        this.ds_nome = ds_nome;
    }

    public String getDt_nascimento() {
        return dt_nascimento;
    }

    public void setDt_nascimento(String dt_nascimento) {
        this.dt_nascimento = dt_nascimento;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public int getCd_especialidade() {
        return cd_especialidade;
    }

    public void setCd_especialidade(int cd_especialidade) {
        this.cd_especialidade = cd_especialidade;
    }

    public int getNr_conselho() {
        return nr_conselho;
    }

    public void setNr_conselho(int nr_conselho) {
        this.nr_conselho = nr_conselho;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    
    public String getSenha(){
        return senha;
    }
    
    public void setSenha(String senha){
        this.senha = senha;
    }
    
    public boolean validaLogin(String email, String senha) throws Exception{
        UsuarioCRUD u = new UsuarioCRUD();
        List<Usuario> lista = new ArrayList<Usuario>();
		

        try{
            lista = u.buscar();
        }catch(Exception E){
            System.out.println(E);
        }
        for(int i=0;i<lista.size();i++){
        	System.out.println("email: "+ lista.get(i).getEmail()+ "Senha: " + lista.get(i).getSenha());
            if(lista.get(i).getEmail().equals(email)){
                if(lista.get(i).getSenha().equals(senha)){
                    return true;
                }
            }
        }
        return false;
    }
    
    public boolean InsertUsuario(Usuario u) throws Exception{
                
        UsuarioCRUD uc = new UsuarioCRUD();
        
        
        if(uc.adicionar(u)){
            return true;
        }else{
            return false;
        }
    }

    public boolean UpdateUsuario(Usuario u) throws Exception{
        
        UsuarioCRUD uc1 = new UsuarioCRUD();
        
        if(uc1.atualizar(u)){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean DeleteUsuario(Usuario u) throws Exception {
    	UsuarioCRUD uc2 = new UsuarioCRUD();
    	if(uc2.remover(u)) {
    		return true;
    	}else {
    		return false;
    	}
    }
    
    public void enviaCookieUsuario(String senha, String email, String codigo, HttpServletResponse response){ 
    	if(email != null && email.length()>0 ){ 
    		Cookie cookieEmail = new Cookie("email", email); 
    		Cookie cookieSenha = new Cookie("senha", senha); 
    		Cookie cookieCodigo = new Cookie("codigo", codigo);
    		cookieEmail.setMaxAge(60*60*24*360); 
    		cookieSenha.setMaxAge(60*60*24*360); 
    		cookieCodigo.setMaxAge(60*60*24*360); 
    		response.addCookie(cookieEmail); 
    		response.addCookie(cookieSenha);
    		response.addCookie(cookieCodigo);
    	} 
    }
    
    public String getCd_usuarioByEmail(String email) {
    	
    	UsuarioCRUD uc = new UsuarioCRUD();
    	
        List<Usuario> lista = new ArrayList<Usuario>();

        try{
            lista = uc.buscar();
        }catch(Exception E){
            System.out.println(E);
        }
        for(int i=0;i<lista.size();i++){
        	if(lista.get(i).getEmail().equals(email)){
                return String.valueOf(lista.get(i).getCd_usuario());
            }
        }
        return "";

    	
    }
   
}
