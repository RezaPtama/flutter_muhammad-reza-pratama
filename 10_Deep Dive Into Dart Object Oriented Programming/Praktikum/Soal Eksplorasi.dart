class Shape { //membuat class Shape
  getArea(){  // method getArea dalam class shape
    print('Tidak diketahui');
  }
   getPerimeter(){// method getPerimeter dalam class shape
    print('Tidak diketahui');
  }
}

class Circle implements Shape{ // class circle dengan mengimplementasikan dari class Shape
  int radius = 7; // atribut radius

@override // overide
 getArea(){ // mendeklarasikan method getArea dari class Shape
    double luas = 22 / 7 * this.radius * this.radius; // rumus luas linkaran
    print('Luas Circel : $luas'); // menampilkan hasil rumus
 }

 @override //overide
  getPerimeter() { // mendeklarasikan method getPerimeter dari class Shape 
    double keliling = 2 * 22 / 7 * this.radius; // rumus keliling lingkaran
    print('keliling Circel : $keliling'); // menampilkan hasil rumus

  }

}

class Square implements Shape { // class Square dengan mengimplementasikan dari class Shape
  int side = 5; // atribut side

  @override // overide
  getArea() { // mendeklarasikan method getArea dari class Shape
    int luas = this.side * this.side; // rumus luas persegi
    print('luas Square : $luas'); // menampilkan hasil rumus

  }

  @override // overide
  getPerimeter() { // mendeklarasikan method getPerimeter dari class Shape 
    int keliling = side * 4; // rumus keliling persegi
    print('keliling Square : $keliling');  // menampilkan hasil rumus

  }

}

class Rectangle implements Shape { // class Rectangle dengan mengimplementasikan dari class Shape
  int width = 5; // atribut width
  int height = 8; // atribut height

  @override // overide
  getArea() { // mendeklarasikan method getArea dari class Shape
    int luas = this.width * this.height; // rumus luas persegi panjang
    print('luas Rectangle : $luas'); // menampilkan hasil rumus

  }

  @override // overide
  getPerimeter() {  // mendeklarasikan method getPerimeter dari class Shape 
    int keliling = 2 * (width + height); // rumus keliling persegi panjang
    print('keliling Rectangle : $keliling'); // menampilkan hasil rumus

  }
}

void main() {
  var c = Circle(); // mendeklrasikan var dengan nama c dengan memanggil class Circle
  c.getArea(); // memanggil method getArea yang berada pada class Circle
  c.getPerimeter(); // memanggil method getPerimeter yang berada pada class Circle
  print('');
  var s = Square(); // mendeklrasikan var dengan nama c dengan memanggil class Square
  s.getArea(); // memanggil method getArea yang berada pada class Square
  s.getPerimeter(); // memanggil method getPerimeter yang berada pada class Square
  print('');
  var r = Rectangle(); // mendeklrasikan var dengan nama c dengan memanggil class Rectangle
  r.getArea(); // memanggil method getArea yang berada pada class Rectangle
  r.getPerimeter(); // memanggil method getPerimeter yang berada pada class Rectangle
}