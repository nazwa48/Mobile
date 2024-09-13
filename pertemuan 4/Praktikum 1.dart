void main() {
  var list1 = [1, 2, 3];
  assert(list1.length == 3);
  assert(list1[1] == 2);

  list1[1] = 1;
  assert(list1[1] == 1);

  final List<String?> list2 = List.filled(5, null);
  list2[1] = 'Nazwa Ayunda Mirrohillah';
  list2[2] = '2241720013';

  print(list2);
}
