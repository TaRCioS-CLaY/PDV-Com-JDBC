package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Clayton Garcia dos Santos Inácio
 * Mat: 2016101697
 */
public class RegrasDeNegocio extends Dao {
    
    
    public boolean tratarEstoque(int codProd, int quantidade) throws SQLException{

       int qtd_estoque = 0;
       boolean situacao = false;
       Statement st = conexao().createStatement();
       try {
            ResultSet rs = st.executeQuery("SELECT descricao, CODLOCAL, qtd_estoque, preco_unitario From Produto Where Codprod = " + codProd);
        while(rs.next()){
                qtd_estoque = rs.getInt("qtd_estoque");    
       }  
       } catch (SQLException e) {
           JOptionPane.showMessageDialog(null, "Produto não encontrado!\nErro: " + e);
       }
    
       if(qtd_estoque < quantidade){
          JOptionPane.showMessageDialog(null, "Sem produto em estoque\n");          
       }else{
           
           
           situacao = true;
           st.executeUpdate("UPDATE Produto set qtd_estoque = qtd_estoque - " + quantidade + " WHERE Codprod = " + codProd);
           
       }
       
    return situacao;   
   }    
 
    
    public double precoTotal(int qtd, double preco){
        
        double total = 0;
        total += (qtd * preco);
        JOptionPane.showMessageDialog(null, "Preço calculado: " + String.format("%.2f", total));
        return total;
    }    
    
    public double calcularDesconto(int cprod,int ccli,int qtd, double total) throws SQLException{
        ResultSet rs = busca("SELECT Bonus From Cliente Where Codcli = " + ccli);
        int bonus = 0;
        int percentual = 0;
        while(rs.next()){
            bonus = rs.getInt("bonus");
        }
        
        if (bonus>100){
            try {
                rs = busca("SELECT Percentual From Desconto Where CodProd = " + cprod + " AND Qtd_min >= " + qtd + " AND Qtd_max <= " + qtd);
                while(rs.next()){
                    percentual = rs.getInt("percentual");
                }
                total = total - (total * percentual/100);

                executarSQL("UPDATE Cliente SET Bonus = Bonus - 100 Where Codcli = " + ccli);
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "Não foi possivel calcular desconto por bonous\nErro: " + e);
            }
            
        }else{
            JOptionPane.showMessageDialog(null, "O cliente não pussuirá desconto por bonus!");
        }
        int localProduto = buscaUnica("select * from produto where CodProd = " + cprod).getInt("Codlocal");

        if(ccli == localProduto){
            total -= (total * 10/100);
            JOptionPane.showMessageDialog(null, "O cliente possui desconto pelo local de fabricação!");
        }
        return total;
       
    }
    
    public void vender(int cliente, int local, int codProd, int quantidade, double preco) throws SQLException {

        double valor = 0;
             
        try{
            if(tratarEstoque(codProd, quantidade)){

                valor = precoTotal(quantidade, preco);

                valor = calcularDesconto(codProd, cliente, quantidade, valor);
                
                try {

                    gravarVenda(cliente, local, codProd, quantidade, valor);

                }catch (SQLException e) {                   
                    JOptionPane.showMessageDialog(null,"Erro ao gravar venda.\nErro: "+ e);
                }


            }else{
                JOptionPane.showMessageDialog(null, "Não há estoque suficiente.");
            }
           // conexao().commit();
            
        }catch(SQLException es){
            conexao().rollback();
            JOptionPane.showMessageDialog(null, "Erro ao vender.\nErro:  " +es);
        }
        
       
    }    
    
    
}
