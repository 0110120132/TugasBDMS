1. Buat fungsi inputPelanggan(), setelah itu panggil fungsinya

2. Buat fungsi showPelanggan(), setelah itu panggil fungsinya
   delimiter $$
   create procedure showPelanggan()
   begin
   select * from pelanggan;
   end $$
   delimiter;

3. Buat fungsi inputProduk(), setelah itu panggil fungsinya

4. Buat fungsi showProduk(), setelah itu panggil fungsinya
   delimiter $$
   create procedure showProduk()
    -> begin
    -> select * from produk;
    -> end$$
   delimiter ;
   call showProduk;

5. Buat fungsi totalPesanan(), setelah itu panggil fungsinya

6. tampilkan seluruh pesanan dari semua pelanggan
   CREATE VIEW vw_pesanan_pelanggan
    -> as select a.id, a.tanggal, a.total, b.kode, b.nama as nama_pelanggan
    -> from pesanan a inner join pelanggan b
    -> on a.pelanggan_id = b.id;
