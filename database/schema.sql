-- =====================================================
-- CIRENG ISI - DATABASE SCHEMA (PostgreSQL)
-- =====================================================

-- 1. USERS TABLE (Pembeli & Admin)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(15),
  full_name VARCHAR(100),
  address TEXT,
  role ENUM('user', 'admin') NOT NULL DEFAULT 'user',
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. PRODUCTS TABLE (Varian Rasa Cireng)
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  base_price DECIMAL(10, 2) NOT NULL,
  category VARCHAR(50), -- 'cireng', 'addon'
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. CIRENG VARIANTS TABLE (6 Varian Rasa)
CREATE TABLE cireng_variants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  price DECIMAL(10, 2) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. ADD-ONS TABLE
CREATE TABLE addons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. ORDERS TABLE
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  order_number VARCHAR(50) NOT NULL UNIQUE,
  user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  total_amount DECIMAL(10, 2) NOT NULL,
  payment_method VARCHAR(50), -- 'cash', 'ewallet', 'transfer'
  order_type VARCHAR(20) NOT NULL, -- 'satuan', 'mix', 'dua_rasa'
  recipient_name VARCHAR(100),
  recipient_phone VARCHAR(15),
  recipient_email VARCHAR(100),
  recipient_address TEXT,
  status VARCHAR(20) DEFAULT 'pending', -- 'pending', 'diproses', 'selesai'
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. ORDER ITEMS TABLE
CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  order_id INT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  variant_id INT REFERENCES cireng_variants(id),
  quantity INT NOT NULL,
  unit_price DECIMAL(10, 2) NOT NULL,
  subtotal DECIMAL(10, 2) NOT NULL
);

-- 7. ORDER ADDONS TABLE
CREATE TABLE order_addons (
  id SERIAL PRIMARY KEY,
  order_id INT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  addon_id INT NOT NULL REFERENCES addons(id),
  quantity INT NOT NULL,
  unit_price DECIMAL(10, 2) NOT NULL,
  subtotal DECIMAL(10, 2) NOT NULL
);

-- 8. PAYMENTS TABLE
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  order_id INT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  amount DECIMAL(10, 2) NOT NULL,
  payment_method VARCHAR(50),
  payment_status VARCHAR(20) DEFAULT 'pending', -- 'pending', 'completed', 'failed'
  transaction_id VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 9. STATISTICS TABLE (untuk cache statistik)
CREATE TABLE statistics (
  id SERIAL PRIMARY KEY,
  date_range VARCHAR(20), -- 'daily', 'weekly', 'monthly'
  date DATE,
  total_revenue DECIMAL(15, 2),
  total_orders INT,
  total_cireng_sold INT,
  total_addon_sold INT,
  payment_method_cash DECIMAL(15, 2),
  payment_method_ewallet DECIMAL(15, 2),
  payment_method_transfer DECIMAL(15, 2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 10. VARIANT STATISTICS TABLE (Rasa Favorit)
CREATE TABLE variant_statistics (
  id SERIAL PRIMARY KEY,
  variant_id INT NOT NULL REFERENCES cireng_variants(id),
  date DATE,
  quantity_sold INT DEFAULT 0,
  revenue DECIMAL(15, 2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- INDEXES untuk Performa
-- =====================================================
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created_at ON orders(created_at);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_addons_order_id ON order_addons(order_id);
CREATE INDEX idx_payments_order_id ON payments(order_id);
CREATE INDEX idx_statistics_date ON statistics(date);
CREATE INDEX idx_variant_stats_date ON variant_statistics(date);
