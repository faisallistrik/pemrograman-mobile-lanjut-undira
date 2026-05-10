void main() {
  // Langkah 1&2
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print("Set Awal: $halogens");

  // Menambahkan elemen menggunakan .add() dan .addAll()
  halogens.add('fluorine'); // Tidak akan bertambah karena sudah ada (unik)
  halogens.addAll(['chlorine', 'bromine']); // Tidak akan bertambah karena duplikat
  print("Set Setelah .add & .addAll: $halogens");

  // Membuat dua set kosong
  var names1 = <String>{};
  Set<String> names2 = {}; // Ini cara lain mendeklarasikan Set kosong

  // Menambahkan Nama dan NIM menggunakan .add() dan .addAll()
  names1.add("Muhamad Faisal");
  names2.addAll(["Muhamad Faisal", "411251167"]);

  print("Isi names1: $names1");
  print("Isi names2: $names2");
}