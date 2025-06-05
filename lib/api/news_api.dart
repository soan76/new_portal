import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_portal/api/api_config.dart';
import 'package:news_portal/api/models/news_data.dart';
import 'package:easy_extension/easy_extension.dart';

class NewsApi {
  static Future<List<NewsData>?> _getNewsFrom(String url) async {
    //
    try {
      final response = await http.get(Uri.parse(url));
      
      Log.d(' 응답 코드: ${response.statusCode}');
      Log.d(' 응답 바디: ${response.body}');

      if (response.statusCode != 200) return null;

      final bodyJson = jsonDecode(response.body);
      final List<dynamic> newsRaw = bodyJson['news'];
      return newsRaw.map((e) => NewsData.fromMap(e)).toList();
    } catch (e) {
      Log.red('뉴스 불러오기 오류: $e');
      return null;
    }
  }
  static Future<List<NewsData>?> getTopic() async {
    return _getNewsFrom(ApiConfig.news.getTopic);
  }

  static Future<List<NewsData>?> getIssue() async {
    return _getNewsFrom(ApiConfig.news.getIssue);
  }
}