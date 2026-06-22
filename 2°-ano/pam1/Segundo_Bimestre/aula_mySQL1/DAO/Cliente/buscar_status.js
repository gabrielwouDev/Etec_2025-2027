import {conexao} from '../conexao.js'


async function buscarStatus(){
  console.log('DAO de STATUS')
    const sql = `SELECT * FROM tbl_status;`
    
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

export {buscarStatus}