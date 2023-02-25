# (7) Branch, Looping, Function

## Branch (Percabangan)

Pengmbilan keputusan
### IF

Fungsi `if` memungkinkan untuk membuat perbandingan logis antara nilai dan apa yang diharapkan dengan menguji kondisi dan mengembalikan hasil jika `true` atau `false`

Fungsi `if` memerlukan nilai bool (dari operator logcal atau comparison)

```dart
if(true || false){
    //Proses jika nilai_bool adalah true
}
```

### IF-ELSE

Fungsi `if-else` adalah kondisi dimana jika pernyataan benar `True` maka akan di proses pada kondisi `if`. Jika penyataan salah `False` maka memproses pada kondisi `else`.

```dart
if(nilai_bool){
    // proses jika nilai_bool adalah true
}
else{
    // proses jika nilai_bool adalah false
}
```
### ELSE-IF

Fungsi `else-if` merupakan percabangan yang dapat dilakukan lebih dari satu kali dengan kondisi yang berbeda-beda, umumnya dilakukan antara kondisi `if` dan `else`. Menambah alternatif jika nilai bool adalah `false`, dan menambah pengujian nilai bool lain.

```dart
if(nilai_bool){
    // proses jika nilai_bool adalah true
}
else if(nilai_bool)
{
   // proses jika nilai_bool adalah false
   // dan nilai_bool adalah true
}
```

## Looping (Perulangan)

Looping merupakan pernyataan atau instruksi yang diberikan kepada komputer agar ia mau melakukan sesuatu entah itu memproses data, menampilkan data, atau yang lainnya secara berulang.

### For

Perulangan `for` adalah suatu bentuk proses pengulangan kegiatan pada suatu statement atau lebih secara berulan ulang selama yang dijadikan acuan tersebut terpenuhi dengan baik. Fungsi `for` Diketahui berapa kali perulangan terjadi, memerlukan nilai awal, memerlukan nilai bool, jika true maka perulangan dilanjutkan, memerlukan pengubah nilai.

```dart
for(nilai_awal; nilai_bool; pengubah_nilai_awal){
    // proses berulang jika nilai_bool adalah true
}
```

### While

Dalam kebanyakan bahasa pemrograman komputer `while loop` adalah pernyataan aliran kontrol yang memungkinkan kode dieksekusi berulang kali berdasarkan kondisi Boolean yang diberikan.

Fungsi `while` tidak diketahui berapa kali perulangan terjadi, memerlukan nilai bool

```dart
while(nilai_bool){
    // proses berulang jika nilai_bool adalah true
}
```
### Do-While

Perulangan `do-while` digunakan untuk mengulang *statement* sebanyak satu kali terlebih dahulu, kemudian mengecek *statement* didalam `while` apakah bernilai `true`, jika bernilai `true` maka akan diulang kembali, jika *statement* didalam `while` bernilai `false` maka perulangan akan berakhir.

``` dart
do{
    // proses berulang jika nilai_bool adalah true
} while(nilai_bool)
```

## Break dan Continue

Break dan Continue merupakan cara menghentikan perulangan yang sedang berlangsung.

- Perulangan menggunakan nilai bool untuk lanjut atau berhenti
- `Break` dan `Continue` dapat mengehentikan perulangan dengan mengabaikan nilai bool
- `Continue` dapat mengehentikan satu kali proses.

**Break** adalah kondisi untuk menghentikan seluruh proses perulangan tanpa terkecuali.
**Continue** adalah kondisi untuk mengehentikan satu kali proses perulangan saja.

## Fungsi

`function` adalah bagian dari program yang memiliki nama tertentu, digunakan untuk mengerjakan suatu pekerjaan tertentu, serta letaknya dipisahkan dari bagian program yang menggunakan fungsi tersebut.

Membuat fungsi
``` dart
tipe_data nama_fungsi(){
    // perintah yang dijalankan saat fungsi di panggil
}

int numbers(int angka){
    return angka * 1;
}
```

Memanggil Fungsi
``` dart
int numbers(int angka){
    return angka + 3;
}

void main(){
  var hasil = numbers(10);
  print(hasil);
}
```

**Output** :
```dart
13
```


Contoh lainnya

```dart
String siswa(String nama, int kelas){
    print('$nama adalah siswa kelas $kelas');
}

void main(){
    siswa('reza',10);
}
```

**Output** :
```dart
reza adalah siswa kelas 10
```



