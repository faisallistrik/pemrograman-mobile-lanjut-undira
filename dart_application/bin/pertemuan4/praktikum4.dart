void main() {
  // --- Langkah 1: Eksperimen Spread Operator ---
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  
  print('--- Langkah 1 & 2 ---');
  print(list);    // Output: [1, 2, 3]
  print(list2);   // Output: [0, 1, 2, 3]
  print(list2.length); // Output: 4

  // --- Langkah 3: Eksperimen Null-aware Spread Operator ---
  var list1 = [1, 2, null];
  print('\n--- Langkah 3 ---');
  print(list1);   // Output: [1, 2, null]
  
  var list3 = [0, ...?list1];
  print(list3);   // Output: [0, 1, 2, null]
  print(list3.length); // Output: 4

  // Menambahkan NIM menggunakan Spread Operator
  var nimList = ['411251167'];
  var combinedList = [...list, ...nimList];
  print('List dengan NIM: $combinedList');

  // --- Langkah 4: Eksperimen Collection If ---
  print('\n--- Langkah 4 ---');
  bool promoActive = true; 
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav); // Jika true, 'Outlet' akan muncul

  // --- Langkah 5: Eksperimen Collection If dengan Control Flow (Case) ---
  print('\n--- Langkah 5 ---');
  String login = 'Manager';
  var nav2 = [
    'Home', 
    'Furniture', 
    'Plants', 
    if (login case 'Manager') 'Inventory'
  ];
  print(nav2); // 'Inventory' muncul karena login cocok dengan pola 'Manager'

  // --- Langkah 6: Eksperimen Collection For ---
  print('\n--- Langkah 6 ---');
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  
  print(listOfStrings); // Output: [#0, #1, #2, #3]
  
  // Validasi menggunakan assert
  assert(listOfStrings[1] == '#1');
}