class Matematika {
  hasil(){
    print('Tidak Diketahui');
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x = 0;
  int y = 0;
  int z = 0;
  @override
  hasil() {
  if (x > y) {
  z = x;
  x = y;
  y = z;
 }
 for (z = y; z % x != 0 || z % y != 0; z++ );
 return z;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x = 0;
  int y = 0;
  int z = 0;

  @override
  hasil() {
    // TODO: implement hasil
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
    return y;

  }
}

void main(List<String> args) {
  var operation = FaktorPersekutuanTerbesar();
  operation.x = 34;
  operation.y = 51;
  print(operation.hasil());

  var operation1 = KelipatanPersekutuanTerkecil();
  operation1.x = 16;
  operation1.y = 40;
  print(operation1.hasil());
}