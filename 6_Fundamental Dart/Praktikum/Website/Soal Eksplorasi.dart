import "dart:io";


void main(){
    //Soal 1

    print('Soal Eksplorasi 1\n');
    print('Menentukan Kata Palindrom');

    for(int i = 1; i<=2;i++) {
    stdout.write('Masukan Kata : ');
    String kata = stdin.readLineSync();
    // String kata = "mobil balap";
  
    String palindrom;
    
    palindrom = kata.split('').reversed.join();
    
    if(palindrom == kata){
        
        print('Kata $kata merupakan kata palindrom jika dibalik adalah $palindrom');
        
    }
    else{
        print('Kata $kata bukan merupakan kata palindrom jika dibalik adalah $palindrom');
    }

    }

    print('\nSoal Eksplorasi 2 \n');
    print('Menentukan Faktor dari sebuah bilangan');
     int a;
  stdout.write("Masukan Angka : ");
  int n = int.parse(stdin.readLineSync());
  print('faktor bilangan dari $n');
  for(a = 1 ;a < n  ; a++){
    if(n%a == 0){
      print(a);
    }
  }
}