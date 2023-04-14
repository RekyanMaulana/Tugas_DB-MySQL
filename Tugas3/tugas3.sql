-- Soal 3.1
-- 1. Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko1]> select * from produk where harga_beli * stok > 20000000;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+

-- 2. Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko1]> select sum(stok - min_stok) as selisih from produk;
+---------+
| selisih |
+---------+
|      10 |
+---------+

-- 3. Tampilkan total asset produk secara keseluruhan
MariaDB [dbtoko1]> select sum(stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+

-- 4. Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko1]> select * from pelanggan where year(tgl_lahir) between 1999 and 2004;
+----+--------+---------------+------+-----------+------------+-------------------+----------+
| id | kode   | nama          | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id |
+----+--------+---------------+------+-----------+------------+-------------------+----------+
|  3 | 011103 | Sekar         | P    | Kediri    | 2001-09-08 | sekar@gmail.com   |        1 |
|  5 | 011105 | Pradana       | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 |
|  6 | 011106 | Gayatri Putri | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 |
+----+--------+---------------+------+-----------+------------+-------------------+----------+

-- 5. Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko1]> select * from pelanggan where year(tgl_lahir) = 1998;
+----+--------+--------------+------+------------+------------+------------------+----------+
| id | kode   | nama         | jk   | tmp_lahir  | tgl_lahir  | email            | kartu_id |
+----+--------+--------------+------+------------+------------+------------------+----------+
|  2 | 011102 | Pandan Wangi | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com |        2 |
+----+--------+--------------+------+------------+------------+------------------+----------+

-- 6. Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko1]> select * from pelanggan where month(tgl_lahir) = 08;
+----+--------+--------------+------+------------+------------+-------------------+----------+
| id | kode   | nama         | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+--------------+------+------------+------------+-------------------+----------+
|  2 | 011102 | Pandan Wangi | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |        2 |
|  5 | 011105 | Pradana      | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 |
+----+--------+--------------+------+------------+------------+-------------------+----------+

-- 7. Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbtoko1]> select nama, tmp_lahir, tgl_lahir, (year(now())-year(tgl_lahir)) as umur from pelanggan;
+---------------+------------+------------+------+
| nama          | tmp_lahir  | tgl_lahir  | umur |
+---------------+------------+------------+------+
| Agung         | Bandung    | 1997-09-06 |   26 |
| Pandan Wangi  | Yogyakarta | 1998-08-07 |   25 |
| Sekar         | Kediri     | 2001-09-08 |   22 |
| Suandi        | Jakarta    | 1997-09-08 |   26 |
| Pradana       | Jakarta    | 2001-08-01 |   22 |
| Gayatri Putri | Jakarta    | 2002-09-01 |   21 |
+---------------+------------+------------+------+


--Soal 3.2
-- 1. Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko1]> select count(*) as lahir_1998 from pelanggan where year(tgl_lahir) = 1998;
+------------+
| lahir_1998 |
+------------+
|          1 |
+------------+

-- 2. Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko1]> select * from pelanggan where tmp_lahir = 'jakarta' and jk = 'p';
+----+--------+---------------+------+-----------+------------+-------------------+----------+
| id | kode   | nama          | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id |
+----+--------+---------------+------+-----------+------------+-------------------+----------+
|  6 | 011106 | Gayatri Putri | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 |
+----+--------+---------------+------+-----------+------------+-------------------+----------+

-- 3. Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbtoko1]> select sum(stok) from produk where harga_jual < 10000;
+-----------+
| sum(stok) |
+-----------+
|         5 |
+-----------+

-- 4. Ada berapa produk yang mempunyai kode awal K
MariaDB [dbtoko1]> select count(*) from produk where kode like 'K%';
+----------+
| count(*) |
+----------+
|        1 |
+----------+

-- 5. Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko1]> select avg(harga_jual) as harga_rata2 from produk where harga_jual > 1000000;
+-------------+
| harga_rata2 |
+-------------+
|     3500000 |
+-------------+

-- 6. Tampilkan jumlah stok yang paling besar
MariaDB [dbtoko1]> select max(stok) as max_stok from produk;
+----------+
| max_stok |
+----------+
|       10 |
+----------+

-- 7. Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko1]> select count(*) as kurang_dari_min_stok from produk where stok < min_stok;
+----------------------+
| kurang_dari_min_stok |
+----------------------+
|                    1 |
+----------------------+

-- 8. Berapa total asset dari keseluruhan produk
MariaDB [dbtoko1]> select sum(stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+


-- Soal 3.3
-- 1. Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
MariaDB [dbtoko1]> select id, nama, stok,
    -> case
    -> when stok < min_stok then 'segera belanja'
    -> else 'stok aman'
    -> end as keterangan
    -> from produk;
+----+------------+------+----------------+
| id | nama       | stok | keterangan     |
+----+------------+------+----------------+
|  1 | TV         |    3 | stok aman      |
|  2 | TV 21 Inch |   10 | stok aman      |
|  3 | Kulkas     |   10 | stok aman      |
|  4 | Meja Makan |    4 | stok aman      |
|  5 | Taro       |    3 | stok aman      |
|  6 | Teh Kotak  |    2 | segera belanja |
+----+------------+------+----------------+

-- 2. Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbtoko1]> select id, nama,
    -> (year(now())-year(tgl_lahir)) as umur,
    -> case
    -> when (year(now())-year(tgl_lahir)) < 17 then 'muda'
    -> when (year(now())-year(tgl_lahir)) >= 17 and (year(now())-year(tgl_lahir)) <= 55 then 'dewasa'
    -> else 'tua'
    -> end as kategori_umur
    -> from pelanggan;
+----+---------------+------+---------------+
| id | nama          | umur | kategori_umur |
+----+---------------+------+---------------+
|  1 | Agung         |   26 | dewasa        |
|  2 | Pandan Wangi  |   25 | dewasa        |
|  3 | Sekar         |   22 | dewasa        |
|  4 | Suandi        |   26 | dewasa        |
|  5 | Pradana       |   22 | dewasa        |
|  6 | Gayatri Putri |   21 | dewasa        |
+----+---------------+------+---------------+

-- 3. Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
MariaDB [dbtoko1]> select id, kode, nama,
    -> case
    -> when kode = 'TV01' then 'DVD Player'
    -> when kode = 'K001' then 'Rice Cooker'
    -> else 'Tidak ada'
    -> end as bonus
    -> from produk;
+----+------+------------+-------------+
| id | kode | nama       | bonus       |
+----+------+------------+-------------+
|  1 | TV01 | TV         | DVD Player  |
|  2 | TV02 | TV 21 Inch | Tidak ada   |
|  3 | K001 | Kulkas     | Rice Cooker |
|  4 | M001 | Meja Makan | Tidak ada   |
|  5 | T001 | Taro       | Tidak ada   |
|  6 | TK01 | Teh Kotak  | Tidak ada   |
+----+------+------------+-------------+


-- Soal 3.4
-- 1. Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbtoko1]> select tmp_lahir,
    -> count(*) as jumlah from pelanggan group by tmp_lahir;
+------------+--------+
| tmp_lahir  | jumlah |
+------------+--------+
| Bandung    |      1 |
| Jakarta    |      3 |
| Kediri     |      1 |
| Yogyakarta |      1 |
+------------+--------+

-- 2. Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko1]> select
    -> case
    -> when jenis_produk_id = 1 then 'elektronik'
    -> when jenis_produk_id = 2 then 'makanan'
    -> when jenis_produk_id = 3 then 'minuman'
    -> when jenis_produk_id = 4 then 'furniture'
    -> end as kategori, count(*) as jumlah from produk group by jenis_produk_id;
+------------+--------+
| kategori   | jumlah |
+------------+--------+
| elektronik |      3 |
| makanan    |      1 |
| minuman    |      1 |
| furniture  |      1 |
+------------+--------+

-- 3. Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbtoko1]> select nama
    -> from pelanggan
    -> where (year(now())-year(tgl_lahir)) < (select avg(year(now())-year(tgl_lahir)) from pelanggan);
+---------------+
| nama          |
+---------------+
| Sekar         |
| Pradana       |
| Gayatri Putri |
+---------------+

-- 4. Tampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbtoko1]> select nama
    -> from produk
    -> where harga_jual > (select avg(harga_jual) from produk);
+------------+
| nama       |
+------------+
| TV         |
| TV 21 Inch |
| Kulkas     |
+------------+

-- 5. Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbtoko1]> select nama
    -> from pelanggan
    -> where kartu_id
    -> in (select id from kartu where iuran > 90000);

-- 6. Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbtoko1]> select nama
    -> from produk
    -> where harga_jual < (select avg(harga_jual) from produk);
+------------+
| nama       |
+------------+
| Meja Makan |
| Taro       |
| Teh Kotak  |
+------------+

-- 7. Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko1]> select nama
    -> from pelanggan
    -> where kartu_id
    -> in (select id from kartu where diskon > 0.03);
+---------------+
| nama          |
+---------------+
| Agung         |
| Pandan Wangi  |
| Sekar         |
| Suandi        |
| Pradana       |
| Gayatri Putri |
+---------------+
