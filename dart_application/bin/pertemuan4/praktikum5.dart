// --- Langkah 3: Membuat fungsi tukar ---
// Penjelasan: Fungsi ini menerima satu Record berisi dua integer (int, int).
// Kemudian isinya dibongkar (destructuring) dan dikembalikan dalam posisi terbalik.
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  // --- Langkah 1 & 2: Eksperimen Dasar Records ---
  // Penjelasan: Record adalah tipe data koleksi yang immutable.
  // Di bawah ini adalah record dengan campuran positional fields dan named fields.
  var record = ('first', a: 2, b: true, 'last');
  print('--- Langkah 1 & 2 ---');
  print('Record awal: $record');

  // --- Langkah 3: Menggunakan fungsi tukar ---
  print('\n--- Langkah 3 ---');
  var recordAngka = (10, 20); // Inisialisasi record angka
  print('Sebelum ditukar: $recordAngka');
  
  var hasilTukar = tukar(recordAngka); // Memanggil fungsi tukar
  print('Setelah ditukar: $hasilTukar');

  // --- Langkah 4: Record Type Annotation ---
  print('\n--- Langkah 4 ---');
  // Penjelasan: Mendeklarasikan variabel mahasiswa dengan tipe data record (String, int).
  (String, int) mahasiswa = ('Muhamad Faisal', 411251167); // Inisialisasi Nama dan NIM
  print('Data Mahasiswa: $mahasiswa');

  // --- Langkah 5: Akses Field pada Records ---
  print('\n--- Langkah 5 ---');
  var mahasiswa2 = ('Muhammad Faisal', a: 411251167, b: true, 'last');
  
  // PERBAIKAN: Gunakan ${mahasiswa2.$1} untuk positional fields
  print('Akses Positional Field 1 (\$1): ${mahasiswa2.$1}'); 
  print('Akses Named Field a (NIM): ${mahasiswa2.a}');  
  print('Akses Named Field b (Boolean): ${mahasiswa2.b}');  
  print('Akses Positional Field 2 (\$2): ${mahasiswa2.$2}'); 
  
  /* Deskripsi Analisis:
     1. Records memungkinkan pengembalian nilai jamak tanpa perlu membuat Class.
     2. Urutan positional fields diakses dengan $ (indeks mulai dari 1).
     3. Named fields memberikan keterbacaan kode yang lebih baik melalui identitas key.
  */
}