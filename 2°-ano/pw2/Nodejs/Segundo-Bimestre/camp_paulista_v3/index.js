
import express from 'express'
import {calculaPontos,buscarTime} from './script/opc.js'
import { filtrarTimes,filtrarTimesSg,filtrarTimesN,filtrarTimesFase,desempenhoTime,timesOrdem,pontosTimes } from './script/consumir.js'
import { times } from './script/bd.js'

const app = express()
app.use(cors());

const corsOptions = {
  origin: '*'
};
app.use(cors(corsOptions));

app.get('/', (req, res) => {
  res.send('Hello World')
}) 

app.get('/times', (req, res) => {
  res.json(times)
}) 

app.listen(3000, () => {
  console.log('Server is running on http://localhost:3000')
})


app.get('/pontosDosTimes',(req,res) =>{
  let resposta = pontosTimes();
  let retorno = {
    msg:"times com os pontos: ",
    retorno: resposta
  }
  res.json(retorno)
})

//requisito 1
app.get('/time/:nomeDoTime', (req, res) => {
  let {nomeDoTime} = req.params;
  let resposta = buscarTime(nomeDoTime);
  let retorno = {
    mensagem: "Os dados do seu time são",
    resultado: resposta
  }
  res.json(retorno);
})

app.get('/melhoresTimes',(req,res) =>{
  let resposta = filtrarTimes();
  let retorno = {
    msg:"melhores 8 times: ",
    retorno: resposta
  }
  res.json(retorno)
})

app.get('/melhoresTimesSg',(req,res) =>{
  let resposta = filtrarTimesSg();
  let retorno = {
    msg:"melhores 4 times em saldo de gols: ",
    retorno: resposta
  }
  res.json(retorno)
})

app.get('/melhoresTimesN/:numeroDeTimes',(req,res) =>{
  let {numeroDeTimes} = req.params;
  let resposta = filtrarTimesN(numeroDeTimes);
  let retorno = {
    msg:"Os "+numeroDeTimes + " melhores times: ",
    retorno: resposta
  }
  res.json(retorno)
})

app.get('/passaramDeFase',(req,res) =>{
  let resposta = filtrarTimesFase();
  let retorno = {
    msg:"Times que passaram de fase: ",
    retorno: resposta
  }
  res.json(retorno)
})

app.get('/desempenhoDosTimes',(req,res) =>{
  let resposta = desempenhoTime();
  let retorno = {
    msg:"times com desempenho: ",
    retorno: resposta
  }
  res.json(retorno)
})

app.get('/timesEmOrdem',(req,res) =>{
  let resposta = timesOrdem();
  let retorno = {
    msg:"times em ordem: ",
    retorno: resposta
  }
  res.json(retorno)
})
