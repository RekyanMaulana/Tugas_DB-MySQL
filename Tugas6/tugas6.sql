-- Buatlah bisnis proses pembayaran dengan menggunakan trigers
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create trigger cek_status_pembayaran before insert on pembayaran
    -> for each row
    -> begin
    -> declare total_pesanan int;
    -> declare jumlah_pembayaran int;
    -> declare sisa_pembayaran int;
    -> select total into total_pesanan from pesanan where id = new.pesanan_id;
    -> select sum(jumlah) into jumlah_pembayaran from pembayaran where pesanan_id = new.pesanan_id;
    -> set sisa_pembayaran = total_pesanan - jumlah_pembayaran;
    -> if sisa_pembayaran <= 0 then
    -> update pembayaran set status_pembayaran = 'Lunas' where id = new.id;
    -> else
    -> update pembayaran set status_pembayaran = 'Belum Lunas' where id = new.id;
    -> end if;
    -> end;
    -> $$

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> insert into pembayaran(no_kuitansi, tanggal, jumlah, ke, status_pembayaran, pesanan_id)
    -> values ('NK01','2023-03-04',100000,1,'Belum Lunas',1);