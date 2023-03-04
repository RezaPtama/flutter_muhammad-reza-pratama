# (8) Advance Funtion-Async-Await-Collection

## Anonymous Function

Anonynomus Function atau function tanpa nama juga bisa disebut sebagai `closure`, merupakan function yang umum digunakan sebagai nilai dalam `variabel` atau argumen pada `function`.

Deskripsi Anonymous Function :
- Tidak memiliki nama
- Fungsi sebagai data
 

Ditulis sebagai berikut : 
``` dart
()
{
    // perintah yang dijalankan saat fungsi di panggil
}
```

Example Code Anonymous Function

``` dart
var hello = (){ // Anonymous function
    print('Hello World');
};

var jumlah = (int a, int b){
    return a + b;
};

void main (){
    hello(); // Memanggil anonymous function
    print(jumlah(1,2));
}
```
Output
``` 
Hello World 
3
```

## Arrow Function

Arrow Function adalah fungsi yang dideklarasikan dengan tanda arrow (panah) `=>` tanpa menggunakan kata kunci `function` dalam syntax.

Deskripsi Arrow Fucntion
- Dapat memiliki nama atau tidak
- Berisi 1 data (dari proses maupun data statis)
- Nilai return fungsi diambil dari data tersebut
 

Contoh penulisan : 
```dart 
() => proses_yang_akan_dijalankan_saat_fungsi_dipanggil(); 
```

Code :
```dart
var hello = () => print('Hello World');
var jumlah = (int a, int b) => a + b;

void main(){
    hello();
    print(jumlah(1,2));
}
```

Output :
```
Hello World
3
```

Penjelasan 
- Fungsi hello melakukan print didalamnya
- Fungsi jumlah memberi nilai saat dijalankan sehingga dapat dilakukan print


## Async-Await

Async-await adalah fitur yang hadir sejak ES2017. Fitur ini mempermudah kita dalam menangani proses `Asynchronous`. Sebuah syntax khusus yang digunakan untuk menangani Promise agar penulisan code lebih efisien dan rapih

Deskripsi Async-Await :
- Menjalankan beberapa proses tanpa perlu menunggu
- proses ditulis dalam bentuk fungsi
- Await akan menunggu hingga proses async selesai
 

Contoh Code
```dart
Future<void> P1 () async{
    await Future.delayed(Duration(Seconds: 1), (){
        print('hello P1');
    })
}

void P2(){
    print('hello P2');
}

void main() async {
    await P1();
    P2();
}
```

Output
```
hello P1
hello P2
```

Penjelasan Function `P1` akan tampil terlebih dahulu walaupun sudah diberikan delay selama 1 second karena `await` dan Function `P2` akan tampil setelah Function `P1`

## Future
Future adalah sebuah class yang menginisiasi sebuah proses yang akan dijalankan secara `Asynchronous`. Future akan mengembalikan sebuah nilai ketika prosesnya selesai.

Deskripsi Future :
- Data yang dapat ditunggu
- Membawa data return dari fungsi async


Example Code Future
```dart
Future<String> P1(){
    return Future.delayed(Duration(seconds: 1),(){
        return 'hello P1';
    });
}

void main() async {
    var data = await P1();
    print(data);
}
```

Output
```
hello P1
```

Penjelasan
Future digunakan untuk return dan P1 menghasilkan Future yang di dalamnya terdapat sebuah String.

## Collection

Collection merupakan kumpulan data pada satu tempat. Collection adalah objek yang menyimpan banyak data seperti List, Set, dan Map.

### List
list untuk menyimpan data(elemen) secara

Example Code List 
``` dart
void main() async {
    var scores = [60,70,80,90,100];
    print(scores);
    
    for(var scores in scores){
        print(score);
    }
}
```

Output 
```
[60,70,80,90,100]
```

Penjelasan : Pembuatan list di tandai dengan `[]` pada looping `for` untuk mengambil seluruh value data pada List.

### Map
Map adalah objek `Collection` yang setiap elemennya berupa pasangan kunci `key` dan nilai `value`. Terdapat asosiasi antara `key` dan `value` pada setiap elemen yang terdapat didalam elemen map. Dalam satu objek map, `key` harus bersifat unik, namun tidak dengan `value`

Example Code
``` dart
void main() async {
    var student = {};
    student['name'] = 'Alex Under';
    student['age'] = 16;
    print(student);
    
    for(var key in student.keys){
        print(student[key]);
    }
}
```

Output
```
{name: Alex Under, age: 16}
Alex Under
16
```
Penjelasan : membuat map dengan menentukan `key` dan `value`, selanjutnya looping for untuk mengambil seluruh data pada list dengan menggunakan syntax 
```
nama_map.key
```