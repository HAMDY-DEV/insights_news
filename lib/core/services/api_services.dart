import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insights_news/core/constants/constants.dart';
import 'package:insights_news/features/home/model/news_model/news_model.dart';
import 'package:insights_news/features/source/model/source_news/source_news.dart';

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

  //
  static Future<NewsModel?> gatNewsBySearch({required String query}) async {
    try {
      var url = Uri.parse('$baseUrl$headLinesEndpont?q=$query&apiKey=$apiKey');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return NewsModel.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //
  static Future<SourceNews?> gatNewsBySource() async {
    try {
      var url = Uri.parse('$baseUrl$headLinesEndpont/sources?&apiKey=$apiKey');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return SourceNews.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<NewsModel?> gatSourceNews({required String sourceId}) async {
    try {
      var url = Uri.parse(
          '$baseUrl$headLinesEndpont?sources=$sourceId&apikey=$apiKey');
      var res = await http.get(url);
      return NewsModel.fromJson(jsonDecode(res.body));
    } catch (e) {
      print(e);
    }
    return null;
  }
}
