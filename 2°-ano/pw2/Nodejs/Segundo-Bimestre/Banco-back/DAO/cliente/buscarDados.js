import { conexao } from "../conexao.js";

async function buscarEndereco(){
  const sql = `SELECT * FROM Endereco`
  
  const conn = await conexao()
  try {
      // Executar a consulta
      const [rows, fields] = await conn.query(sql);
      await conn.end()
      return rows
    } catch (err) {
      return err.message
    }
}

async function buscarLimite(){
  const sql = `SELECT * FROM LimiteDeCredito`
  
  const conn = await conexao()
  try {
      // Executar a consulta
      const [rows, fields] = await conn.query(sql);
      await conn.end()
      return rows
    } catch (err) {
      return err.message
    }
}

async function buscarCliente(){
  const sql = `SELECT * FROM Cliente`
  
  const conn = await conexao()
  try {
      // Executar a consulta
      const [rows, fields] = await conn.query(sql);
      await conn.end()
      return rows
    } catch (err) {
      return err.message
    }
}

async function buscarProduto(){
  const sql = `SELECT * FROM Produto`
  
  const conn = await conexao()
  try {
      // Executar a consulta
      const [rows, fields] = await conn.query(sql);
      await conn.end()
      return rows
    } catch (err) {
      return err.message
    }
}

async function buscarPedido(){
  const sql = `SELECT * FROM Pedido`
  
  const conn = await conexao()
  try {
      // Executar a consulta
      const [rows, fields] = await conn.query(sql);
      await conn.end()
      return rows
    } catch (err) {
      return err.message
    }
}

async function buscarPedidoProduto(){
  const sql = `SELECT * FROM Pedido_Produto`
  
  const conn = await conexao()
  try {
      // Executar a consulta
      const [rows, fields] = await conn.query(sql);
      await conn.end()
      return rows
    } catch (err) {
      return err.message
    }
}

async function buscarLimiteCliente(){
  const sql = `SELECT * FROM vwClienteLimite`
  
  const conn = await conexao()
  try {
      // Executar a consulta
      const [rows, fields] = await conn.query(sql);
      await conn.end()
      return rows
    } catch (err) {
      return err.message
    }
}

export {buscarEndereco,buscarLimite,buscarCliente,buscarProduto,buscarPedido,buscarPedidoProduto,buscarLimiteCliente}
