import {buscarDados} from "./buscarDados.js"
import { gerarLinha2 } from "./gerarLinhas.js"

//Tabela produtos
let produtos = await buscarDados('https://fakestoreapi.com/products')
let tbProdutos = document.querySelector('#tbProdutos')
for (let i = 0; i < produtos.length; i++) {
    let l = gerarLinha2(produtos[i])
    tbProdutos.append(l)
}