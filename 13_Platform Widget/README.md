# (13) Platform Widget

### Material APP
Pengertian
- Widget dasar yang mengemas seluruh widget dalam aplikasi 
- Widget yang digunakan pada sistem
- Di-Import dari package:fluter/material.dart


#### Struktur
- Widget yang pertama kali dibuka, diletakan pada bagian `home`
- Mengatur halaman juga dapat dilakukan dengan menggunakan routes dan initialRoute 

### Scafold
Widget dasar untuk membangun sebuah halaman pada MaterialApp
#### Struktur
Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti

### CupertinoApp
- Widget dasar yang mengemas seluruh widget dalam aplikasi
- Widget yang digunakan pada sstem `IOS`
Di-import dari package:flutter/cupertino.dart

#### Struktur
- Variable _themeDark dibuat untuk menyimpan tema
- Diperlukan karena Cupertino tidak menyediakan `ThemeData.dark()` seperti pada Material
- Widget yang pertama kali dibuka, diletakkan pada bagian `home`


#### CupertinoPageScaffold
Widget dasar untuk membangun sebuah halaman pada CupertinoApp
#### Struktur
Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti