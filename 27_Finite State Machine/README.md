# (27)Finite State Machine & Unit Testing

**Finite State Machine**
Mesin yang memeiliki sejumlah state, tiap state menunjukkan apa yang terjadi sebelumnya.
**Contoh**
Terdapat 3 states yang menunjukkan kejadian dalam suatu proses.
1. Iddle saat tidak terjadi proses
2. Running saat proses sedang berjalan
3. Error saat proses gagal diselesaikan


**Contoh Sukses**
Iddle berubah menjadi Running saat proses berjalan Running kembali menjadi iddle saat proses selesai

**Implementasi pada View_Model**
1. Membuat enum untuk masing-masing state
    - none saat iddle
    - loading saat running
    - error saat error
2. Membuat getter-setter untuk menyimpan state dari widget
3. Gunakan State, tiap proses yang perlu di state tersebut, dapat memanfaatkannya
 

**Implementasi pada Widget**
Perbedaan tampilan tiap state, informasi finite state dapat berguna unntuk menentukan seperti apa tampilan yang dimunculkan.
1. Saat state menunjukan `Running`, maka ditampilkan progress indicator
2. Saat state menunjukan `Iddle` setalah running maka ditampilkan data yang didapatkan
3.Saat state menunjukkan `Error` , maka ditampilkan pesan yang menunjukkan bahwa proses tidak dapat diselesaikan

## Mocking
1. Proses yang terkait dengan sistem eksternal dapat mempengaruhi berjalannya pengujian
2. pengaruh tersebut dapat mengganggu proses pengujian 
3. dilakukan mocking untuk menghindari masalah-masalah tersebut

**Cara Kerja Mocking**
1. Suatu object dibuat bentuk tiruannya
2. bentuk tiruan tersebut memiliki input dan output yang sama dengan yang asli
3. Bentuk tiruan menghilangkan ketergantungan pada sistem eksternal