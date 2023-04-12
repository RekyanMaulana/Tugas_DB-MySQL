-- Soal 2.1
-- 2. Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
MariaDB [dbtoko1]> select * from produk order by harga_jual desc;

-- 3. Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
MariaDB [dbtoko1]> select kode, nama, tmp_lahir, tgl_lahir from pelanggan;

-- 4. Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
MariaDB [dbtoko1]> select kode, nama, stok from produk where stok = 4;

-- 5. Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
MariaDB [dbtoko1]> select * from pelanggan where tmp_lahir = 'jakarta';

-- 6. Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
MariaDB [dbtoko1]> select kode, nama, tmp_lahir, tgl_lahir from pelanggan order by tgl_lahir desc;


-- Soal 2.2
-- 1. Tampilkan data produk yang stoknya 3 dan 10
MariaDB [dbtoko1]> select * from produk where stok = 3 or stok = 10;

-- 2. Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
MariaDB [dbtoko1]> select * from produk where harga_jual < 5000000 and harga_jual > 500000;

-- 3. Tampilkan data produk yang harus segera ditambah stoknya
MariaDB [dbtoko1]> select * from produk where min_stok > stok;

-- 4. Tampilkan data pelanggan mulai dari yang paling muda
MariaDB [dbtoko1]> select * from pelanggan order by tgl_lahir desc;

-- 5. Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
MariaDB [dbtoko1]> select * from pelanggan where tmp_lahir = 'jakarta' and jk = 'p';

-- 6. Tampilkan data pelanggan yang ID nya 2, 4 dan 6
MariaDB [dbtoko1]> select * from pelanggan where id in (2, 4, 6);

-- 7. Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta
MariaDB [dbtoko1]> select * from produk where harga_jual >= 500000 and harga_jual <= 6000000;


-- Soal 2.3
-- 1. Tampilkan produk yang kode awalnya huruf K dan huruf M
MariaDB [dbtoko1]> select * from produk where kode like 'K%' or kode like 'M%';

-- 2. Tampilkan produk yang kode awalnya bukan huruf M
MariaDB [dbtoko1]> select * from produk where kode not like 'M%';

-- 3. Tampilkan produk-produk televisi
MariaDB [dbtoko1]> select * from produk where kode like 'TV%';

-- 4. Tampilkan pelanggan mengandung huruf 'SA'
MariaDB [dbtoko1]> select * from pelanggan where nama like '%SA%';

-- 5. Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
MariaDB [dbtoko1]> select * from pelanggan where tmp_lahir != 'jakarta' and tmp_lahir like '%yo%';

-- 6. Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
MariaDB [dbtoko1]> select * from pelanggan where nama like '_a%';


-- Soal 2.4
-- 1. Tampilkan 2 data produk termahal
MariaDB [dbtoko1]> select * from produk order by harga_beli desc limit 2;

-- 2. Tampilkan produk yang paling murah
MariaDB [dbtoko1]> select * from produk order by harga_beli limit 1;

-- 3. Tampilkan produk yang stoknya paling banyak
MariaDB [dbtoko1]> select * from produk order by stok desc limit 1;

-- 4. Tampilkan dua produk yang stoknya paling sedikit
MariaDB [dbtoko1]> select * from produk order by stok limit 1;

-- 5. Tampilkan pelanggan yang paling muda
MariaDB [dbtoko1]> select * from pelanggan order by tgl_lahir desc limit 1;

-- 6. Tampilkan pelanggan yang paling tua
MariaDB [dbtoko1]> select * from pelanggan order by tgl_lahir limit 1;