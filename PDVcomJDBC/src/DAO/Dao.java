package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
/**
 *
 * @author Clayton Garcia dos Santos Inácio
 * Mat: 2016101697
 */
public class Dao {    
    private final String endereco = "jdbc:mysql://localhost:3306/pdv";
    private final String usuario = "root";
    private final String senha = "root";
    private static Connection conn;
    
    
   public void conexaoUp() throws SQLException{
       conn = DriverManager.getConnection(endereco,usuario, senha );
   }
   public Connection conexao() throws SQLException{
       
       return conn;
   }
  
   
   public void conexao(boolean estado) throws SQLException{       
       if(estado){
           conn.setAutoCommit(true);
       }else{
           conn.setAutoCommit(false);
       }
   }
   
  
    public ResultSet busca(String query) throws SQLException {
       
       conexao();
       Statement st = conexao().createStatement();      
       ResultSet rs = st.executeQuery(query); 
       return rs;
      
    }
   

    public ResultSet buscaUnica(String query) throws SQLException {
       Statement st = conexao().createStatement();      
       ResultSet rs = st.executeQuery(query); 
       ResultSet rss = null;      
       if (rs.last()){
           return rs;
       }else{
           return rss; 
       }
             
    }
    
   public ResultSet buscaTudo(String tabela ) throws SQLException{
       Statement st = conexao().createStatement();      
       ResultSet rs = st.executeQuery("select * from " + tabela );      
       return rs;
   }
   
   
   public void executarSQL(String SQL) throws SQLException{
       Statement st = conexao().createStatement();     
       st.executeUpdate(SQL);
   }
   
   
   
   
   public void gravarVenda(int cliente, int local, int codProd, int quantidade, double valTotal) throws SQLException{
       String data = LocalDate.now().format(DateTimeFormatter.ISO_LOCAL_DATE);
       
       conexao().setAutoCommit(false);
          
           Statement st = conexao().createStatement();
           
               conexao().setAutoCommit(false);
               st.executeUpdate("insert into venda (CodCli, CodProd, CodLocal, Qtd_venda, valor_total, data_venda)"
                   + "                  values ("+cliente+","+codProd+","+local+","+quantidade+","+valTotal+","+"'"+ data +"'"  + ")");
                   

       
       
   }
   
/*
    public void excluir(String codExclusao) throws SQLException {
        
        this.executarSQL("DELETE FROM venda WHERE COD_VENDA = " + codExclusao);
    }
*/

  
   
}
