package pdv;

import java.sql.SQLException;
/**
 *
 * @author Clayton Garcia dos Santos Inácio
 * Mat: 2016101697
 */
public class PDV {

    public static void main(String[] args) throws SQLException {
        Crud janela = new Crud();       
        janela.setVisible(true);
        janela.setLocationRelativeTo(null);
        
    }    
}
