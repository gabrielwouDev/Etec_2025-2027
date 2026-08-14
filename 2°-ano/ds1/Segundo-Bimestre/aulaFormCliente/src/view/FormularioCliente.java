package view;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JRadioButton;
import javax.swing.JTextField;
import javax.swing.event.EventListenerList;

public class FormularioCliente extends JFrame{
		
	private JLabel lbNome;
	private JTextField txNome;
	private JButton btExibir;
	private ButtonGroup grupoDeRadioGenero;
	private JRadioButton btMasc,btFem, btOutros;
	private JComboBox comboEstado;
	
	
	
	public FormularioCliente() {
		
		setTitle("Formulário");
		setSize(500,950);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		setResizable(false);
		setLayout(null);
		getContentPane().setBackground(Color.LIGHT_GRAY);
		
		//nome
		lbNome = new JLabel();
		lbNome.setText("Nome:");
		lbNome.setBounds(70,80,100,30);//x y w h
		add(lbNome);
		
		txNome = new JTextField();
		txNome.setBounds(130,80,250,30); // X Y W H		
		add(txNome);
		
		//email
		lbNome = new JLabel();
		lbNome.setText("Email:");
		lbNome.setBounds(70,120,100,30);//x y w h
		add(lbNome);
		
		txNome = new JTextField();
		txNome.setBounds(130,120,250,30); // X Y W H		
		add(txNome);
		
		//telefone
		lbNome = new JLabel();
		lbNome.setText("Telefone:");
		lbNome.setBounds(70,160,100,30);//x y w h
		add(lbNome);
		
		txNome = new JTextField();
		txNome.setBounds(130,160,250,30); // X Y W H		
		add(txNome);
		
		//cpf
		lbNome = new JLabel();
		lbNome.setText("CPF:");
		lbNome.setBounds(70,200,100,30);//x y w h
		add(lbNome);
		
		txNome = new JTextField();
		txNome.setBounds(130,200,250,30); // X Y W H		
		add(txNome);
		
		//cnpj
		lbNome = new JLabel();
		lbNome.setText("CNPJ:");
		lbNome.setBounds(70,240,100,30);//x y w h
		add(lbNome);
		
		txNome = new JTextField();
		txNome.setBounds(130,240,250,30); // X Y W H		
		add(txNome);
		
		//data de nascimento
		lbNome = new JLabel();
		lbNome.setText("<html> Data de<br>Nascimento:</html>");
		lbNome.setBounds(40,280,150,30);//x y w h
		add(lbNome);
		
		txNome = new JTextField();
		txNome.setBounds(130,280,250,30); // X Y W H		
		add(txNome);
		
		
		lbNome = new JLabel();
		lbNome.setText("Estado:");
		lbNome.setBounds(110,330,100,30);//x y w h
		add(lbNome);
		
		comboEstado = new JComboBox();

		comboEstado.addItem("SP");
		comboEstado.addItem("BA");
		comboEstado.addItem("MG");
		comboEstado.addItem("AM");
		
		comboEstado.setBounds(80,360,110,25);
		add(comboEstado);
		
		lbNome = new JLabel();
		lbNome.setText("Gênero:");
		lbNome.setBounds(270,330,100,30);
		add(lbNome);
		
		btMasc = new JRadioButton();
		btMasc.setBounds(210,360,100,25);
		btMasc.setText("Masculino");
		btMasc.setBackground(Color.LIGHT_GRAY);
		add(btMasc);		
		
		btFem = new JRadioButton();
		btFem.setBounds(310,360,100,25);
		btFem.setText("Feminino");
		btFem.setBackground(Color.LIGHT_GRAY);
		add(btFem);	
		
		grupoDeRadioGenero = new ButtonGroup(); 
		grupoDeRadioGenero.add(btMasc);
		grupoDeRadioGenero.add(btFem);
		
		
		btExibir = new JButton();
		btExibir.setText("Cadastrar");
		btExibir.setBounds(180,800,120,30);
		btExibir.setForeground(Color.WHITE);
		btExibir.setBackground(Color.BLACK); 
		
		btExibir.addActionListener(new ActionListener() {			
			@Override
			public void actionPerformed(ActionEvent e) {
				String nome = txNome.getText();
				JOptionPane.showMessageDialog(null,"Nome: "+nome);
				
				String valor = "18";
				int idade = Integer.parseInt(valor);
				
				
			}
		});
		
						
		add(btExibir);		
		
		setVisible(true);//ÚLTIMA LINHA DO CONSTRUTOR
	}	
}
