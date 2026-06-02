
public class CalculaISS implements IProcessarImpostos{

	@Override
	public void calcularImposto(double valor) {
		double iss = (valor/5)*100;
		
	}

}
