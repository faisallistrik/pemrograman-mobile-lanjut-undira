void main() {
  // Variabel dari Langkah 1
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  // Menambahkan Nama dan NIM ke variabel gifts
  gifts['nama'] = 'Muhamad Faisal'; // Ganti dengan nama asli
  gifts['nim'] = '411251167';           // Ganti dengan NIM asli

  // Menambahkan Nama dan NIM ke variabel nobleGases
  nobleGases[20] = 'Muhamad Faisal';
  nobleGases[21] = '411251167';

  // Membuat variabel mhs1 menggunakan Map constructor
  var mhs1 = <String, String>{};
  mhs1['first'] = 'partridge';
  mhs1['second'] = 'turtledoves';
  mhs1['fifth'] = 'golden rings';
  mhs1['nama'] = 'Muhamad Faisal';
  mhs1['nim'] = '411251167';

  // Membuat variabel mhs2 menggunakan Map constructor
  var mhs2 = <int, String>{};
  mhs2[2] = 'helium';
  mhs2[10] = 'neon';
  mhs2[18] = 'argon';
  mhs2[19] = 'Muhamad Faisal';
  mhs2[20] = '411251167';

  // Mencetak semua hasil
  print("Gifts: $gifts");
  print("Noble Gases: $nobleGases");
  print("Mhs1: $mhs1");
  print("Mhs2: $mhs2");
}