import 'dart:io';
void main(){

  // Soal No 1
  print('Soal No 1\n');
  print('Menentukan Bilangan Prima\n');

  for(int i = 1; i<=2; i++){
  stdout.write('Masukan Angka : ');
  int n = int.parse(stdin.readLineSync()); // input angka
  bool angka_prima = true; //boolean 

  //logika untuk menentukan bilangan prima
  if(n == 0 || n == 1){ //logika agar n tidak diisi 0 dan 1
    angka_prima = false; //mendeklarasikan false
  }
  else{
    for (int i = 2; i <= n/2; i++){ // perulangan untuk menentukan bilangan prima
      if(n % i == 0){ //logika untuk bilangan prima
      angka_prima = false; //mendeklarasikan false
      break; //menghentikan paksa perulangan
      }
    }
  }

  //logika untuk menentukan bilangan prima
  if(angka_prima){  // jika variabel true
    print('$n adalah bilangan prima'); //menampilkan hasil jika boolean true
  }
  else{
    print('$n bukan bilangan prima'); //menampilkan hasil jika boolean false
  }

  }
  //soal No 2
  print('\nSoal No 2');
  print('\nTabel Perkalian \n');

  List<int> perkalian = [1,2,3,4,5,6,7,8,9,10]; //list integer
  stdout.write('*');
  for(int a = 1; a<=10; a++){ //perulangan untuk menampilkan 1-10
    stdout.write('\t$a'); //menampilkan 1-10 menyamping
  }
  print('');
  for(int i=0;i<10; i++){ // perulangan 1 untuk menampilkan tabel perkalian

    stdout.write('${perkalian[i]}\t'); //menampilkan 1-10 menurun
    
    for(int j=0;j<10; j++) //perulangan 2 untuk menampilkan tabel perkalian
    {
      stdout.write(perkalian[i] * perkalian[j]); //menampilkan tabel perkalian dengan mengkalikan perulangan 1 dan perulangan 2
      stdout.write('\t');
    }
    stdout.write('\n');
    
  }
}