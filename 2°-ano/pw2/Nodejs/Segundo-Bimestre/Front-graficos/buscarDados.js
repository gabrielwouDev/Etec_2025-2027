async function pegarMelhores8(){
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

async function pegarSaldo(){
    let url = "http://localhost:3000/melhoresTimesSg"
    let resp = await fetch(url)
    let times = await resp.json()
    times = times.retorno

    let nomeTimes = []
    let saldoTimes = []

    times.forEach(elemento =>{
        nomeTimes.push(elemento.clube)
        saldoTimes.push(elemento.sg)
    });

    return [nomeTimes,saldoTimes]
}



export {pegarMelhores8,pegarSaldo}