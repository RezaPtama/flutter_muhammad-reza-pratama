# (25) Introduction REST API - JSON serialization deserialization

Rest API (Representational State Transfeer Application Programming Interface)
**Pengertian**
`Rest API` secara terminologi, adalah istilah yang berasal dari dua kata, yaitu API, dan REST. API memenuhi standar yang ditentukan oleh gaya arsitektur REST, inilah yang disebut dengan REST API.


**Deskripsi**
- Arsitektural yang memisahkan tampilan dengan proses bisnis
- Bagian tampilan dengan proses bisni berkirim data melalui HTTP Request


### HTTP
**Deskripsi**
Protokol yang digunakan untuk berkirim daat pada internet, biasanya data tersebut berbentuk media web.

**Struktur Request**
- URL
Alamat halaman yang akan diakses
- Method
Menunjukkan aksi yang diinginkan
- Header
Informasi tambahan terkait request yang dikirimkan
- Body
Data yang disertakan bersama request

### DIO
**Pengertian**
Dimanfaatkan untuk melakukan REST API

**Instalisasi**
menambahkan package pada `pubspec.yaml`
atau dengan cara
```sh
flutter pub add dio
```

### Serialisasi JSON

**Mengubah struktur data ke bentuk JSON**
menggunakan fungsi `jsonEncode` dari package `dart:convert`

**Mengubah Json ke struktur data**
Menggunakan `jsonDecode` dari package `dart:convert`