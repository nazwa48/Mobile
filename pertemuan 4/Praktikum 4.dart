// void main() {
//   var list = [1, 2, 3];
//   var list2 = [0, ...list];
//   print(list);       // Mencetak [1, 2, 3]
//   print(list2);      // Mencetak [0, 1, 2, 3]
//   print(list2.length); // Mencetak 4

//   var list1 = [1, 2, null]; // Deklarasikan variabel list1 dengan var
//   print(list1);      // Mencetak [1, 2, null]
//   var list3 = [0, ...?list1]; // Menggunakan operator ? untuk menangani list1
//   print(list3.length); // Mencetak 4
// }

void main() {
  var list = [1, 2, 3];
  var nim = '2241720013';
  
  var updatedList = [...list, nim];
  
  print(list);
  print(updatedList);
  print(updatedList.length);
   bool promoActive = true;  // Ubah menjadi false untuk kasus kedua

  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if (promoActive) 'Outlet'
  ];
print(nav);

 var login = 'Manager'; // Ubah nilai ini untuk kasus yang berbeda

  var nav2 = [
    'Home',
    'Furniture',
    'Plants',
    if (login == 'Manager') 'Inventory'
  ];

  print(nav2);

var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');
print(listOfStrings);
}
