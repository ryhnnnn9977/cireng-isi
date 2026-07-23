# 🍟 Cireng Isi - Sistem Pemesanan Web

Aplikasi web pemesanan Cireng Isi dengan 2 Role: **User (Pembeli)** dan **Admin (Penjual)**

## 📋 Fitur Utama

### Role User (Pembeli)
- ✅ Pemesanan dengan 3 paket (Satuan, Mix, 2 Rasa)
- ✅ Tambahan Chili Oil optional
- ✅ Input data diri & alamat pengiriman
- ✅ Multiple payment methods (Cash, E-Wallet, Transfer Bank)
- ✅ Konfirmasi pesanan real-time

### Role Admin (Penjual)
- ✅ Dashboard pesanan real-time
- ✅ Notifikasi suara/pop-up untuk pesanan baru
- ✅ Status pesanan tracking (Pending, Diproses, Selesai)
- ✅ Statistik pendapatan & varian rasa favorit
- ✅ Kalkulator penjualan manual

## 🏗️ Tech Stack

- **Backend**: Node.js + Express.js
- **Database**: MongoDB (Primary) + SQL Schema (PostgreSQL)
- **Frontend**: React.js + Tailwind CSS
- **Real-time**: Socket.io
- **Authentication**: JWT + Role-based Access Control
- **Notifications**: Nodemailer + Web Push

## 📁 Project Structure

```
cireng-isi/
├── backend/
│   ├── config/
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   ├── middleware/
│   ├── services/
│   ├── utils/
│   └── server.js
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   └── App.js
│   └── package.json
├── database/
│   ├── schemas/
│   ├── migrations/
│   └── seeds/
└── docs/
    └── API_DOCUMENTATION.md
```

## 🚀 Quick Start

1. Clone repository
2. Install dependencies: `npm install`
3. Setup environment variables
4. Run database migrations
5. Start development server

---

**Dibuat dengan ❤️ untuk Cireng Isi**
