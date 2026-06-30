// Usando Local Storage
const dados = JSON.parse(localStorage.getItem('pessoa'));

let spans = document.querySelectorAll('span')
spans[0].textContent = dados.nome
spans[1].textContent = dados.email
spans[2].textContent = dados.endereco
spans[3].textContent = dados.estado
spans[4].textContent = dados.genero

let voltar = document.querySelector('.voltar')

voltar.addEventListener('click',()=>{
    document.cookie = "session_id=; max-age=0; path=/";
    localStorage.clear();
    location.href = "../views/cadastro.html"
})
let avancar = document.querySelector('.avancar')

avancar.addEventListener('click',()=>{
    window.location.href = "../views/Fase1.html"
}) 

//Usando Cookies
const todosOsCookies = document.cookie;