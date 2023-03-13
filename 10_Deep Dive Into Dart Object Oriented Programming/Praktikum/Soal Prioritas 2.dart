import 'dart:io';

class Matematika { // membuat class Matematika
  hasil(){ // membuat method hasil()
    print('Tidak Diketahui');
  }
}

class KelipatanPersekutuanTerkecil implements Matematika { // membuat class dengan mengimplementasikan dari class Matematika
  int x = 0; // atribut x
  int y = 0; // atribut y
  int z = 0; // atribut z
  
  @override // override
  hasil() { //mengambil method hasil dari class Matematika

  //rumus kelipatan Persekutuan Terkecil
  if (x > y) { 
  z = x;
  x = y;
  y = z;
 }
 for (z = y; z % x != 0 || z % y != 0; z++ );
 return z; // mengembalikan nilai z;
  }
}

class FaktorPersekutuanTerbesar implements Matematika { // membuat class dengan mengimplementasikan dari class Matematika
  int x = 0; // atribut x
  int y = 0; // atribut y
  int z = 0; // atribut z

  @override // override
  hasil() { //mengambil method hasil dari class Matematika
    
    //rumus Faktor Persekutuan Terbesar
    if(x > y){
      z = x;
      x = y;
      y = z;
    }
    while(x > 0){
      z = y % x;
      y = x;
      x = z;
    }
    return y; // mengembalikan nilai y

  }
}

void main() {
  var operation = FaktorPersekutuanTerbesar(); // mendeklrasikan var dengan nama operation dengan memanggil class FaktorPersekutuanTerbesar();
  operation.x = 34; // mengubah nilai x pada class FaktorPersekututanTerbesar
  operation.y = 51; // mengubah nilai y pada class FaktorPersekututanTerbesar
  stdout.write('KPK dari ${operation.x} dan ${operation.x} adalah : ');
  print(operation.hasil()); // memanggil method hasil dari class FaktorPersekutuanTerbesar

  var operation1 = KelipatanPersekutuanTerkecil();
  operation1.x = 16; // mengubah nilai x pada class KelipatanPersekutuanTerkecil
  operation1.y = 40; // mengubah nilai y pada class KelipatanPersekutuanTerkecil
  stdout.write('FPB dari ${operation1.x} dan ${operation1.x} adalah : ');
  print(operation1.hasil()); // memanggil method hasil dari class KelipatanPersekutuanTerkecil
}