
// ============================================================
//  Café Admin — Frontend JS
//  Conecta el HTML al backend via fetch() a la API REST
// ============================================================

const API = '/api';   // base URL del backend

// ── Utilidades generales ─────────────────────────────────────

function showSection(id) {
  document.querySelectorAll('.section').forEach(s => s.classList.remove('active'));
  document.querySelectorAll('.nav-link').forEach(l => l.classList.remove('active'));
  document.getElementById(id)?.classList.add('active');
  document.querySelector(`[data-section="${id}"]`)?.classList.add('active');
}

function resetForm(formId) {
  document.getElementById(formId)?.reset();
  // limpiar campos readonly de PK
  document.querySelectorAll(`#${formId} input[readonly]`).forEach(i => i.value = '');
}

function showToast(msg, type = 'success') {
  const t = document.getElementById('toast');
  t.textContent = msg;
  t.className = `toast toast-${type} show`;
  setTimeout(() => t.classList.remove('show'), 3000);
}

// Petición genérica con manejo de errores
async function request(url, method = 'GET', body = null) {
  const opts = {
    method,
    headers: { 'Content-Type': 'application/json' },
  };
  if (body) opts.body = JSON.stringify(body);
  const res = await fetch(url, opts);
  if (!res.ok) {
    const err = await res.json().catch(() => ({ error: res.statusText }));
    throw new Error(err.error || res.statusText);
  }
  return res.json();
}

// Llenar un <select> con opciones desde un array
function fillSelect(selectId, items, valueKey, labelFn) {
  const sel = document.getElementById(selectId);
  if (!sel) return;
  const current = sel.value;
  sel.innerHTML = '<option value="">— seleccionar —</option>';
  items.forEach(item => {
    const opt = document.createElement('option');
    opt.value = item[valueKey];
    opt.textContent = labelFn(item);
    sel.appendChild(opt);
  });
  if (current) sel.value = current;
}

// ============================================================
//  USERS
// ============================================================

async function loadUsers() {
  try {
    const users = await request(`${API}/users`);
    const tbody = document.querySelector('#tbl-users tbody');
    tbody.innerHTML = users.length
      ? users.map(u => `
        <tr>
          <td>${u.user_id}</td>
          <td>${u.name}</td>
          <td>${u.email}</td>
          <td style="font-size:.78rem;word-break:break-all">${u.password_hash}</td>
          <td>
            <button class="btn btn-sm btn-secondary" onclick="editUser(${u.user_id})">✏️ Editar</button>
            <button class="btn btn-sm btn-danger"    onclick="deleteUser(${u.user_id})">🗑️ Borrar</button>
          </td>
        </tr>`).join('')
      : '<tr><td colspan="5" style="text-align:center;color:var(--muted)">Sin registros</td></tr>';

    // Actualizar selects de FK en Addresses y Orders
    fillSelect('addr-user_id', users, 'user_id', u => `${u.user_id} — ${u.name}`);
    fillSelect('ord-user_id',  users, 'user_id', u => `${u.user_id} — ${u.name}`);
  } catch (err) { showToast(`Error cargando usuarios: ${err.message}`, 'error'); }
}

async function saveUser() {
  try {
    const id    = document.getElementById('usr-user_id').value;
    const body  = {
      name:          document.getElementById('usr-name').value,
      email:         document.getElementById('usr-email').value,
      password_hash: document.getElementById('usr-password_hash').value,
    };
    if (id) {
      await request(`${API}/users/${id}`, 'PUT', body);
      showToast('Usuario actualizado ✔');
    } else {
      await request(`${API}/users`, 'POST', body);
      showToast('Usuario creado ✔');
    }
    resetForm('form-user');
    loadUsers();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function editUser(id) {
  try {
    const users = await request(`${API}/users`);
    const u = users.find(x => x.user_id === id);
    if (!u) return;
    document.getElementById('usr-user_id').value      = u.user_id;
    document.getElementById('usr-name').value          = u.name;
    document.getElementById('usr-email').value         = u.email;
    document.getElementById('usr-password_hash').value = u.password_hash;
    document.getElementById('form-user').scrollIntoView({ behavior: 'smooth' });
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function deleteUser(id) {
  if (!confirm('¿Eliminar este usuario? Se eliminarán también sus direcciones.')) return;
  try {
    await request(`${API}/users/${id}`, 'DELETE');
    showToast('Usuario eliminado');
    loadUsers();
    loadAddresses();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

// ============================================================
//  ADDRESSES
// ============================================================

async function loadAddresses() {
  try {
    const addrs = await request(`${API}/addresses`);
    const tbody = document.querySelector('#tbl-addresses tbody');
    tbody.innerHTML = addrs.length
      ? addrs.map(a => `
        <tr>
          <td>${a.address_id}</td>
          <td>${a.user_name} (${a.user_id})</td>
          <td>${a.street}</td>
          <td>${a.city}</td>
          <td>${a.state}</td>
          <td>${a.postal_code}</td>
          <td>
            <button class="btn btn-sm btn-secondary" onclick="editAddress(${a.address_id})">✏️ Editar</button>
            <button class="btn btn-sm btn-danger"    onclick="deleteAddress(${a.address_id})">🗑️ Borrar</button>
          </td>
        </tr>`).join('')
      : '<tr><td colspan="7" style="text-align:center;color:var(--muted)">Sin registros</td></tr>';
  } catch (err) { showToast(`Error cargando direcciones: ${err.message}`, 'error'); }
}

async function saveAddress() {
  try {
    const id   = document.getElementById('addr-address_id').value;
    const body = {
      user_id:      document.getElementById('addr-user_id').value,
      street:       document.getElementById('addr-street').value,
      neighborhood: document.getElementById('addr-neighborhood')?.value || '',
      city:         document.getElementById('addr-city').value,
      state:        document.getElementById('addr-state').value,
      postal_code:  document.getElementById('addr-postal_code').value,
    };
    if (id) {
      await request(`${API}/addresses/${id}`, 'PUT', body);
      showToast('Dirección actualizada ✔');
    } else {
      await request(`${API}/addresses`, 'POST', body);
      showToast('Dirección creada ✔');
    }
    resetForm('form-address');
    loadAddresses();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function editAddress(id) {
  try {
    const addrs = await request(`${API}/addresses`);
    const a = addrs.find(x => x.address_id === id);
    if (!a) return;
    document.getElementById('addr-address_id').value  = a.address_id;
    document.getElementById('addr-user_id').value     = a.user_id;
    document.getElementById('addr-street').value      = a.street;
    if (document.getElementById('addr-neighborhood'))
      document.getElementById('addr-neighborhood').value = a.neighborhood || '';
    document.getElementById('addr-city').value        = a.city;
    document.getElementById('addr-state').value       = a.state;
    document.getElementById('addr-postal_code').value = a.postal_code;
    document.getElementById('form-address').scrollIntoView({ behavior: 'smooth' });
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function deleteAddress(id) {
  if (!confirm('¿Eliminar esta dirección?')) return;
  try {
    await request(`${API}/addresses/${id}`, 'DELETE');
    showToast('Dirección eliminada');
    loadAddresses();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

// ============================================================
//  TABLES (mesas)
// ============================================================

async function loadTables() {
  try {
    const tables = await request(`${API}/tables`);
    const tbody  = document.querySelector('#tbl-tables tbody');
    tbody.innerHTML = tables.length
      ? tables.map(t => `
        <tr>
          <td>${t.table_id}</td>
          <td>${t.table_number}</td>
          <td>${t.capacity}</td>
          <td>
            <button class="btn btn-sm btn-secondary" onclick="editTable(${t.table_id})">✏️ Editar</button>
            <button class="btn btn-sm btn-danger"    onclick="deleteTable(${t.table_id})">🗑️ Borrar</button>
          </td>
        </tr>`).join('')
      : '<tr><td colspan="4" style="text-align:center;color:var(--muted)">Sin registros</td></tr>';

    // Actualizar select FK en Orders
    fillSelect('ord-table_id', tables, 'table_id', t => `Mesa ${t.table_number} (cap. ${t.capacity})`);
  } catch (err) { showToast(`Error cargando mesas: ${err.message}`, 'error'); }
}

async function saveTable() {
  try {
    const id   = document.getElementById('tbl-table_id').value;
    const body = {
      table_number: document.getElementById('tbl-table_number').value,
      capacity:     document.getElementById('tbl-capacity').value,
    };
    if (id) {
      await request(`${API}/tables/${id}`, 'PUT', body);
      showToast('Mesa actualizada ✔');
    } else {
      await request(`${API}/tables`, 'POST', body);
      showToast('Mesa creada ✔');
    }
    resetForm('form-table');
    loadTables();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function editTable(id) {
  try {
    const tables = await request(`${API}/tables`);
    const t = tables.find(x => x.table_id === id);
    if (!t) return;
    document.getElementById('tbl-table_id').value     = t.table_id;
    document.getElementById('tbl-table_number').value = t.table_number;
    document.getElementById('tbl-capacity').value     = t.capacity;
    document.getElementById('form-table').scrollIntoView({ behavior: 'smooth' });
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function deleteTable(id) {
  if (!confirm('¿Eliminar esta mesa?')) return;
  try {
    await request(`${API}/tables/${id}`, 'DELETE');
    showToast('Mesa eliminada');
    loadTables();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

// ============================================================
//  PRODUCTS
// ============================================================

async function loadProducts() {
  try {
    const prods = await request(`${API}/products`);
    const tbody = document.querySelector('#tbl-products tbody');
    tbody.innerHTML = prods.length
      ? prods.map(p => `
        <tr>
          <td>${p.product_id}</td>
          <td>${p.name}</td>
          <td>${p.description ?? '—'}</td>
          <td>$${parseFloat(p.price).toFixed(2)}</td>
          <td>
            <button class="btn btn-sm btn-secondary" onclick="editProduct(${p.product_id})">✏️ Editar</button>
            <button class="btn btn-sm btn-danger"    onclick="deleteProduct(${p.product_id})">🗑️ Borrar</button>
          </td>
        </tr>`).join('')
      : '<tr><td colspan="5" style="text-align:center;color:var(--muted)">Sin registros</td></tr>';

    // Actualizar selects FK en Order Details e Inventory
    fillSelect('od-product_id',  prods, 'product_id', p => `${p.product_id} — ${p.name}`);
    fillSelect('inv-product_id', prods, 'product_id', p => `${p.product_id} — ${p.name}`);
  } catch (err) { showToast(`Error cargando productos: ${err.message}`, 'error'); }
}

async function saveProduct() {
  try {
    const id   = document.getElementById('prod-product_id').value;
    const body = {
      name:        document.getElementById('prod-name').value,
      description: document.getElementById('prod-description').value || null,
      price:       document.getElementById('prod-price').value,
    };
    if (id) {
      await request(`${API}/products/${id}`, 'PUT', body);
      showToast('Producto actualizado ✔');
    } else {
      await request(`${API}/products`, 'POST', body);
      showToast('Producto creado ✔');
    }
    resetForm('form-product');
    loadProducts();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function editProduct(id) {
  try {
    const prods = await request(`${API}/products`);
    const p = prods.find(x => x.product_id === id);
    if (!p) return;
    document.getElementById('prod-product_id').value  = p.product_id;
    document.getElementById('prod-name').value         = p.name;
    document.getElementById('prod-description').value  = p.description ?? '';
    document.getElementById('prod-price').value        = p.price;
    document.getElementById('form-product').scrollIntoView({ behavior: 'smooth' });
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function deleteProduct(id) {
  if (!confirm('¿Eliminar este producto?')) return;
  try {
    await request(`${API}/products/${id}`, 'DELETE');
    showToast('Producto eliminado');
    loadProducts();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

// ============================================================
//  ORDERS
// ============================================================

async function loadOrders() {
  try {
    const orders = await request(`${API}/orders`);
    const tbody  = document.querySelector('#tbl-orders tbody');
    tbody.innerHTML = orders.length
      ? orders.map(o => `
        <tr>
          <td>${o.order_id}</td>
          <td>${o.order_date}</td>
          <td>${o.user_name} (${o.user_id})</td>
          <td>Mesa ${o.table_number}</td>
          <td><span class="badge badge-${o.status}">${o.status}</span></td>
          <td>
            <button class="btn btn-sm btn-secondary" onclick="editOrder(${o.order_id})">✏️ Editar</button>
            <button class="btn btn-sm btn-danger"    onclick="deleteOrder(${o.order_id})">🗑️ Borrar</button>
          </td>
        </tr>`).join('')
      : '<tr><td colspan="6" style="text-align:center;color:var(--muted)">Sin registros</td></tr>';

    // Actualizar select FK en Order Details
    fillSelect('od-order_id', orders, 'order_id',
      o => `#${o.order_id} — ${o.user_name} (${o.order_date})`);
  } catch (err) { showToast(`Error cargando órdenes: ${err.message}`, 'error'); }
}

async function saveOrder() {
  try {
    const id   = document.getElementById('ord-order_id').value;
    const body = {
      user_id:    document.getElementById('ord-user_id').value,
      table_id:   document.getElementById('ord-table_id').value,
      order_date: document.getElementById('ord-order_date').value,
      status:     document.getElementById('ord-status').value,
    };
    if (id) {
      await request(`${API}/orders/${id}`, 'PUT', body);
      showToast('Orden actualizada ✔');
    } else {
      await request(`${API}/orders`, 'POST', body);
      showToast('Orden creada ✔');
    }
    resetForm('form-order');
    loadOrders();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function editOrder(id) {
  try {
    const orders = await request(`${API}/orders`);
    const o = orders.find(x => x.order_id === id);
    if (!o) return;
    document.getElementById('ord-order_id').value   = o.order_id;
    document.getElementById('ord-user_id').value    = o.user_id;
    document.getElementById('ord-table_id').value   = o.table_id;
    document.getElementById('ord-order_date').value = o.order_date;
    document.getElementById('ord-status').value     = o.status;
    document.getElementById('form-order').scrollIntoView({ behavior: 'smooth' });
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function deleteOrder(id) {
  if (!confirm('¿Eliminar esta orden? Se eliminarán también sus detalles.')) return;
  try {
    await request(`${API}/orders/${id}`, 'DELETE');
    showToast('Orden eliminada');
    loadOrders();
    loadOrderDetails();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

// ============================================================
//  ORDER DETAILS
// ============================================================

async function loadOrderDetails() {
  try {
    const details = await request(`${API}/order-details`);
    const tbody   = document.querySelector('#tbl-order-details tbody');
    tbody.innerHTML = details.length
      ? details.map(d => `
        <tr>
          <td>${d.detail_id}</td>
          <td>#${d.order_id}</td>
          <td>${d.product_name}</td>
          <td>${d.quantity}</td>
          <td>$${parseFloat(d.unit_price).toFixed(2)}</td>
          <td>$${parseFloat(d.subtotal).toFixed(2)}</td>
          <td>
            <button class="btn btn-sm btn-secondary" onclick="editDetail(${d.detail_id})">✏️ Editar</button>
            <button class="btn btn-sm btn-danger"    onclick="deleteDetail(${d.detail_id})">🗑️ Borrar</button>
          </td>
        </tr>`).join('')
      : '<tr><td colspan="7" style="text-align:center;color:var(--muted)">Sin registros</td></tr>';
  } catch (err) { showToast(`Error cargando detalles: ${err.message}`, 'error'); }
}

async function saveDetail() {
  try {
    const id   = document.getElementById('od-detail_id').value;
    const body = {
      order_id:   document.getElementById('od-order_id').value,
      product_id: document.getElementById('od-product_id').value,
      quantity:   document.getElementById('od-quantity').value,
      unit_price: document.getElementById('od-unit_price').value,
    };
    if (id) {
      await request(`${API}/order-details/${id}`, 'PUT', body);
      showToast('Detalle actualizado ✔');
    } else {
      await request(`${API}/order-details`, 'POST', body);
      showToast('Detalle creado ✔');
    }
    resetForm('form-detail');
    loadOrderDetails();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function editDetail(id) {
  try {
    const details = await request(`${API}/order-details`);
    const d = details.find(x => x.detail_id === id);
    if (!d) return;
    document.getElementById('od-detail_id').value  = d.detail_id;
    document.getElementById('od-order_id').value   = d.order_id;
    document.getElementById('od-product_id').value = d.product_id;
    document.getElementById('od-quantity').value   = d.quantity;
    document.getElementById('od-unit_price').value = d.unit_price;
    document.getElementById('form-detail').scrollIntoView({ behavior: 'smooth' });
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function deleteDetail(id) {
  if (!confirm('¿Eliminar este detalle?')) return;
  try {
    await request(`${API}/order-details/${id}`, 'DELETE');
    showToast('Detalle eliminado');
    loadOrderDetails();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

// ============================================================
//  INVENTORY MOVEMENTS
// ============================================================

async function loadInventory() {
  try {
    const movs  = await request(`${API}/inventory`);
    const tbody = document.querySelector('#tbl-inventory tbody');
    tbody.innerHTML = movs.length
      ? movs.map(m => `
        <tr>
          <td>${m.inventory_id}</td>
          <td>${m.product_name}</td>
          <td>${m.movement_date}</td>
          <td><span class="badge badge-${m.movement_type.toLowerCase()}">${m.movement_type}</span></td>
          <td>${m.quantity}</td>
          <td>
            <button class="btn btn-sm btn-secondary" onclick="editMovement(${m.inventory_id})">✏️ Editar</button>
            <button class="btn btn-sm btn-danger"    onclick="deleteMovement(${m.inventory_id})">🗑️ Borrar</button>
          </td>
        </tr>`).join('')
      : '<tr><td colspan="6" style="text-align:center;color:var(--muted)">Sin registros</td></tr>';
  } catch (err) { showToast(`Error cargando inventario: ${err.message}`, 'error'); }
}

async function saveMovement() {
  try {
    const id   = document.getElementById('inv-inventory_id').value;
    const body = {
      product_id:    document.getElementById('inv-product_id').value,
      movement_date: document.getElementById('inv-movement_date').value,
      movement_type: document.getElementById('inv-movement_type').value,
      quantity:      document.getElementById('inv-quantity').value,
    };
    if (id) {
      await request(`${API}/inventory/${id}`, 'PUT', body);
      showToast('Movimiento actualizado ✔');
    } else {
      await request(`${API}/inventory`, 'POST', body);
      showToast('Movimiento registrado ✔');
    }
    resetForm('form-inventory');
    loadInventory();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function editMovement(id) {
  try {
    const movs = await request(`${API}/inventory`);
    const m = movs.find(x => x.inventory_id === id);
    if (!m) return;
    document.getElementById('inv-inventory_id').value  = m.inventory_id;
    document.getElementById('inv-product_id').value    = m.product_id;
    document.getElementById('inv-movement_date').value = m.movement_date;
    document.getElementById('inv-movement_type').value = m.movement_type;
    document.getElementById('inv-quantity').value      = m.quantity;
    document.getElementById('form-inventory').scrollIntoView({ behavior: 'smooth' });
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

async function deleteMovement(id) {
  if (!confirm('¿Eliminar este movimiento?')) return;
  try {
    await request(`${API}/inventory/${id}`, 'DELETE');
    showToast('Movimiento eliminado');
    loadInventory();
  } catch (err) { showToast(`Error: ${err.message}`, 'error'); }
}

// ============================================================
//  INICIALIZACIÓN — cargar todo al abrir la página
// ============================================================
document.addEventListener('DOMContentLoaded', () => {
  // Fecha de hoy como valor por defecto en campos date
  const today = new Date().toISOString().split('T')[0];
  document.querySelectorAll('input[type="date"]').forEach(i => {
    if (!i.value) i.value = today;
  });

  // Carga inicial de todas las tablas
  loadUsers();
  loadAddresses();
  loadTables();
  loadProducts();
  loadOrders();
  loadOrderDetails();
  loadInventory();
});