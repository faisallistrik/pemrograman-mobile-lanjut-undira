import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/pizza.dart';

class HttpHelper {
  final String authority = '76zk9.wiremockapi.cloud';
  final String path = 'pizzalist';

  // GET: mengambil daftar pizza dari API
  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);
    // Catatan: WireMock adalah mock API — data tidak benar-benar tersimpan.
    // Data yang dikembalikan selalu sama (5 pizza hardcoded).
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      List<Pizza> pizzas =
          (jsonResponse as List<dynamic>).map<Pizza>((i) => Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }

  // "POST" pizza ke API (sebenarnya GET karena konfigurasi WireMock)
  // Catatan: Di WireMock endpoint /pizza dikonfigurasi sebagai GET (bukan POST)
  // dan mengembalikan status 201 + pesan sukses.
  // WireMock TIDAK menyimpan data — hanya simulasi.
  // Di production, ini harusnya POST dan data benar-benar tersimpan.
  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza';
    Uri url = Uri.https(authority, postPath);
    http.Response r = await http.get(url);
    // Catatan: WireMock mengembalikan status 201 (Created), bukan 200 (OK).
    // Kita terima keduanya sebagai indikasi sukses.
    if (r.statusCode == HttpStatus.ok || r.statusCode == HttpStatus.created) {
      return r.body;
    } else {
      return 'Gagal POST. Status code: ${r.statusCode}, Response: ${r.body}';
    }
  }
}