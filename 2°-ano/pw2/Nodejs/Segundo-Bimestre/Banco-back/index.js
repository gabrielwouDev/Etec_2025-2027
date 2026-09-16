import express from 'express'

import { buscarCliente } from './DAO/cliente/buscarCliente.js';
import { incluirCliente } from "./DAO/cliente/inserirCliente.js";
import { buscarEndereco } from './DAO/endereco/buscarEndereco.js';
import { inserirEndereco } from "./DAO/endereco/inserirEndereco.js";
import { buscarLimite } from './DAO/LimiteDeCredito/buscarLimite.js'; 
import { inserirLimite } from './DAO/LimiteDeCredito/inserirLimite.js';
import { buscarProduto } from './DAO/produto/buscarProduto.js';
import { inserirProduto } from './DAO/produto/inserirProduto.js';
import { buscarPedido } from './DAO/pedido/buscarPedido.js';
import { inserirPedido } from './DAO/pedido/inserirPedido.js';
import { buscarPedidoProduto } from './DAO/pedido_produto/buscarPedido_produto.js';
import { inserirPedidoProduto } from './DAO/pedido_produto/inserirPedido_produto.js';
const app = express()

app.use(express.json())

// Rota Base
app.get('/', (req, res) => {
    res.json({ mensagem: 'API de Estacionamento Rodando perfeitamente!' })
})

//busca de Endereços
app.get('/Endereco', async (req, res) => {
    try {
        const Enderecos = await buscarEndereco()
        res.json(Enderecos)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar Enderecos', detalhes: erro.message })
    }
})


//busca de Credito
app.get('/Credito', async (req, res) => {
    try {
        const creditos = await buscarLimite()
        res.json(creditos)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar limite de creditos', detalhes: erro.message })
    }
})

//busca de Cliente
app.get('/Cliente', async (req, res) => {
    try {
        const clientes = await buscarCliente()
        res.json(clientes)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar clientes', detalhes: erro.message })
    }
})

//busca de Produto
app.get('/Produto', async (req, res) => {
    try {
        const produtos = await buscarProduto()
        res.json(produtos)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar produtos', detalhes: erro.message })
    }
})

app.get('/Pedido', async (req, res) => {
    try {
        const pedidos = await buscarPedido()
        res.json(pedidos)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar pedidos', detalhes: erro.message })
    }
})

app.get('/Pedido_Produto', async (req, res) => {
    try {
        const pedidoProduto = await buscarPedidoProduto()
        res.json(pedidoProduto)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar produtos pedidos', detalhes: erro.message })
    }
})

app.get('/LimiteCliente', async (req, res) => {
    try {
        const limiteCliente = await buscarLimiteCliente()
        res.json(limiteCliente)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar limite dos clientes', detalhes: erro.message })
    }
})

//Posts

app.post('/InserirCliente', async (req, res) => {
    let {codigo, nome, sobreNome, cpf, telefone, id_limite, id_endereco} = req.body   // retirando dados do body da requisição
    let infos = [codigo, nome, sobreNome, cpf, telefone, id_limite, id_endereco ]
    let results = await incluirCliente(infos)

    console.log(results)
    res.json(results)
})

app.post('/InserirEndereco', async (req, res) => {
    let {id_endereco, logradouro, numero, cep, cidade} = req.body   // retirando dados do body da requisição
    let infos = [id_endereco, logradouro, numero, cep, cidade ]
    let results = await inserirEndereco(infos)

    console.log(results)
    res.json(results)
})

app.post('/InserirLimite', async (req, res) => {
    let {id_limite, statusLimite} = req.body   // retirando dados do body da requisição
    let infos = [id_limite, statusLimite ]
    let results = await inserirLimite(infos)

    console.log(results)
    res.json(results)
})

app.post('/InserirProduto', async (req, res) => {
    let {codigo, nome, descricao, preco} = req.body   // retirando dados do body da requisição
    let infos = [ codigo, nome, descricao, preco ]
    let results = await inserirProduto(infos)

    console.log(results)
    res.json(results)
})

app.post('/InserirPedido', async (req, res) => {
    let {numero, data_elaboracao, id_cliente} = req.body   // retirando dados do body da requisição
    let infos = [ numero, data_elaboracao, id_cliente ]
    let results = await inserirPedido(infos)

    console.log(results)
    res.json(results)
})

app.post('/InserirPedidoProduto', async (req, res) => {
    let {id_pedido, id_produto} = req.body   // retirando dados do body da requisição
    let infos = [ id_pedido, id_produto ]
    let results = await inserirPedidoProduto(infos)

    console.log(results)
    res.json(results)
})

// Inicialização do Servidor
app.listen(3000, () => {
  console.log('🚀 Server is running on http://localhost:3000')
})
