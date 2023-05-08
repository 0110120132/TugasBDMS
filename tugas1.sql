1. Membuat tabel produk dan isinya :

MariaDB [dbtoko1]> create table produk(
    -> id int not null auto_increment primary key,
    -> kode varchar(10),
    -> nama varchar(45),
    -> harga_beli double,
    -> harga_jual double,
    -> stok int,
    -> min_stok int,
    -> jenis_produk_id int not null references jenis_produk(id));
    
 2. Membuat tabel pesanan_items dan isinya :
 
 MariaDB [dbtoko1]> create table pesanan_items(
    -> id int not null auto_increment primary key,
    -> produk_id int not null references produk (id),
    -> pesanan_id int not null references pesanan (id),
    -> qty int,
    -> harga double);
 
 3. Membuat tabel pembelian dan isinya :
 
 MariaDB [dbtoko1]> create table pembelian(
    -> id int not null auto_increment primary key,
    -> tanggal varchar(45),
    -> nomor varchar(10),
    -> produk_id int not null references produk (id),
    -> jumlah int,
    -> harga double,
    -> vendor_id int not null references vendor (id));
    
 4. Membuat tabel vendor dan isinya :
 
 MariaDB [dbtoko1]> create table vendor(
    -> id int not null auto_increment primary key,
    -> nomor varchar(4),
    -> nama varchar(40),
    -> kota varchar(30),
    -> kontak varchar(30));
    
 5. Menambahkan kolom alamat pada table pelanggan
 
 MariaDB [dbtoko1]> alter table pelanggan
    -> add column if not exists
    -> alamat varchar(40);
    
 6. Mengubah nama menjadi nama_pelanggan pada table pelanggan
 
 MariaDB [dbtoko1]> alter table pelanggan
    -> change nama nama_pelanggan varchar(30);
    
7. Mengubah tipe data nama_pelanggan menjadi varchar(50)

MariaDB [dbtoko1]> alter table pelanggan
    -> modify nama_pelanggan varchar(50);
