import { pegarMelhores8,pegarSaldo,pegarPassaramDeFase,pegarDesempenhoDosTimes,pegarOrdemPontuacao } from "./buscarDados.js";
import { criarGrafico } from "./criarGrafico.js";

//Buscando dados
let dados = await pegarMelhores8();
let dados2 = await pegarSaldo();
let dados3 = await pegarPassaramDeFase();
let dados4 = await pegarDesempenhoDosTimes();
let dados5 = await pegarOrdemPontuacao();

// Criando objetos dos gráficos
let config = criarGrafico(dados);
let config2 = criarGrafico(dados2);
let config3 = criarGrafico(dados3);
let config4 = criarGrafico(dados4);
let config5 = criarGrafico(dados5);

// Gerando os gráficos
const ctx = document.getElementById('melhoresTimes');
const ctx2 = document.getElementById('maiorSaldo');
const ctx3 = document.getElementById('passaramDeFase');
const ctx4 = document.getElementById('desempenhoDosTimes');
const ctx5 = document.getElementById('ordemPontuacao');

if(ctx){
    new Chart(ctx, config)
}
if(ctx2){
    new Chart(ctx2,config2)
}
if (ctx3) {
    new Chart(ctx3, config3)
}

if (ctx4) {
    new Chart(ctx4, config4)
}
if(ctx5){
    new Chart(ctx5,config5)
}












