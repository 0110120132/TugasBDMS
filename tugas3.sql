SOAL 3.2

1. Berapa jumlah pelanggan yang tahun lahirnya 1998
   SELECT COUNT(*) AS jumlah_pelanggan FROM pelanggan WHERE YEAR(tgl_lahir)IN(1998);
2. Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
   SELECT COUNT(*) AS jumlah_pelanggan FROM pelanggan WHERE jk=’p’ AND tmp_lahir =’jakarta’;
3. Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
   SELECT COUNT(*) AS jumlah_produk FROM produk WHERE harga_jual < 10000;
4. Ada berapa produk yang mempunyai kode awal K
   SELECT COUNT(*) as jumlah_produk FROM produk WHERE kode like 'K%';
5. Berapa harga jual rata-rata produk yang diatas 1jt
   SELECT AVG(harga_jual) AS rata2_harga FROM produk WHERE harga_jual > 1000000;
6. Tampilkan jumlah stok yang paling besar
   SELECT MAX(stok) AS jumlah_stok FROM produk;
7. Ada berapa produk yang stoknya kurang dari minimal stok
   SELECT MIN(stok) AS jumlah_stok FROM produk;
8. Berapa total asset dari keseluruhan produk
   SELECT SUM(harga_beli * stok) AS total_asset FROM produk;

SOAL 3.3

1. Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
   SELECT id, nama, stok, IF (stok <= min_stok, 'segera belanja', 'stok aman') AS status FROM produk;
2. Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
   SELECT id, nama_pelanggan, year(now()) - year(tgl_lahir) as umur, case when (year(now()) - year(tgl_lahir) <= 17) then 'Muda' when (year(now()) - year(tgl_lahir) between 17 and 55) then 'Dewasa' else 'Tua' end as kategori_umur from pelanggan;
3. Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
   SELECT id, kode, nama, case(kode) when 'TV01' then 'DVD Player' when 'K001' then 'Rice Cooker' else 'Tidak Ada' end as bonus from produk;

SOAL 3.4

1. Tampilkan data statistik jumlah tempat lahir pelanggan
   SELECT tmp_lahir, count(*) as jumlah from pelanggan group by tmp_lahir;
2. Tampilkan jumlah statistik produk berdasarkan jenis produk
   SELECT jenis_produk_id, count(*) as jumlah from produk group by jenis_produk_id;
3. Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
   SELECT kode, nama_pelanggan, jk, year(now()) - year(tgl_lahir) as umur from pelanggan where year(now()) - year(tgl_lahir) < (select avg(year(now()) - year(tgl_lahir)) from pelanggan);
4. Tampilkan data produk yang harganya diatas rata-rata harga produk
   SELECT kode, nama, stok, harga_jual from produk where harga_jual > (select avg(harga_jual) from produk);
5. Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
   SELECT nama_pelanggan, kartu_id as kartu from pelanggan where kartu_id in (select id from kartu where iuran> 90000);
6. Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
   SELECT kode, nama, stok, harga_jual from produk where harga_jual < (select avg(harga_jual) from produk);
7. Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
   SELECT nama_pelanggan, kartu_id as kartu from pelanggan where kartu_id in (select id from kartu where diskon > 0.03);
