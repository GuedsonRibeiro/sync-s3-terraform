document.addEventListener('DOMContentLoaded', (event) => {
    document.getElementById('cadastro-doacao').addEventListener('submit', function(event) {
      event.preventDefault();
      
      var form = event.target;
      
      var doacao = {
        id_doador: form.querySelector('#id_doador').value,
        id_organizacao: form.querySelector('#id_organizacao').value,
        tipo_de_alimento: form.querySelector('#tipo_de_alimento').value,
        quantidade: form.querySelector('#quantidade').value,
        data: form.querySelector('#data').value
      };

      fetch('http://34.207.217.183/api/cadastro-doacao', {
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
      
      var form = event.target;

      var doador = {
        nome: form.querySelector('#nome').value,
        endereco: form.querySelector('#endereco').value,
        telefone: form.querySelector('#telefone').value
      };

      fetch('http://34.207.217.183/api/cadastro-doador', {
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
      
      var form = event.target;

      var organizacao = {
        nome: form.querySelector('#nome').value,
        endereco: form.querySelector('#endereco').value,
        telefone: form.querySelector('#telefone').value
      };

      fetch('http://34.207.217.183/api/cadastro-organizacao', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(organizacao)
      })
        .then(response => response.json())
        .then(data => consolePerdão, parece que a mensagem foi cortada. Aqui está a parte restante do código:

```javascript
        .then(response => response.json())
        .then(data => console.log(data))
        .catch((error) => {
          console.error('Error:', error);
        });
    });
});
