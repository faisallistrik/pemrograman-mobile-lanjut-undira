void main() {
  String namaLengkap = "Muhamad Faisal"; 
  String nim = "411251167";        

  print("Program Mencari Bilangan Prima 0 - 201\n");

  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print("Bilangan Prima Ditemukan: $i");
      print("Pemilik: $namaLengkap ($nim)\n");
    }
  }
}

// Fungsi untuk mengecek apakah sebuah angka adalah bilangan prima
bool isPrime(int number) {
  if (number < 2) return false;
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}