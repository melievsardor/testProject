import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soliq_test/model/search.dart';

class SearchApi {
  static Future<Search> getSearch({required String query}) async {
    final url =
        'https://api-tasnif.soliq.uz/cl-api/mxik/search?lang=uz_cyrl&search_text=$query';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    print(body);
    return searchFromJson(body);
  }
}
