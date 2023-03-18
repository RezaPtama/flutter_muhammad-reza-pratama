# (12) Installation Command Line Interface and Package Management in Flutter

## Flutter CLI
- Alat yang digunakan untuk berinteraksi dengan Flutter SDK
- Perintah dijalankan dalam terminal


### Important CLI Commands
- Flutter Doctor
Digunakan untuk menampilkan informasi software yang dibutuhkan flutter
```
flutter doctor
```
- Flutter Create
Perintah untuk membuat project aplikasi flutter baru di direktori tertentu
```
flutter create <nama_project>
```
- Flutter Run
Perintah untuk menjalankan project aplikasi di device yang tersedia seperti emulator atau website.
```dart
flutter run //emulator
flutter run -d chrome //web
```
- Flutter Emulator
Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuaka emulator atau membuat emulator baru
```
flutter emulators
flutter emulators --launch <Emulator_ID>
flutter emulators --create [--name <nama>]
```
- Flutter Channel
Perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukan channel yang digunakan saat ini.
```
flutter channel
```
### Flutter pub
- Flutter pub add
Untuk menambahkan packages ke dependencies yang ada di `pubspec.yaml`

```
flutter pub add <package_name>
```
- Flutter pub get
Untuk menginstall semua packages atau dependencies yang ada di `pubspec.yaml`

```
flutter pub get
```

- Flutter pub remove
Untuk menghapus packages di dependencies yang berada di `pubspec.yaml`

```
flutter pub remove <package_name>
```

### Flutter Build
Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke AppStore, PlaySoter, dll
```
flutter buiid <directory>
```

### Flutter Clean
Perintah untuk mengahapus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator
Perintah ini akan memperkecil ukuran project tersebut.

```
flutter clean
```

## Installation
### System Requrements
- Operating Systems: Windows 10 or later (64-bit), x86-64 based.
- Disk Space: 1.64 GB (does not include disk space for IDE/tools).
- Tools: Flutter depends on these tools being available in your environment.
- Windows PowerShell 5.0 or newer (this is pre-installed with Windows 10)
- Git for Windows 2.x, with the Use Git from the Windows Command Prompt option.

### Install Flutter SDK
- Peratama Download Flutter SDK
[Download Disini](https://docs.flutter.dev/get-started/install/windows#system-requirements)
- Ekstrak zip file
- Update path dalam Environment variable
- Masuk kedalam `Edit environment variables for your account`.
- Cari `path` dalam `User Variables`
- Tambahkan dengan menekan `new` dan masukan path `flutter\bin`