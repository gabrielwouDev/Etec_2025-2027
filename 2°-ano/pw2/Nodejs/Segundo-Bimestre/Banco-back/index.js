import express from 'express'

import { buscarCliente, buscarEndereco, buscarLimite, buscarProduto, buscarPedido, buscarPedidoProduto, buscarLimiteCliente } from './DAO/cliente/buscarDados.js'
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

// Inicialização do Servidor
app.listen(3000, () => {
  console.log('🚀 Server is running on http://localhost:3000')
})
