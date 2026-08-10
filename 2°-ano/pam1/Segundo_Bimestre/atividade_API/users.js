let url ='https://fakestoreapi.com/users'

let res = await fetch(url)

let dados = await res.json()

let linhas = document.querySelectorAll('tr')

for (let i = 0; i < dados.length; i++) {

    let filhos = linhas[i+1].children   
    filhos[0].textContent = dados[i].id
    filhos[1].textContent = dados[i].username
    filhos[2].textContent = dados[i].email
    filhos[3].textContent = dados[i].password 
    
}

console.log(dados)