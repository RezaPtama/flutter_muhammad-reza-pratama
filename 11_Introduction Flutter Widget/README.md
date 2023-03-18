# (11) Introduction Flutter Widget

### Fluter
Flutter adalah framework bersifat open source yang dikembangkan oleh Google untuk mengemabangkan aplikasi multi-platform yang digunakan untuk membuat aplikasi mobile, desktop, dan web hanya dengan satu codebase 


### Keunggulan Flutter
- Mudah digunakan dan dipelajari
- Produktivitas tinggi
- Dokumentasi lengkap
- Komunitas yang berkembang
- Performa Framework yang bagus
- Biaya pembuatan yang efektif
- Tersedia di berbagai pilihan aplikasi IDE
- Tampilan desain yang sangat bagus
- Mudah dipelajari

### Kekurangan Flutter
- Library pihak ketiga masih terbatas
- Ukuran aplikasi
- Memerlukan storage yang besar
- Memerlukan spek yang tinggi

## Command membuat dan menjalankan flutter
### Membuat project
Dilakukan dengan menjalankan perintah :
```sh
flutter create flutter_project
```
### Menjalankan Project
- Masuk kedalam direktori project
```sh 
cd \flutter_project
```
- Jalankan perintah
```sh
flutter run
```

### Widget
- Digunakan untuk membentuk antarmuka (UI)
- Berupa class
- Dapat terdiri dari beberapa widget lainnya

### Stateless Widget
- Tidak bergantung pada perubahan data
- Hanya fokus pada tampilan
- Dibuat dengan extends pada class StatelessWidget

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ),
      home: Scaffold(
      body : Text('Flutter Demo.)',
      )
    );
  }
}
```

### Stateful Widget
- Mementingkan pada perubahan data
- Dibuat dengan extends pada class StatefulWidget
- Menggunakan 2 class (widget dan state)

```dart
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    home: Scaffold(
        body: Text('This Is Stateful Widget')
     )
    )
  }
}
```

### Built in Widget
- Widget yang dapat langsung digunakan
- Sudah ter-install bersama flutter
 

## Jenis Jenis
- Material App
Membangun Aplikasi dengan desain material
- Scaffold
Membentuk sebuah halaman
- AppBar
Membentuk application bar yang terletak pada bagian atas halaman
- Text
Menampilkan Teks
- Icon
Menampilkan Icon


### Referensi
https://bamai.uma.ac.id/2022/09/07/flutter-kelebihan-dan-kekurangannya/#:~:text=Flutter%20adalah%20framework%20bersifat%20open,iOS%2C%20Desktop%2C%20dan%20Website.