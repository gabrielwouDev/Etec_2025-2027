
function criarGrafico(dados){
    const labels = dados[0];
    const data = {
    labels: labels,
    datasets: [{
        label: '',
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

export {criarGrafico}