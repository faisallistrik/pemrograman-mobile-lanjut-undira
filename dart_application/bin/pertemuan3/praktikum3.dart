void main() {
  // Perbaikan Langkah 1 & 2: Menyamakan nama variabel dan menambah increment
  for (int index = 10; index < 27; index++) {
    
    // --- Langkah 3 ---
    // Perbaikan: Penulisan keyword harus huruf kecil (if, else if)
    if (index == 21) {
      break; // Menghentikan seluruh perulangan saat mencapai 21
    } else if (index > 1 && index < 7) { 
      // Catatan: index dimulai dari 10, jadi kondisi (index < 7) tidak akan pernah terpenuhi di sini
      continue; // Melewati perintah print jika kondisi terpenuhi
    }
    
    print(index);
  }
}