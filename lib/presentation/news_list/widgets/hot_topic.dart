import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:news_portal/api/models/news_data.dart';
import 'package:news_portal/api/news_api.dart';
import 'package:news_portal/app/translation/app_trans.dart';


class HotTopic extends StatefulWidget {
  const HotTopic({super.key});

  @override
  State<HotTopic> createState() => _HotTopicState();
}

class _HotTopicState extends State<HotTopic> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min, //
      children: [
        Text(
          AppTrans.newsList.hotTopic.tr(),
          style: GoogleFonts.jua(
            fontSize: 40, //
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 250,
          child: FutureBuilder(
            future: NewsApi.getTopic(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(year2023: false),
                  ),
                );
              } else if (snapshot.hasError) {}
              final topicNews = snapshot.data ?? <NewsData>[];
              if (topicNews.isEmpty) {
                return Center(child: Text(AppTrans.newsList.noData.tr()));
              }
              return CarouselView.weighted(
                flexWeights: const [1, 7, 1],
                children: List.generate(topicNews.length, (i) {
                  final topic = topicNews[i];
                  return Card(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            topic.imageUrl!,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(LucideIcons.imageOff, size: 25),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          bottom: 0,
                          child: Text(
                            topic.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black, Colors.transparent],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}