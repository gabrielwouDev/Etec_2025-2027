import { pegarDados } from "./pegaDados.js";
import { criarGrafico } from "./criarGrafico.js";

// buscar dados no BACK END
let dados = await pegarDados()

// Criar OBJETO DO GRÁFICO
let config = criarGrafico(dados)

// GERAR o GRÁFICO
const ctx = document.getElementById('myChart');
new Chart(ctx, config)