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
```
## 2. 🌐 Tambahkan Client NAS ke Table
Masukkan client NAS untuk mengizinkan semua IP 0.0.0.0/0 ke tabel nas:

```sql
INSERT INTO nas (
  nasname, shortname, type, ports, secret, server, community, description
) VALUES (
  '0.0.0.0/0', 'public', 'other', NULL, 'testing123', NULL, NULL, 'Allow all clients'
);
```
## 3. 👤 Tambahkan User test
Masukkan user dengan username dan password test ke tabel radcheck:

```sql
INSERT INTO radcheck (username, attribute, op, value)
VALUES ('test', 'Cleartext-Password', ':=', 'test');
```

## 4. 🐳 Jalankan Docker Compose
Jalankan docker compose untuk build dan menjalankan service:

```bash
docker-compose up --build -d
```