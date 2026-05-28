import { pegarMelhores8,pegarSaldo } from "./buscarDados.js";
import { criarGrafico } from "./criarGrafico.js";

//Buscando dados
let dados = await pegarMelhores8()
let dados2 = await pegarSaldo()

// Criando objetos dos gráficos
let config = criarGrafico(dados)
let config2 = criarGrafico(dados2)


// Gerando os gráficos
const ctx = document.getElementById('melhoresTimes');
new Chart(ctx, config)

const ctx2 = document.getElementById('maiorSaldo')
new Chart(ctx2,config2)