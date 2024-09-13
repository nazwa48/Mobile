void main() {
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  gifts['nama'] = 'Nazwa Ayunda M'; 
  gifts['NIM'] = '2241720013'; 

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon'
  };

  nobleGases[1] = 'Nazwa Ayunda M'; 
  nobleGases[3] = '2241720013';  

  var mhs1 = Map<String, String>();
  mhs1['nama'] = 'Nazwa Ayunda M';  
  mhs1['NIM'] = '2241720013';   

  var mhs2 = Map<int, String>();
  mhs2[1] = 'Nazwa Ayunda M';  
  mhs2[2] = '2241720013';  

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
