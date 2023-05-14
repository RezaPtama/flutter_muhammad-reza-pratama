# (20) Storages

## Penyimpanan Lokal (Local Storage)

**Deskripsi**
- Diperlukan untuk efisiensi penggunaan data internet
- Ada beberapa cara implementasi penyimpanan lokal, contohnya `Shared Preferences` dan `Local Database`


### Shared Preferences
**Deskripsi**
- Menyimpan data yang sederhana
- Penyimpanan dengan format key-value
- Menyimpan tipe data dasar seperti teks, angka dan boolean
- Contoh penggunaan shared preferences seperti menyimpan data login dan menyimpan riwayat pencarian

**Impelementasi**
1. Menambahkan package `Shared Preferences` pada pubspec.yaml dengan cara :
```dart
flutter pub add shared_preferences
```
2. Buat properti baru untuk `TextEditingController` dan tambahkan di setiap TextField
3. Buat method `dispose()` untuk menghindari kebocoran memori
4. Buat variabel baru untuk menyimpan `SharedPreference` nilai bool newUser
5. Buat method baru dengan nama `CheckLogin()`
6. Memanggil method checkLogin() di method `initState()`
7. Dalam onPressed ElevatedButton, buat variabel baru `username` untuk menampung input dari user
8. Buat setBool dan setString baru dalam blok kode if, dan buat navigasi untuk kehalaman HomePage