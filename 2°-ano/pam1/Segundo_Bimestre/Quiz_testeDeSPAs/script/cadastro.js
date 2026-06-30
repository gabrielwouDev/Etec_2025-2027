let btn = document.querySelector('.avancar')

btn.addEventListener('click', pegarDados)

function pegarDados(){
    let form = document.querySelector('form')
    let pessoa = {
        nome: form.nome.value,
        email: form.email.value,
        endereco: form.endereco.value,
        genero: form.genero.value,
        estado: form.estado.value
    }

    localStorage.setItem('pessoa', JSON.stringify(pessoa));
    document.cookie = "session_id=abc123; max-age=3; path=/";
    location.href = '../views/Confirmar-cadastro.html'
}