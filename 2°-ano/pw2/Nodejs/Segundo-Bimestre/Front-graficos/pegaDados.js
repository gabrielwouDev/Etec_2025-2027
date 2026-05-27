async function pegarDados(){
    let url = "http://localhost:3000/melhoresTimes"

    // requisição
    let resp = await fetch(url)
    // lidando com a resposta
    let times = await resp.json()
    times = times.retorno
    let nomeTimes = []
    let pontosTimes = []

    times.forEach(elemento => {
        nomeTimes.push(elemento.clube)
        pontosTimes.push(elemento.pontuacao)
    });

    return [nomeTimes, pontosTimes]
   
}
export {pegarDados}