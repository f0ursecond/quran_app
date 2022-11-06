import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/model/model.dart';
import 'package:quran_app/model/quranmodel.dart';

class Repository {
  final _baseUrl = 'https://equran.id/api/surat';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Iterable it = (json.decode(utf8.decode(response.bodyBytes)));
        List<quran> anjay = it.map((e) => quran.fromJson(e)).toList();
        return anjay;
      }
    } catch (e) {
      print('error =  ${e.toString()}');
    }
  }
}
