import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insights_news/core/constants/constants.dart';
import 'package:insights_news/features/home/model/news_model/news_model.dart';

class ApiServices {
  static Future<NewsModel?> gatNewsByCategory(
      {required String category}) async {
    try {
      var url = Uri.parse(
          '$baseUrl$headLinesEndpont?category=$category&country=us&apiKey=$apiKey');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        print(res.body);
        return NewsModel.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
