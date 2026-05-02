// ============================================================
//  Café Admin — Backend API
//  Stack: Node.js + Express + mysql2
//  Puerto: 3000
// ============================================================

const express = require('express');
const mysql   = require('mysql2/promise');
const cors    = require('cors');
const path    = require('path');

const app = express();

// ── Middleware ───────────────────────────────────────────────
app.use(cors());
app.use(express.json());

// Sirve los archivos estáticos (index.html, styles/, scripts/)
// desde la misma carpeta donde está server.js
app.use(express.static(path.join(__dirname, 'public')));

// ── Conexión MySQL ───────────────────────────────────────────
const pool = mysql.createPool({
  host:               'localhost',
  port:               3306,
  user:               'root',         // ← cambia si usas otro usuario
  password:           '',             // ← tu contraseña de MySQL
  database:           'restaurant_db',
  waitForConnections: true,
  connectionLimit:    10,
});

// Helper: responder error 500 de forma uniforme
function handleError(res, err) {
  console.error(err);
  res.status(500).json({ error: err.message });
}

// ============================================================
//  USERS
// ============================================================

// GET  /api/users  → todos los usuarios
app.get('/api/users', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT user_id, name, email, password_hash FROM `USER`');
    res.json(rows);
  } catch (err) { handleError(res, err); }
});

// POST /api/users  → crear usuario
app.post('/api/users', async (req, res) => {
  try {
    const { name, email, password_hash } = req.body;
    const [result] = await pool.query(
      'INSERT INTO `USER` (name, email, password_hash) VALUES (?, ?, ?)',
      [name, email, password_hash]
    );
    res.status(201).json({ user_id: result.insertId });
  } catch (err) { handleError(res, err); }
});

// PUT  /api/users/:id  → editar usuario
app.put('/api/users/:id', async (req, res) => {
  try {
    const { name, email, password_hash } = req.body;
    await pool.query(
      'UPDATE `USER` SET name=?, email=?, password_hash=? WHERE user_id=?',
      [name, email, password_hash, req.params.id]
    );
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// DELETE /api/users/:id  → eliminar usuario
app.delete('/api/users/:id', async (req, res) => {
  try {
    await pool.query('DELETE FROM `USER` WHERE user_id=?', [req.params.id]);
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// ============================================================
//  ADDRESSES
// ============================================================

// GET  /api/addresses
app.get('/api/addresses', async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT a.address_id, a.user_id, u.name AS user_name,
             a.street, a.neighborhood, a.city, a.state, a.postal_code
      FROM ADDRESS a
      JOIN \`USER\` u ON a.user_id = u.user_id
    `);
    res.json(rows);
  } catch (err) { handleError(res, err); }
});

// POST /api/addresses
app.post('/api/addresses', async (req, res) => {
  try {
    const { user_id, street, neighborhood, city, state, postal_code } = req.body;
    const [result] = await pool.query(
      'INSERT INTO ADDRESS (user_id, street, neighborhood, city, state, postal_code) VALUES (?,?,?,?,?,?)',
      [user_id, street, neighborhood, city, state, postal_code]
    );
    res.status(201).json({ address_id: result.insertId });
  } catch (err) { handleError(res, err); }
});

// PUT  /api/addresses/:id
app.put('/api/addresses/:id', async (req, res) => {
  try {
    const { user_id, street, neighborhood, city, state, postal_code } = req.body;
    await pool.query(
      'UPDATE ADDRESS SET user_id=?, street=?, neighborhood=?, city=?, state=?, postal_code=? WHERE address_id=?',
      [user_id, street, neighborhood, city, state, postal_code, req.params.id]
    );
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// DELETE /api/addresses/:id
app.delete('/api/addresses/:id', async (req, res) => {
  try {
    await pool.query('DELETE FROM ADDRESS WHERE address_id=?', [req.params.id]);
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// ============================================================
//  TABLES (mesas)
// ============================================================

// GET  /api/tables
app.get('/api/tables', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM TABLES ORDER BY table_number');
    res.json(rows);
  } catch (err) { handleError(res, err); }
});

// POST /api/tables
app.post('/api/tables', async (req, res) => {
  try {
    const { table_number, capacity } = req.body;
    const [result] = await pool.query(
      'INSERT INTO TABLES (table_number, capacity) VALUES (?,?)',
      [table_number, capacity]
    );
    res.status(201).json({ table_id: result.insertId });
  } catch (err) { handleError(res, err); }
});

// PUT  /api/tables/:id
app.put('/api/tables/:id', async (req, res) => {
  try {
    const { table_number, capacity } = req.body;
    await pool.query(
      'UPDATE TABLES SET table_number=?, capacity=? WHERE table_id=?',
      [table_number, capacity, req.params.id]
    );
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// DELETE /api/tables/:id
app.delete('/api/tables/:id', async (req, res) => {
  try {
    await pool.query('DELETE FROM TABLES WHERE table_id=?', [req.params.id]);
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// ============================================================
//  PRODUCTS
// ============================================================

// GET  /api/products
app.get('/api/products', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM PRODUCT ORDER BY name');
    res.json(rows);
  } catch (err) { handleError(res, err); }
});

// POST /api/products
app.post('/api/products', async (req, res) => {
  try {
    const { name, description, price } = req.body;
    const [result] = await pool.query(
      'INSERT INTO PRODUCT (name, description, price) VALUES (?,?,?)',
      [name, description || null, price]
    );
    res.status(201).json({ product_id: result.insertId });
  } catch (err) { handleError(res, err); }
});

// PUT  /api/products/:id
app.put('/api/products/:id', async (req, res) => {
  try {
    const { name, description, price } = req.body;
    await pool.query(
      'UPDATE PRODUCT SET name=?, description=?, price=? WHERE product_id=?',
      [name, description || null, price, req.params.id]
    );
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// DELETE /api/products/:id
app.delete('/api/products/:id', async (req, res) => {
  try {
    await pool.query('DELETE FROM PRODUCT WHERE product_id=?', [req.params.id]);
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// ============================================================
//  ORDERS
// ============================================================

// GET  /api/orders  → con nombre de usuario y número de mesa
app.get('/api/orders', async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT o.order_id, o.order_date, o.status,
             o.user_id,  u.name        AS user_name,
             o.table_id, t.table_number
      FROM \`ORDER\` o
      JOIN \`USER\`  u ON o.user_id  = u.user_id
      JOIN TABLES   t ON o.table_id = t.table_id
      ORDER BY o.order_date DESC, o.order_id DESC
    `);
    res.json(rows);
  } catch (err) { handleError(res, err); }
});

// POST /api/orders
app.post('/api/orders', async (req, res) => {
  try {
    const { user_id, table_id, order_date, status } = req.body;
    const [result] = await pool.query(
      'INSERT INTO `ORDER` (user_id, table_id, order_date, status) VALUES (?,?,?,?)',
      [user_id, table_id, order_date, status || 'pending']
    );
    res.status(201).json({ order_id: result.insertId });
  } catch (err) { handleError(res, err); }
});

// PUT  /api/orders/:id
app.put('/api/orders/:id', async (req, res) => {
  try {
    const { user_id, table_id, order_date, status } = req.body;
    await pool.query(
      'UPDATE `ORDER` SET user_id=?, table_id=?, order_date=?, status=? WHERE order_id=?',
      [user_id, table_id, order_date, status, req.params.id]
    );
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// DELETE /api/orders/:id
app.delete('/api/orders/:id', async (req, res) => {
  try {
    await pool.query('DELETE FROM `ORDER` WHERE order_id=?', [req.params.id]);
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// ============================================================
//  ORDER DETAILS
// ============================================================

// GET  /api/order-details
app.get('/api/order-details', async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT od.detail_id, od.order_id, od.product_id,
             p.name AS product_name,
             od.quantity, od.unit_price,
             (od.quantity * od.unit_price) AS subtotal
      FROM ORDER_DETAIL od
      JOIN PRODUCT p ON od.product_id = p.product_id
      ORDER BY od.order_id, od.detail_id
    `);
    res.json(rows);
  } catch (err) { handleError(res, err); }
});

// POST /api/order-details
app.post('/api/order-details', async (req, res) => {
  try {
    const { order_id, product_id, quantity, unit_price } = req.body;
    const [result] = await pool.query(
      'INSERT INTO ORDER_DETAIL (order_id, product_id, quantity, unit_price) VALUES (?,?,?,?)',
      [order_id, product_id, quantity, unit_price]
    );
    res.status(201).json({ detail_id: result.insertId });
  } catch (err) { handleError(res, err); }
});

// PUT  /api/order-details/:id
app.put('/api/order-details/:id', async (req, res) => {
  try {
    const { order_id, product_id, quantity, unit_price } = req.body;
    await pool.query(
      'UPDATE ORDER_DETAIL SET order_id=?, product_id=?, quantity=?, unit_price=? WHERE detail_id=?',
      [order_id, product_id, quantity, unit_price, req.params.id]
    );
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// DELETE /api/order-details/:id
app.delete('/api/order-details/:id', async (req, res) => {
  try {
    await pool.query('DELETE FROM ORDER_DETAIL WHERE detail_id=?', [req.params.id]);
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// ============================================================
//  INVENTORY MOVEMENTS
// ============================================================

// GET  /api/inventory
app.get('/api/inventory', async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT im.inventory_id, im.product_id, p.name AS product_name,
             im.movement_date, im.movement_type, im.quantity
      FROM INVENTORY_MOVEMENTS im
      JOIN PRODUCT p ON im.product_id = p.product_id
      ORDER BY im.movement_date DESC, im.inventory_id DESC
    `);
    res.json(rows);
  } catch (err) { handleError(res, err); }
});

// POST /api/inventory
app.post('/api/inventory', async (req, res) => {
  try {
    const { product_id, movement_date, movement_type, quantity } = req.body;
    const [result] = await pool.query(
      'INSERT INTO INVENTORY_MOVEMENTS (product_id, movement_date, movement_type, quantity) VALUES (?,?,?,?)',
      [product_id, movement_date, movement_type, quantity]
    );
    res.status(201).json({ inventory_id: result.insertId });
  } catch (err) { handleError(res, err); }
});

// PUT  /api/inventory/:id
app.put('/api/inventory/:id', async (req, res) => {
  try {
    const { product_id, movement_date, movement_type, quantity } = req.body;
    await pool.query(
      'UPDATE INVENTORY_MOVEMENTS SET product_id=?, movement_date=?, movement_type=?, quantity=? WHERE inventory_id=?',
      [product_id, movement_date, movement_type, quantity, req.params.id]
    );
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// DELETE /api/inventory/:id
app.delete('/api/inventory/:id', async (req, res) => {
  try {
    await pool.query('DELETE FROM INVENTORY_MOVEMENTS WHERE inventory_id=?', [req.params.id]);
    res.json({ ok: true });
  } catch (err) { handleError(res, err); }
});

// ── Iniciar servidor ─────────────────────────────────────────
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`✅  Servidor corriendo en http://localhost:${PORT}`);
  console.log(`📋  Panel de administración: http://localhost:${PORT}/index.html`);
});
