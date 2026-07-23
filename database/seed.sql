-- =====================================================
-- CIRENG ISI - SEED DATA
-- =====================================================

-- 1. INSERT CIRENG VARIANTS (6 Varian Rasa)
INSERT INTO cireng_variants (name, price, is_active) VALUES
('Ayam Suwir', 1000.00, TRUE),
('Teriyaki Ayam', 1000.00, TRUE),
('Keju', 1000.00, TRUE),
('Baso Pedas', 1000.00, TRUE),
('Sosis Pedas', 1000.00, TRUE),
('Usus Pedas', 1000.00, TRUE);

-- 2. INSERT ADD-ONS
INSERT INTO addons (name, price, is_active) VALUES
('Chili Oil', 2000.00, TRUE);

-- 3. INSERT ADMIN USER (Default)
INSERT INTO users (username, email, password_hash, full_name, role, is_active) VALUES
('admin_cireng', 'admin@cirengisi.com', '$2b$10$YourHashedPasswordHere', 'Admin Cireng Isi', 'admin', TRUE);

-- 4. INSERT SAMPLE USERS (For Testing)
INSERT INTO users (username, email, password_hash, full_name, phone_number, address, role, is_active) VALUES
('user1', 'user1@example.com', '$2b$10$YourHashedPasswordHere', 'Pembeli Satu', '081234567890', 'Jakarta', 'user', TRUE),
('user2', 'user2@example.com', '$2b$10$YourHashedPasswordHere', 'Pembeli Dua', '082345678901', 'Bandung', 'user', TRUE);
