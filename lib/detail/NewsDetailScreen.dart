import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_portal/api/models/news_data.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsData news;

  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.imageUrl != null && news.imageUrl!.isNotEmpty)
              Image.network(news.imageUrl!),
            const SizedBox(height: 12),
            Text(
              news.title,
              style: GoogleFonts.jua(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              news.pubDate,
              style: GoogleFonts.jua(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(news.description, style: GoogleFonts.jua(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}