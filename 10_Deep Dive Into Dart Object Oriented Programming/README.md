# (10) Deep Dive Intro Dart Object Oriented Programming

## Constructor

Constructor adalah method khusus yang akan dieksekusi pada saat pembuatan objek `instance`. Biasanya mehto dini digunakan untuk inisialisasi atau mempersiapkan data untuk `instance`.

##### Deskripsi
- Method yang dijalankan saat pembuatan `Object`.
- Dapat menerima `parameter`.
- Tidak memiliki `return`.
- Nama sama dengan nama `class`.


Ex Code :
``` dart
class Student{
    var nama; 
    var kelas;
    
    Student(){  // ini adalah constructor
        nama = '';
        kelas = 0;
    }
}
```

## Inheritance

Inheritance/Pewarisan merupakan salah satu dari tiga konsep dasar OOP. Konsep inheritance ini mengadopsi dunia riil dimana suatu entitas/obyek dapat mempunyai entitas/obyek turunan. Dengan konsep inheritance, sebuah class dapat mempunyai class turunan.

##### Deskripsi
- Membuat class baru dengan memanfaatkan `class` yang sudah ada.
- Bertujuan agar kemampuan `class` yang sudah ada dapat dimiliki oleh `class` baru.


Ex Code : 
```dart
class Student{
    var nama; 
    var kelas;
    
    Student(){  // ini adalah constructor
        nama = 'Aldhi Ardiansyah';
        kelas = 0;
    }
}

class KelasA extends Student {
    KelasA(){
        nama = 'Muhammad Reza Pratama';
        kelas = 10;
    }
}

void main(){
    var kls1 = KelasA(); // Memanggil class KelasA()
    print(kls1.nama); // Menampilkan property nama dari class KelasA()

    var s1 = Student(); // Memanggil class Student()
    print (s1.nama); // Menampilkan property nama dari class Student()
}
```

Output
```
Muhammad Reza Pratama
Aldhi Ardiansyah
```

## Method Overriding

Method Overriding adalah metode yang dipakai ketika `Overriding` dalam bahasa pemrograman berorientasi objek ini akan disembunyikan keberadaannya, sehingga ketika seoran programmer akan menulis metode yang telah di-Overriding maka metode yang dipanggil adalah dari kelas turunan.

##### Deskripsi
- Menulis ulang method yang ada pada `super-class`.
- Bertujuan agar `class` memiliki `method` yang sama dengan proses yang berbeda.


Example Code :
```dart
class Student{
  jenisKelamin(){
    print('tidak diketahui');
    
  }

  prestasi(){
    print('belum ada prestasi');
  }
}

class KelasA extends Student {
  @override
  jenisKelamin() {
    print('laki-laki');
  }

  @override
  prestasi() {
    print('Juara OSN');
  }
}
```

##### Penjelasan
1. Dilakukan pada `class` yang melakukan `inheritance`.
2. Method sudah ada pada `class` induk
3. Method ditulis ulang seperti membuat `method` baru pada `child class`.
4. Ditambahkan tanda `@override` di baris sebelum method dibuat.
 

##### Penggunaannya
Proses membuat object dari class yang terjadi `inheritance` seperti pembuatan object pada umumnya

Example Code :
```dart
void main() {
  var k1 = KelasA();
  k1.jenisKelamin();
  k1.prestasi();

  var s1 = Student();
  s1.jenisKelamin();
  s1.prestasi();
}
```

Output :
```
laki-laki
Juara OSN
tidak diketahui
belum ada prestasi
```

## Interface

Interface merupakan sebuah kontrak ataupun perjanjian dari implementasi method atau fungsi. Bagi `class` yang menggunakan `interface`, `class` tersebut harus mengimplementasikan ulang seluruh fungsi yang ada di dalam `interface`

##### Deskripsi
- Berupa class.
- Menunjukkan method apa saja yang ada pada suatu class.
- Seluruh method wajib di-override.
- Digunakan dengan menggunkaan implements.

## Abstract Class

class abstrak ialah class yang memang tidak secara rinci mendefinisikan objek tertentu, sehingga class abstrak biasa dijadikan sebagai gambaran umum.

###### Deskripsi
- Berupa class abstrak.
- Menunjukkan method apa saja yang ada pada suatu class.
- Digunakan untuk mengunakan extends.
- Tidak dapat dibuat object.
- Tidak semua method harus di-override.

Example Code :
```dart
abstract class Hewan{
  reproduksi(){
    print('tidak diketahui');
  }

  bernapas(){
    print('tidak diketahui');
  }
}

class Kambing extends Hewan{
  @override
  reproduksi() {
    print('melahirkan');
  }
}

void main(){
  var k2 = Kambing();
  k2.reproduksi();
  k2.bernapas();
}
```

Output
```
melahirkan
tidak diketahui
```

## Polymorphism

##### Deskripsi
- Kemampuan data berubah menjadi bentuk lain
- Tipe data yang dapat digunakan adalah `Super Class`
- Dapat dilakukan pada class dengan `extends` atau `implements`

Example Code :
```dart
void main(){
    Hewan k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();
}
```

## Generics
Generics pada dasarnya adalah konsep untuk membuat suatu function, method, atau class agar bisa digunakan ulang untuk beberapa tipe data. Tipe data ini nantinya akan ditentukan ketika pemanggilan function, method atau class generic ini, sehingga tetap memastikan `Type-Safety` pada kode kita selagi memberi keleluasaan untuk menggunkaan ulang functions atau method yang ada pada suatu class untuk berbagai tipe data.

##### Deskripsi
- Dapat digunakan pada class atau fungsi
- Memberi kemampuan agar dapat menerima data dengan tipe yang berbeda.
- Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi.

##### Class dengan Generics
Example Code :
``` dart
class Hadiah<T>{
    var isi;
    Hadiah(T i){
        isi = i;
    }
}

void main(){
    var h1 = Hadiah<String>('mobil');
    print(h1.isi);
    
    var h2 = Hadiah<int>(10);
    print(h2.isi);
}
```
Output :
```
mobil 
10
```

##### Fungsi dengan Generics
Example Code :
```dart
void cekTipe<T>(T data){
    print(data.runtimeType);
}

void main(){
    cekTipe<String>('satu');
    cekTipe<int>(1);
}
```
Output :
```
satu
1
```