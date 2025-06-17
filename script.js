// script.js
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('formProducto');
    const tabla = document.querySelector('#tablaInventario tbody');

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        const datos = new FormData(form);
        const response = await fetch('insertar_producto.php', {
            method: 'POST',
            body: datos
        });

        const resultado = await response.text();
        alert(resultado);
        form.reset();
        cargarProductos();
    });

    async function cargarProductos() {
        const response = await fetch('obtener_productos.php');
        const productos = await response.json();

        tabla.innerHTML = '';
        productos.forEach(p => {
            const fila = `<tr>
                <td>${p.nombre}</td>
                <td>${p.categoria}</td>
                <td>${p.marca}</td>
                <td>${p.precio}</td>
                <td>${p.stock}</td>
            </tr>`;
            tabla.innerHTML += fila;
        });
    }

    cargarProductos(); // al inicio
});

document.addEventListener('DOMContentLoaded', () => {
  fetch('obtener_categorias.php')
    .then(res => res.json())
    .then(data => {
      const selectCategorias = document.getElementById('categoria');
      data.forEach(cat => {
        let option = document.createElement('option');
        option.value = cat.id;
        option.textContent = cat.nombre;
        selectCategorias.appendChild(option);
      });
    });

  fetch('obtener_marcas.php')
    .then(res => res.json())
    .then(data => {
      const selectMarcas = document.getElementById('marca');
      data.forEach(mar => {
        let option = document.createElement('option');
        option.value = mar.id;
        option.textContent = mar.nombre;
        selectMarcas.appendChild(option);
      });
    });

  // También puedes llamar a función para cargar productos acá
});

document.getElementById('formProducto').addEventListener('submit', function(e) {
  e.preventDefault();

  const formData = new FormData(this);

  fetch('insertar_producto.php', {
    method: 'POST',
    body: formData
  })
  .then(res => res.json())
  .then(data => {
    if(data.success){
      alert('Producto agregado correctamente');
      cargarProductos(); // función que recarga la tabla
      this.reset();
    } else {
      alert('Error: ' + data.error);
    }
  })
  .catch(err => alert('Error de red: ' + err));
});

function cargarProductos(){
  fetch('obtener_productos.php')
    .then(res => res.json())
    .then(data => {
      const tbody = document.querySelector('#tablaProductos tbody');
      tbody.innerHTML = ''; // limpiar tabla
      data.forEach(prod => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
          <td>${prod.id}</td>
          <td>${prod.nombre}</td>
          <td>${prod.categoria}</td>
          <td>${prod.marca}</td>
          <td>${prod.precio}</td>
          <td>${prod.cantidad}</td>
        `;
        tbody.appendChild(tr);
      });
    });
}

// Llamar a cargarProductos() cuando la página esté lista
document.addEventListener('DOMContentLoaded', cargarProductos);


