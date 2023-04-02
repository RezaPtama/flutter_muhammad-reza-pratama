# (17) Assets

Deskripsi
- File yang di bundled dan di deployed bersama dengan aplikasi
- Tipe-tipe assets, sepert : static data (JSON files), icons, images, dan font file(ttf)

Menentukan Assets
- flutter menggunakan `pubspec.yaml`
- `pubspec.yaml` terletak pada root project untuk mengidentifikasi assets yang dibutuhkan aplikasi
- Gunakan karakter `/` untuk memasukan semua assets dibawah satu directory name

### Image

Deskripsi
- `image` atau gambar akan membuat tampilan aplikasi menjadi lebih menarik
- Flutter mendukung format gambar seperti JPEG,WebP,GIF,Animated Web/GIF, PNG, BMP, dan WBMP
- Menampilkan gambar dari project assets dan internet

```dart
image.asset();
image.network();
AssetImage();
```
### Font
- Penggunaan font dengan style tertentu akan menjadi keunikan pada aplikasi
- Penentuan font yang mau dipakai biasanya oleh UI designer
- penerapan font menggunakan custom font atau dari package
 

Menggunakan dengan cara dari packages
masukan pada `dependencies` yaitu `google_fonts : ^2.2.0` lalu melakukan `$flutter pub get`
