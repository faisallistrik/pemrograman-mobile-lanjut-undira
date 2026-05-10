void main() {
  // Perbaikan Langkah 2: Deklarasi dan inisialisasi variabel counter
  int counter = 0; 

  // --- Langkah 1 & 2 ---
  print("--- Looping While ---");
  while (counter < 33) {
    print(counter);
    counter++; // Menambah nilai counter sebanyak 1 setiap perulangan
  }

  // --- Langkah 3 ---
  print("--- Looping Do-While ---");
  do {
    print(counter);
    counter++;
  } while (counter < 77);
}