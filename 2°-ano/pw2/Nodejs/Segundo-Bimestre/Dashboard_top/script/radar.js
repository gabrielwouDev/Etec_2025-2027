/*Gráfico radar */
const radar = document.getElementById('radar');

const data4 = {
  labels: [
    'Greninja',
    'Lucario',
    'Dragapult',
    'Garchomp',
    'Gengar'
  ],
  datasets: [{
    label: 'Pokémons mais usados',
    data: [60, 28, 25, 10, 30],
    fill: true,
    backgroundColor: 'rgba(99, 109, 255, 0.2)',
    borderColor: 'rgb(102, 99, 255)',
    pointBackgroundColor: 'rgb(115, 99, 255)',
    pointBorderColor: '#fff',
    pointHoverBackgroundColor: '#fff',
    pointHoverBorderColor: 'rgb(99, 102, 255)'
  }]
};

new Chart(radar, {
    type: 'radar',
    data: data4,
    options: {
    elements: {
      line: {
        borderWidth: 3
      }
    }
  },
});