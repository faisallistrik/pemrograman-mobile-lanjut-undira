// --- Langkah 1 & 2 ---
void main() {
  // Variabel pertama kita beri nama 'test1'
  String test1 = "test2"; 
  
  if (test1 == "test1") {
    print("Test1");
  } else if (test1 == "test2") { // tadinya penulisan else if seharusnya else if, bukan Else If
    print("Test2");
  } else { // tadinya penulisan else seharusnya else, bukan Else
    print("Something else");
  }

  if (test1 == "test2") print("Test2 again");

  print("-------------------");

  // --- Langkah 3 ---
  // Variabel kedua kita beri nama 'test2' agar tidak bentrok
  String test2 = "true";
  
  // Perbaikan: Bandingkan variabel string 'test2' dengan teks "true"
  // Hasil dari (test2 == "true") adalah boolean (true)
  if (test2 == "true") {
    print("Kebenaran");
  } else {
    print("Bukan Kebenaran");
  }
}