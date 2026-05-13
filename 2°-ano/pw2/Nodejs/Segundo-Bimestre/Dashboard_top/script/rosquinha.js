/*Grafico de rosquinha*/
const donut = document.getElementById('donut');
const data1 = {
  labels: [
    'Água',
    'Fogo',
    'Elétrico',
    'Dragão',
    'Fantasma'
  ],
  datasets: [{
    label: 'Preferência dos usuários',
    data: [30,20,18,17,15],
    backgroundColor: [
      'rgb(0, 174, 255)',
      'rgb(221, 54, 54)',
      'rgb(255, 205, 86)',
      'rgb(0, 4, 255)',
      'rgb(121, 0, 235)'
    ],
    hoverOffset: 4
  }]
};

new Chart(donut, {
    type: 'doughnut',
    data: data1,
});