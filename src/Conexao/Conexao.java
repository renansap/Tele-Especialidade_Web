//Nome do nosso pacote //                
 
package Conexao;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class Conexao {
 
             public static String status = "Não conectou...";
 
        public Conexao() {
        }
 
  
 
//Método de Conexão//
 
public static java.sql.Connection getConexaoMySQL() {

    Connection connection = null;          //atributo do tipo Connection
 
    try {
    // Carregando o JDBC Driver padrão
        String driverName = "com.mysql.jdbc.Driver";                        
        Class.forName(driverName);
 
// Configurando a nossa conexão com um banco de dados//
            String serverName = "jj820qt5lpu6krut.cbetxkdyhwsb.us-east-1.rds.amazonaws.com";    //caminho do servidor do BD
            String mydatabase = "bcu3t22pgyvqha87";        //nome do seu banco de dados
            String url = "jdbc:mysql://" + serverName + "/" + mydatabase;
            //mysql://r6fk5scsso46rxcn:sx9oeelz1f2j2rp7@jj820qt5lpu6krut.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/bcu3t22pgyvqha87
            String username = "r6fk5scsso46rxcn"; //nome de um usuário de seu BD      
            String password = "sx9oeelz1f2j2rp7";      //sua senha de acesso
            connection = (Connection) DriverManager.getConnection(url, username, password);

            //Testa sua conexão//  
 
            if (connection != null) {
                status = ("STATUS--->Conectado com sucesso!");
            } else {
                status = ("STATUS--->Não foi possivel realizar conexão");
            }
            return connection;
 
        } catch (ClassNotFoundException e) {  //Driver não encontrado
             System.out.println("O driver expecificado nao foi encontrado.");
             return null;
        } catch (SQLException e) {
            System.out.println("Nao foi possivel conectar ao Banco de Dados."); 
            return null;
        }
    }
 
    //Método que retorna o status da sua conexão//
 
    public static String statusConection() {
        return status;
    }
 
   //Método que fecha sua conexão//
 
    public static boolean FecharConexao() {
        try {
            Conexao.getConexaoMySQL().close();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
 
   //Método que reinicia sua conexão//
 
    public static java.sql.Connection ReiniciarConexao() {
        FecharConexao();
        return Conexao.getConexaoMySQL();
    }
 
}