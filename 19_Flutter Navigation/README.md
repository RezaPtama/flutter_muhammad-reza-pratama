# (19) Flutter Navigation
Navigation berfungsi untuk berpindah dari halaman satu ke halaman lain
### Navigation Dasar
- `Navigator.push()` perpindahan halaman ke routes tertentu
- `Navigator.pop()` Kembali ke halaman sebelumnya.


### Navigation dengan Named Routes
- `Navigator.pushNamed()` Perpindahan halaman menggunakan
- `Navigator.pop()` Kembali ke halaman sebelumnya

Mendaftarkan Route
```dart
initialRouter:'/',
routes: {
    "/": (_) => const HomeScreen(),
    "/about": (_) => const AboutScreen();
}
```

cara memanggil
```dart
Navigator.of(context).pushNamed('/about');
```