import javax.swing.JOptionPane;
import java.util.Scanner;
public class App {

	public static void main(String[] args) {
		CalculaICMS icms = new CalculaICMS();
		CalculaISS iss = new CalculaISS();
		CalculaIPI ipi = new CalculaIPI();
		
		Scanner ler = new Scanner(System.in);
		int opcao;
		double valor;
		opcao = Integer.parseInt(JOptionPane.showInputDialog(null,"Escolha uma Opção"));
		if(opcao == 1) {
			valor = Double.parseDouble(JOptionPane.showInputDialog(null,"Insira o valor: "));
			icms.calcularImposto(valor);
			JOptionPane.showMessageDialog(null, icms);
		}
		 

	}

}
