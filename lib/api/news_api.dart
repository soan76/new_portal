import 'dart:convert';

import 'package:easy_extension/easy_extension.dart';
import 'package:http/http.dart' as http;
import 'package:news_portal/api/api_config.dart';
import 'package:news_portal/api/models/news_data.dart';

class NewsApi {
  static Future<List<NewsData>?> getList() async {
    //
    final result = await http
        .get(
          Uri.parse(ApiConfig.news.getList), //
        )
        .catchError((e) {
          Log.red('뉴스 목록 가져오기 오류 : $e');

          return http.Response(e.toString(), 400);
        });

    if (result.statusCode != 200) return null;

    final body = result.body;
    final bodyJson = jsonDecode(body);

    final List<dynamic> newsRaw = bodyJson['news'];

    /*    for(var i = 0; i< newsRaw.length;i++){
      final raw = newsRaw[i];
      final data = NewsData.fromMap(raw);
      newsList.add(data)

      for (var data in newsRaw){
      newsList.add(Newsdata.fromMap(raw))}
    }

    newsRaw.forEach((data)){
      newsList.add(NewsData.fromMap(data));
    }*/
    return newsRaw.map((data) => NewsData.fromMap(data)).toList();
  }
}