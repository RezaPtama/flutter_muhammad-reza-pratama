// Membuat class hewan
class Hewan{
  int berat; // Property berat

  Hewan({ // constructur
    this.berat = 0, // untuk menyimpan data berat
  });
}

class Mobil{ // Class mobil
  int kapasitas = 1000; // property kapasitas untuk muatan mobil
  List <Hewan> muatan = []; // property List muatan yang mengambil property dari class Hewan


 

  void tambahMuatan(int tambah){ // method untuk menambah muatan dengan parameter tambah
    int total = 0;
      for(int i = 0;i<muatan.length;i++) //perulangan untuk List muatan
    {
      total = total + muatan[i].berat; // untuk menambahkan semua value dalam List Muatan
    }

    if(kapasitas >= total && total + tambah <= kapasitas){ // Branch if kondisi untuk menambahkan muatan
      print('Kapasitas Muatan Tersedia : ${kapasitas - total} KG'); //menampilkan sisa kapasitas yang tersedia
      print('Menambah Muatan $tambah KG\n'); //menampilkan muatan yang ditambah
      muatan.add(Hewan(berat: tambah)); // menambahkan muatan kedalam List muatan
    }
    else{ // Kondisi jika kapasitas muatan tidak mencukupi
      print('Kapasitas Muatan Tidak Mencukupi\n');
    }

    
  }

  void totalMuatan(){ // method dari total muatan
    int total = 0; 
    for(int j = 0; j<muatan.length;j++){ ///perulangan untuk List muatan
      total = muatan[j].berat + total; // untuk menambahkan semua value dalam List Muatan
    }
    print('Total Muatan Mobil adalah : $total KG\n'); //menampilkan total muatan yang dalam List
  }
  
}

void main(){
var muatan = Mobil(); //memanggil class Mobil 
  print('Kapasitas Muatan Mobil ${muatan.kapasitas} KG\n'); //menampilkan Kapasitas tampung mobil

  //memanggil method tambahMuatan() didalam class Mobil() dengan menginput parameter
  muatan.tambahMuatan(4000); 
  muatan.tambahMuatan(400);
  muatan.tambahMuatan(400);
  muatan.tambahMuatan(300);
  muatan.tambahMuatan(100);
  muatan.tambahMuatan(200);
  muatan.tambahMuatan(100);

  muatan.totalMuatan(); //memanggil method totalMuatan() di dalam class Mobil()
  
}