document.getElementById('cadastro-doacao').addEventListener('submit', function(event) {
    event.preventDefault();
  
    var doacao = {
      id_doador: document.getElementById('id_doador').value,
      id_organizacao: document.getElementById('id_organizacao').value,
      tipo_de_alimento: document.getElementById('tipo_de_alimento').value,
      quantidade: document.getElementById('quantidade').value,
      data: document.getElementById('data').value
    };
  
    fetch('http://localhost:5000/cadastro-doacao', {
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
  
    fetch('http://localhost:5000/cadastro-doador', {
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
  
    fetch('http://localhost:5000/cadastro-organizacao', {
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
