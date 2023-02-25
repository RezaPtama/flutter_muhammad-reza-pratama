import 'dart:io';

String nilai1(int nilai, String nilaia, String nilaib, String nilaic) //function
{
 if(nilai > 70) // percabangan dengan logika if
  {
    return "Kamu mendapatkan $nilaia"; // mengembalikan nilai a
  }
  else if(nilai > 40) //nilai kurang dari 40
  {
    return "Kamu mendapatkan $nilaib"; //mengembalikan nilai b
  }
  else if(nilai > 0)
  {
    return "kamu mendapatkan $nilaic"; //mengembalikan nilai c
  }
  else
  {
    return ''; // mengembalikan nilai null
  }
}

void main()
{

  // Soal No 1

  print('Tugas Percabangan (Branch)\n');
  print('Menentukan Nilai\n');
  for(int i = 1; i <= 4 ; i++) //perulangan untuk menginput nilai
  {
  stdout.write("Masukan Nilai $i : ");
  int nilai = int.parse(stdin.readLineSync()!); // input nilai
  

  
  var nilaia = "Nilai A"; //mendeklrasikan nilai
  var nilaib = "Nilai B"; //mendeklrasikan nilai
  var nilaic = "Nilai C"; //mendeklrasikan nilai
 
  String penilaian = nilai1(nilai,nilaia,nilaib,nilaic); // memanggil Function
  
  print(penilaian); // menampilkan hasil 
  }

// Soal No 2

  print("Tugas Perulangan (Looping)\n");
  int a;
  print("Tampilkan Perulangan nilai 1-10 pada layar dengan menggunakan perulangan\n");

  //perulangan for
  print("perulangan for");
  for(a = 1 ; a <= 10 ; a++)
  {
    stdout.write('$a\t');
  }
  
  ///perulangan while
  print("\nperulangan while");
  var b = 1;
  while (b <= 10){
  stdout.write('$b\t');
  b++;  
  }
  //perulangan do-while
  print("\nperulangan do-while");
  var c = 1;
  do{
    stdout.write('$c\t');
    c++;
  } while (c <= 10);
    
} 


