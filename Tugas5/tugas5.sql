-- Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create procedure inputPelanggan(kode varchar(10), nama varchar(50), jk char(1), tmp_lahir varchar(30), tgl_lahir date, email varchar(30), kartu_id int(11))
    -> begin
    -> insert into pelanggan(kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id)
    -> values (kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id);
    -> end$$
Query OK, 0 rows affected (0.010 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call inputPelanggan('011107','Asep','L','Bandung','2002-08-09','budi@gmail.com',2);

-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create procedure showPelanggan()
    -> begin
    -> select * from pelanggan;
    -> end$$
Query OK, 0 rows affected (0.009 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call showPelanggan;
+----+--------+---------------+------+------------+------------+-------------------+----------+
| id | kode   | nama          | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+---------------+------+------------+------------+-------------------+----------+
|  1 | 011101 | Agung         | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 |
|  2 | 011102 | Pandan Wangi  | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |        2 |
|  3 | 011103 | Sekar         | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 |
|  4 | 011104 | Suandi        | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 |
|  5 | 011105 | Pradana       | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 |
|  6 | 011106 | Gayatri Putri | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 |
|  7 | 011107 | Asep          | L    | Bandung    | 2002-08-09 | budi@gmail.com    |        2 |
+----+--------+---------------+------+------------+------------+-------------------+----------+

-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create procedure inputProduk(kode varchar(10), nama varchar(45), harga_beli double, harga_jual double, stok int(11), min_stok int(11), jenis_produk_id int(11))
    -> begin
    -> insert into produk(kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id)
    -> values (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
    -> end$$
Query OK, 0 rows affected (0.009 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call inputProduk('KA01','Kipas Angin','500000','700000','10','3',1);

-- Buat fungsi showProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create procedure showProduk()
    -> begin
    -> select * from produk;
    -> end$$
Query OK, 0 rows affected (0.007 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call showProduk;
+----+------+-------------+------------+------------+------+----------+-----------------+
| id | kode | nama        | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV          |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch  |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas      |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan  |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro        |       4000 |       5000 |    3 |        2 |               2 |
|  7 | KA01 | Kipas Angin |     500000 |     700000 |   10 |        3 |               1 |
+----+------+-------------+------------+------------+------+----------+-----------------+

-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create procedure totalPesanan()
    -> begin
    -> select pelanggan.nama as nama_pelanggan, sum(pesanan.total) as total_pesanan from pelanggan
    -> join pesanan on pelanggan.id = pesanan.pelanggan_id
    -> group by pelanggan.nama;
    -> end$$
Query OK, 0 rows affected (0.008 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call totalPesanan;
+----------------+---------------+
| nama_pelanggan | total_pesanan |
+----------------+---------------+
| Agung          |        230000 |
+----------------+---------------+

-- tampilkan seluruh pesanan dari semua pelanggan
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create procedure seluruhPesanan()
    -> begin
    -> select pelanggan.nama, pesanan.tanggal, pesanan.total from pelanggan
    -> join pesanan on pelanggan.id = pesanan.pelanggan_id;
    -> end$$
Query OK, 0 rows affected (0.008 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> call seluruhPesanan;
+-------+------------+--------+
| nama  | tanggal    | total  |
+-------+------------+--------+
| Agung | 2023-03-03 | 200000 |
| Agung | 2022-02-02 |  30000 |
+-------+------------+--------+

-- buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)
MariaDB [dbtoko1]> create view pesanan_produk_vw as
    -> select pelanggan.id, pelanggan.kode, pelanggan.nama, pelanggan.jk as 'jenis_kelamin', pelanggan.kartu_id, produk.kode as 'kode_produk', produk.nama as 'nama_produk', pesanan.tanggal, pesanan.total
    -> from produk
    -> join pesanan
    -> on produk.id = pesanan.pelanggan_id
    -> join pelanggan
    -> on pelanggan.id = pesanan.pelanggan_id;
Query OK, 0 rows affected (0.005 sec)

MariaDB [dbtoko1]> select * from pesanan_produk_vw;
+----+--------+-------+---------------+----------+-------------+-------------+------------+--------+
| id | kode   | nama  | jenis_kelamin | kartu_id | kode_produk | nama_produk | tanggal    | total  |
+----+--------+-------+---------------+----------+-------------+-------------+------------+--------+
|  1 | 011101 | Agung | L             |        1 | TV01        | TV          | 2023-03-03 | 200000 |
|  1 | 011101 | Agung | L             |        1 | TV01        | TV          | 2022-02-02 |  30000 |
+----+--------+-------+---------------+----------+-------------+-------------+------------+--------+