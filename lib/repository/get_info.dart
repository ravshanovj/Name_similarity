import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:name_similarity/model/name_model.dart';

class GetInfoRepo {
  getInfo({required String name}) async {
    try {
      final url = Uri.parse('https://api.genderize.io/?name=$name');
      final res = await http.get(url);
      dynamic data = jsonDecode(res.body);
      Name names = Name.fromJson(data);
      return names;
    } catch (e) {
      print(e);
    }
  }
}