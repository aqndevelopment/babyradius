# 📡 Panduan Setup FreeRADIUS dengan Session Timeout (Auto Disconnect)

Panduan ini menjelaskan langkah-langkah untuk:

1. Mengimpor skema tabel database (`schema.sql`)
2. Menambahkan client untuk semua IP (`0.0.0.0/0`)
3. Menambahkan user dengan koneksi berdurasi 1 jam (otomatis disconnect setelah itu)

---

## 1. 🛠 Import Table Schema

Pastikan database (misalnya bernama `radius`) sudah dibuat di MySQL/MariaDB. Kemudian impor file `schema.sql`:

```bash
mysql -u root -p radius < schema.sql