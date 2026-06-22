import express from 'express'

import { buscarClientes } from './DAO/Cliente/buscar_cliente.js'
import { buscarStatus } from './DAO/Cliente/buscar_status.js'

const app = express()

app.use(express.json())

app.get('/', (req, res) => {
    res.json({ mensagem: 'API de Estacionamento Rodando perfeitamente!' })
})

// 1. CONSULTAR TODOS (GET)
app.get('/cliente', async (req, res) => {
    try {
        const clientes = await buscarClientes()
        res.json(clientes)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar clientes', detalhes: erro.message })
    }
})

app.get('/status', async (req, res) => {
    try {
        const status = await buscarStatus()
        res.json(status)
    } catch (erro) {
        res.status(500).json({ erro: 'Erro ao listar status', detalhes: erro.message })
    }
})

// Inicialização do Servidor
app.listen(3000, () => {
    console.log('🚀 Server is running on http://localhost:3000')
  })