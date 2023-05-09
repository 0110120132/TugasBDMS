Membuat trigger

delimiter $$
create trigger cek_status_pembayaran before insert on pembayaran
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
delimiter ;
insert into pembayaran(no_akutansi, tanggal, jumlah, ke, status_pembayaran, pesanan_id)
    -> values ('01101','2023-03-04',5000,1,'Lunas',1);
