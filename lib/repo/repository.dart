import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/model/model.dart';

class Repository {
  final _baseUrl = 'https://635fada9ca0fe3c21aa1c562.mockapi.io/asmaul';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Iterable it = (json.decode(utf8.decode(response.bodyBytes)));
        List<asmaul> text = it.map((e) => asmaul.fromJson(e)).toList();
        return text;
      }
    } catch (e) {
      print('error =  ${e.toString()}');
    }
  }
}
