// void main() {
//   var record = ['first', 2, true, 'last'];
//   print(record);

//   (int, int) tukar((int, int) record) {
//   var (a, b) = record;
//   return (b, a);
// }

// }

// void main() {
//   // Deklarasi dan inisialisasi list record
//   var record = ['first', 2, true, 'last'];
//   print('Record awal: $record');

//   // Fungsi tukar untuk menukar nilai dalam List<int>
//   List<int> tukar(List<int> record) {
//     var a = record[0];
//     var b = record[1];
//     return [b, a];
//   }

//   // Inisialisasi List<int> untuk digunakan dengan fungsi tukar
//   var intRecord = [1, 2];

//   // Menukar nilai menggunakan fungsi tukar
//   var swappedRecord = tukar(intRecord);
//   print('Record setelah ditukar: $swappedRecord');

//   // Mendeklarasikan dan menginisialisasi variabel mahasiswa
//   var mahasiswa = {
//     'nama': 'Nazwa Ayunda M',
//     'NIM': '2241720013'
//   };
  
//   // Menampilkan nilai variabel mahasiswa
//   print('Mahasiswa: $mahasiswa');

//   var mahasiswa2 = ('first', a: 2, b: true, 'last');

// print(mahasiswa2.$1); // Prints 'first'
// print(mahasiswa2.a); // Prints 2
// print(mahasiswa2.b); // Prints true
// print(mahasiswa2.$2); // Prints 'last'
// }

void main() {
  // Deklarasi dan inisialisasi list record
  var record = ['first', 2, true, 'last'];
  print('Record awal: $record');

  // Fungsi tukar untuk menukar nilai dalam List<int>
  List<int> tukar(List<int> record) {
    var a = record[0];
    var b = record[1];
    return [b, a];
  }

  // Inisialisasi List<int> untuk digunakan dengan fungsi tukar
  var intRecord = [1, 2];

  // Menukar nilai menggunakan fungsi tukar
  var swappedRecord = tukar(intRecord);
  print('Record setelah ditukar: $swappedRecord');

  // Mendeklarasikan dan menginisialisasi variabel mahasiswa
  var mahasiswa = {
    'nama': 'Nazwa Ayunda M',
    'NIM': '2241720013'
  };
  
  // Menampilkan nilai variabel mahasiswa
  print('Mahasiswa: $mahasiswa');

  // Mendeklarasikan dan menginisialisasi variabel mahasiswa2 menggunakan tuple
  var mahasiswa2 = ('Nazwa Ayunda M', a: 2, b: true, '2241720013');

  // Menampilkan nilai-nilai dalam tuple mahasiswa2
  print(mahasiswa2.$1); // Prints 'Nazwa Ayunda M'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints '2241720013'
}

