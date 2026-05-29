
public class CalculaICMS implements IProcessarImpostos{

	@Override
	public void calcularImposto(double valor) {
		 double icms =  (valor/18)*100;
		
	}

}
