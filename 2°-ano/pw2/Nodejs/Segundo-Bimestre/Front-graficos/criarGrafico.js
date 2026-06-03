
function criarGrafico5(dados){
    const labels = dados[0];
    const data = {
    labels: labels,
    datasets: [{
        label: 'Pontuação dos times ',
        data: dados[1],
        backgroundColor: [
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 205, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(255, 99, 132, 0.2)',
        'rgba(201, 203, 207, 0.2)',
        'rgba(0, 0, 0, 0.2)',
        'rgba(255, 0, 0, 0.2)',
        'rgba(0, 255, 0, 0.2)'
        ],
        borderColor: [
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)',
        'rgb(75, 192, 192)',
        'rgb(255, 99, 132)',
        'rgb(201, 203, 207)',
        'rgb(41, 41, 41)',
        'rgb(214, 29, 29)',
        'rgb(155, 255, 97)'
        ],
        borderWidth: 1
    }]
    };

    const config = {
    type: 'bar',
    data: data,
    options: {
        scales: {
        y: {
            beginAtZero: true
        }
        }
    },
    };
    return config
}

function criarGrafico2(dados){
    const labels = dados[0];
    const data = {
        labels: labels,
        datasets: [{
            label: 'saldo de gol',
            data:dados[1],
            backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)',
            'rgb(0, 234, 255)'
            
            ],
            hoverOffset: 4
        }]
    };

    const config = {
        type: 'doughnut',
        data: data,
    };

    return config
}


function criarGrafico3(dados){
    const labels = dados[0];
    const data = {
        labels: labels,
        datasets: [{
            label: 'pontuação',
            data: dados[1],
            backgroundColor: [
            'rgb(255, 182, 79)',
            'rgb(118, 255, 255)',
            'rgb(188, 95, 254)',
            'rgb(255, 73, 161)',
            'rgb(255, 255, 82)',
            'rgb(68, 255, 124)',
            'rgb(84, 95, 255)',
            'rgb(255, 61, 61)'
            ]
        }]
    };

    const config = {
        type: 'polarArea',
        data: data,
        options: {}
    };

    return config
}

function criarGrafico4(dados){
    const labels = dados[0];
    const data = {
    labels: labels,
    datasets: [{
        label: 'Desempenho dos times',
        data: dados[1],
        fill: false,
        borderColor: 'rgb(75, 192, 192)',
        tension: 0.1
    }]
    };

    const config = {
        type: 'line',
        data: data,
    };

    return config
}

function criarGrafico(dados){
    const labels = dados[0];
    const data = {
        labels: labels,
        datasets: [{
            label: 'Pontuação',
            data: dados[1],
            backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(136, 251, 119)',
            'rgb(255, 221, 99)',
            'rgb(235, 54, 229)',
            'rgb(0, 144, 211)',
            'rgb(133, 99, 255)',
            'rgb(54, 162, 235)',
            'rgb(255, 115, 44)'
            ],
            hoverOffset: 4
        }]
    };

    const config = {
    type: 'pie',
    data: data,
    };

    return config
}


export {criarGrafico,criarGrafico2,criarGrafico3,criarGrafico4,criarGrafico5}