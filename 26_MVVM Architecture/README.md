# (26) MVVM Architecture

**MVVM (MODEL-VIEW-VIEW MODEL)**
Memisahkan logic dengan tampilan (view) ke dalam `ViewModel`

**Keuntungan**
1. Jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan `ViewModel` yang sama
2. Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
3. Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian
 

## Struktur direktori
1. Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut
2. Tiap screen diletakkan dalam sebuah direktori yang di dalamnya terdapat `View` dan `ViewModel`

## Model
1. Bentuk data yang akan digunakan, dibuat dalam bentuk class
2. Data-data yang dimuat, diletakkan pada property

## View Model
1. Menyimpan data-data dan logic yang diperlukan halaman.
2. Jika widget lain memerlukan logic yang sama , dapat menggunakan ViewModel ini juga.