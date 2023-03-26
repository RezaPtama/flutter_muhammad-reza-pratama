# (16) Flutter Form (Form Input Button) and Advance Form

### Form
Deskripsi
- Menerima isian data dari pengguna
- Isian data dapat lebih dari satu

Keadaan form di simpan menggunakan
```dart
GlobalKey<FormState>
```

### Input
#### TextField
- Menerima Isian data dari pengguna
- Isian data dapat lebih dari satu

Data diambil menggunakan
```dart
TextEditingController()
```
#### Radio Button
- Memberi Opsi pada pengguna
- Hanya dapat memilih satu opsi

Data diambil menggunakan property dengan tipe data sesuai value pada radio

#### CheckBox
- Memberi opsi pada pengguna
- Dapat memilih beberapa opsi

Data diambil menggunkan property bertipe bool

#### Dropdown Button
- Memberi opsi pada pengguna
- Hanya dapat memiih satu opsi
- Opsi tidak dapat ditampilkan di awal hanya tampil jika ditekan

Data diambil menggunakan property dengan tipe data sesuai value pada
``` dart
DropdownMenuItem()
```

### Button
- Bersifat seperti tombol
- Dapat melakukan sesuatu saat ditekan

#### ElevatedButton
- Tombol yang timbul jika ditekan
- Jika ditekan, akan menjalankan `onPressed`
 

#### IconButton
- Tombol yang hanya menampilkan iicon 
- jika ditekan, akan menjalankan `onPressed`


### Interacitive Widgets
- Interaksi antara aplikasi dan user
- Mengumpulkan input dan feedback dari user


#### Date Picker
- Widget dimana user bisa memasukan tanggal
- Tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll.
 

Membuat Data Picker
- Menggunakan fungsi bawaan fluter `showDatePicker`
- Fungsi `showDatePicker` memiliki tipe data future
- Menampilkan dialog material design date picker
- Menambahkan packages `intl : ^0.17.0`
 

#### Color Picker
- Widget dimana user bisa memilih warna
- Penggunaan Color picker bisa digunakan untuk berbagai macam kondisi

Cara Membuat Color Picker
- Menggunakan Packages `flutter_colorpicker: ^1.0.3`
- Menambahkan fungsi `showDialog` di dalam `onPressed` dengan return widget `AlertDialog`
- Import packages `flutter_colorpicker` dalam file dart
- Widget yang dapat digunakan yaitu berupa BlockPicker, ColorPicker, dan SlidePicker

#### File Picker
- Kemampuan widget untuk mengakses storage
- Memilih dan membuka file

Cara membuat File Picker
- Menggunakan packages `file_picker` dan `open_file`
- Menambahkan packages `file_picker` dan `open_file` pada pubspec.yaml 
- Import packages `file_picker` dan `open_file`
- Membuat fungsi untuk mengexplore dan memilih files dari storage
- Memanggil fungsi _pickFile di dalam `onPressed`