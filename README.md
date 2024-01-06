# Aplikasi Daftar Belanja

![Banner](/docs_assets/docs_banner.jpg)

Ini adalah project tugas kuliah yang saya buat bersama anggota kelompok saya. Aplikasi daftar belanja ini menggunakan database MySQL untuk menyimpan data aplikasi. Aplikasi ini dibuat menggunakan Flutter versi 3.16.0 dan Dart versi 3.2.0

Cara menjalankan aplikasi ini:
1. Jalankan perintah `git clone https://github.com/naufal-alwi-p/daftar-belanja-app.git`
2. Di dalam folder project, jalankan perintah `flutter pub get` menggunakan terminal
3. Import file database [aplikasi_daftar_belanja.sql](/docs_assets/database_template/aplikasi_daftar_belanja.sql) ke server MySQL/MariaDB milik kalian
4. Copy & paste file [database_settings](/lib/settings/database_settings) ddi flder yang sama lalu ubah nama file-nya menjadi "database_settings.dart". Ganti isi property object _ConnectionSettings_ sesuai konfigurasi server database milik kalian.
5. Jalankan perintah `flutter run` di terminal untuk menjalankan aplikasi.

> #### Note
> Projek flutter ini menggunakan library **mysql1** dimana library ini tidak bisa bekerja di platform web. Untuk lebih jelasnya baca [di sini](https://pub.dev/packages/mysql1).