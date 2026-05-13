/*Gráfico polar*/
const polar = document.getElementById('polar');

const data3 = {
  labels: [
    'Pc',
    'Mobile',
    'Tablet',
    'Console',
  ],
  datasets: [{
    label: 'Usuários que usam',
    data: [50,30,5,10],
    backgroundColor: [
      'rgb(201, 203, 207)',
      'rgb(97, 224, 80)',
      'rgb(85, 85, 85)',
      'rgb(0, 82, 177)'
    ]
  }]
};

new Chart(polar, {
    type: 'polarArea',
    data: data3,
    options: {}
});