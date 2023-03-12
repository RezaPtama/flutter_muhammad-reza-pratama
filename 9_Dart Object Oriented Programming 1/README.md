# (9) Dart Object Oriented Programming 1

`OOP` adalah konsep pemrograman yang berorientasi pada objek atau data untuk mengatur sebuah desain program.

##### kriteria :
- Program disusun dalam bentuk abstraksi `object`.
- Data dan proses diletakkan pada abstraksi tersebut.
 

##### Keuntungan OOP :
- Mudah di-troubleshoot.
- Mudah digunakan ulang.

##### Kekurangan OOP :
- Tidak efisien.
- Membutuhkan manajemen data yang ketat.
- Kemungkinan duplikasi.
 

## Prinsip OOP
1. Encapsulation.
2. Abstraction.
3. Inheritance.
4. Polymophism.

## Komponen
OOP memiliki bebearpa bagian diantaranya :
1. Class.
2. Object.
3. Property.
4. Method.
5. Interface.
6. Generics.
 

### Class

`Class` adalah cetak biru atau blueprint dari object. `Class` digunakan hanya untuk membuat kerangka dasar.

##### Deskripsi :
- Abstraksi dari sebuah benda 'object'.
- Memiliki ciri-ciri yang disebut. `property`.
- Memilii sifat dan kemampuuan yang disebut `method`.

##### Membuat Class
Membuat class harus menggunakan kata kunci `class`, harus memiliki nama, detail `class` diletakan dalam kurawal.

Ex Code :
```dart
class Students{
    // property
    // method
}
```

## Object

`Object` adalah hasil cetak dari `class` atau bisa juga disebut konkrit dari `class`.

##### Deskripsi
- Bentuk sebenernya dari `class`.
- Disebut juga instance of `class`.
- Diperlakukan seperti data.

Ex Code :
```dart
void main(){
    var s1 = Students(); 
    var s2 = Students(); 
    var s3 = Students(); 
}
```

## Property

Property adalah data yang terdapat dalam sebuah `class`. `Property` ini sebenernya hanyalah variabel yang terletak di dalam `class`. Seluruh aturan dan tipe data yang biasa diinput ke dalam `variabel`, juga bisa diinput kedalam property. Aturan tata cara penamaan `property sama dengan aturan penamaan `variabel`.

##### Deskripsi
- Ciri-ciri suatu `class`.
- Hal-hal yang dimiliki suatu `class`.
- Memiliki sifat seperti `variabel`.


Ex Code :
```dart
class Students(){
    String nama = 'Reza';
    int kelas = 10;
}

void main(){
//memanggil property dalam class
    var s1 = Students(); 
    print(s1.nama);
    print(s1.kelas);
}
```

Output :
```
Reza
10
```

## Method

Method adalah tindakan yang bisa dilakuakn di dalam `class`. Method pada dasarnya adalah `function` yang berada di dalam `class`. Seluruh sifat function bisa di terapkan ke dalam `method` seperti bisa di isi `parameter`, mengembalikan nilai 'return',

##### Deskripsi
- Sifat suatu `class`.
- Aktivitas yang dapat dikerjakan suatu `class`.
- Memiliki sifat seperti fungsi.
 

Ex Code :
```dart
class Students{
    void kelas(){
        print('Kelas 10');
    }
}
// menjalankan method
void main(){
    var1 s1  = Students();
    s1.kelas();
}
```

Output
```
Kelas 10
```