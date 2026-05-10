void main() {
  // Bagian variabel langkah 1
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

  // Menambahkan Nama dan NIM ke gifts
  gifts['nama'] = 'Muhamad Faisal';
  gifts['nim'] = '411251167';

  // Menambahkan Nama dan NIM ke nobleGases
  nobleGases[20] = 'Muhamad Faisal';
  nobleGases[21] = '411251167';

  // Membuat variabel mhs1 dan mhs2
  var mhs1 = Map<String, String>();
  mhs1['first'] = 'partridge';
  mhs1['second'] = 'turtledoves';
  mhs1['fifth'] = 'golden rings';
  mhs1['nama'] = 'Muhamad Faisal';
  mhs1['nim'] = '411251167';

  var mhs2 = Map<int, String>();
  mhs2[2] = 'helium';
  mhs2[10] = 'neon';
  mhs2[18] = 'argon';
  mhs2[19] = 'Muhamad Faisal';
  mhs2[20] = '411251167';

  print("Gifts: $gifts");
  print("Noble Gases: $nobleGases");
  print("Mhs1: $mhs1");
  print("Mhs2: $mhs2");
}