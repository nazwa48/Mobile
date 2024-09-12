void main() {
  int maxNumber = 201;
  List<int> PrimeNumbers = [];

  for (int i = 0; i < maxNumber; i++) {
    if (isPrime(i)) {
      PrimeNumbers.add(i);
    }
  }

  if (PrimeNumbers.isNotEmpty) {
    print(PrimeNumbers);
    print("Nama: Nazwa Ayunda Mirrohillah");
    print("NIM: 2241720013");
  }
}

// Fungsi menentukan apakah sebuah angka adalah bilangan prima
bool isPrime(int number) {
  if (number < 2) {
    return false;
  }

  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}