/*Grafico de linha*/
const line = document.getElementById('line');
const labels = ['janeiro','fevereiro','março','abril','maio','junho'];
const data2 = {
  labels: labels,
  datasets: [{
    label: 'Usuários ativos por mês',
    data: [120,190,300,500,420,610],
    fill: false,
    borderColor: 'rgb(192, 75, 75)',
    tension: 0.1
  }]
};

new Chart(line, {
    type: 'line',
    data: data2,
});