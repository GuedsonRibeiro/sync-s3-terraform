window.onload = function() {
  // A função para preencher a tabela ficará aqui

  // Faz a requisição para a rota de últimas doações
  fetch('http://34.207.217.183/api/ultimas-doacoes')
  .then(response => response.json())
  .then(data => {
      let table = document.getElementById('doacoesTable');
      data.forEach(doacao => {
          let row = table.insertRow();
          let cell1 = row.insertCell(0);
          let cell2 = row.insertCell(1);
          let cell3 = row.insertCell(2);
          let cell4 = row.insertCell(3);
          let cell5 = row.insertCell(4);
          let cell6 = row.insertCell(5);

          cell1.innerHTML = doacao.ID;
          cell2.innerHTML = doacao.Doador;
          cell3.innerHTML = doacao.Organizacao;
          cell4.innerHTML = doacao.Tipo_de_Alimento;
          cell5.innerHTML = doacao.Quantidade;
          cell6.innerHTML = doacao.Data;
      });
  })
  .catch((error) => {
      console.error('Error:', error);
  });

  // Aqui começam as funções de submit que você já tinha antes
  document.getElementById('cadastro-doacao').addEventListener('submit', function(event) {
      event.preventDefault();

      var doacao = {
          id_doador: document.getElementById('id_doador').value,
          id_organizacao: document.getElementById('id_organizacao').value,
          tipo_de_alimento: document.getElementById('tipo_de_alimento').value,
          quantidade: document.getElementById('quantidade').value,
          data: document.getElementById('data').value
      };

      fetch('http://34.207.217.183/cadastro-doacao', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(doacao)
      })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch((error) => {
          console.error('Error:', error);
      });
  });

  document.getElementById('cadastro-doador').addEventListener('submit', function(event) {
      event.preventDefault();

      var doador = {
          nome: document.getElementById('nome').value,
          endereco: document.getElementById('endereco').value,
          telefone: document.getElementById('telefone').value
      };

      fetch('http://34.207.217.183/cadastro-doador', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(doador)
      })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch((error) => {
          console.error('Error:', error);
      });
  });

  document.getElementById('cadastro-organizacao').addEventListener('submit', function(event) {
      event.preventDefault();

      var organizacao = {
          nome: document.getElementById('nome').value,
          endereco: document.getElementById('endereco').value,
          telefone: document.getElementById('telefone').value
      };

      fetch('http://34.207.217.183/cadastro-organizacao', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(organizacao)
      })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch((error) => {
          console.error('Error:', error);
      });
  });
}
