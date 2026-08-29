import {buscarDados} from "./buscarDados.js"
import { gerarLinha } from "./gerarLinhas.js"

//Tabela carrinhos
let carrinhos = await buscarDados('https://fakestoreapi.com/carts')
let tbCarrinho = document.querySelector('#tbCarrinho')
for (let i = 0; i < carrinhos.length; i++) {
    let l = gerarLinha(carrinhos[i])
    tbCarrinho.append(l)
}
