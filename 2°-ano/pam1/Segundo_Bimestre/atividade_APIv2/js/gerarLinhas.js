
function gerarHtml(textoTag){
    let novaTag = document.createElement(textoTag)
    return novaTag
}

function gerarLinha(dados){
    let tr = gerarHtml('tr')
    let td1 = gerarHtml('td')
    let td2 = gerarHtml('td')
    let td3 = gerarHtml('td')
    let td4 = gerarHtml('td')

    td1.textContent = dados.id
    td2.textContent = dados.date
    td3.textContent = dados.products[0].productId
    td4.textContent = dados.products[0].quantity

    tr.appendChild(td1)
    tr.appendChild(td2)
    tr.appendChild(td3)
    tr.appendChild(td4)

    return tr
}

function gerarLinha2(dados){
    let tr = gerarHtml('tr')
    let td1 = gerarHtml('td')
    let td2 = gerarHtml('td')
    let td3 = gerarHtml('td')
    let td4 = gerarHtml('td')
    let td5 = gerarHtml('td')
    let td6 = gerarHtml('td')
    let td7 = gerarHtml('td')

    td1.textContent = dados.id
    td2.textContent = dados.title
    td3.textContent = dados.price
    td4.textContent = dados.description
    td5.textContent = dados.category
    td6.textContent = dados.image
    td7.textContent = dados.rating.rate

    tr.appendChild(td1)
    tr.appendChild(td2)
    tr.appendChild(td3)
    tr.appendChild(td4)
    tr.appendChild(td5)
    tr.appendChild(td6)
    tr.appendChild(td7)

    return tr
}

function gerarLinha3(dados){
    let tr = gerarHtml('tr')
    let td1 = gerarHtml('td')
    let td2 = gerarHtml('td')
    let td3 = gerarHtml('td')
    let td4 = gerarHtml('td')

    td1.textContent = dados.id
    td2.textContent = dados.email
    td3.textContent = dados.username
    td4.textContent = dados.password

    tr.appendChild(td1)
    tr.appendChild(td2)
    tr.appendChild(td3)
    tr.appendChild(td4)

    return tr
}

export {gerarLinha,gerarLinha2,gerarLinha3}