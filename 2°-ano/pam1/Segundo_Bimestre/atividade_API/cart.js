let url = 'https://fakestoreapi.com/carts'

let res = await fetch(url)

let dados = await res.json()

let linhas = document.querySelectorAll('tr')

for (let i = 0; i < dados.length; i++) {
    let filhos = linhas[i+1].children
    filhos[0].textContent = dados[i].id
    filhos[1].textContent = dados[i].userId
    filhos[2].textContent = dados[i].date
    let produId = dados[i].products.map(p => p.productId)
    filhos[3].textContent = produId

    let quantidade = dados[i].products.map(p => p.quantity)
    filhos[4].textContent = quantidade
}


