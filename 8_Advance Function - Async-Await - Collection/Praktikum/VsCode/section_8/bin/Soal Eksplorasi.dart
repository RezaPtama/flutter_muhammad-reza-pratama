import 'dart:io';

void main() {

  print('Soal No 1\n');

  List <String> nama = [
    'amuse', 
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
    ];
    print('Contoh pertama');
    print(nama);
    var removeDuplicate = nama.toSet().toList();
    print(removeDuplicate);


    List <String> merek = [
    'Js Racing', 
    'amuse',
    'spoon',
    'spoon',
    'Js Racing',
    'amuse',
    ];
    print('\nContoh kedua');
    print(merek);
    var removeDuplicate2 = merek.toSet().toList();
    print(removeDuplicate2);

    print('\nSoal No 2\n');

  List <String> programs = ["js", "js", "js", "golang", "python", "js", "js", "golang", "rust",];
  
  var counts = programs.fold<Map<String, int>>({},(map, program){
    map[program] = (map[program] ?? 0) + 1;
    return map;
  });

  print(programs);
  print(counts);
}