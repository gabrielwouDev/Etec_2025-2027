import {buscarDados} from "./buscarDados.js"
import { gerarLinha3 } from "./gerarLinhas.js"

//Tabela usuarios
let usuarios = await buscarDados('https://fakestoreapi.com/users')
let tbUsuarios = document.querySelector('#tbUsuarios')
for (let i = 0; i < usuarios.length; i++) {
    let l = gerarLinha3(usuarios[i])
    tbUsuarios.append(l)
}