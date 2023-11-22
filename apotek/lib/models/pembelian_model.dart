import 'package:http/http.dart' as http;
import 'dart:convert';

class PembelianModel {
  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
