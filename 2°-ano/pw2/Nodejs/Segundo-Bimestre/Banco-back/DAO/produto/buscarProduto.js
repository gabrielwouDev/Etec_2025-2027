import {conexao} from '../conexao.js'

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
  
  export {buscarProduto}