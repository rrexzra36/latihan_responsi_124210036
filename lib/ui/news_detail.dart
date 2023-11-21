import 'package:flutter/material.dart';
import 'package:latihan_responsi/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  final Results berita;

  const NewsDetail(this.berita, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            Image.network(
              '${berita.imageUrl}',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              berita.title.toString(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              berita.summary.toString(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        onPressed: () {
          _launcher('${berita.url}');
        },
        child: const Icon(Icons.search, color: Colors.white,),
      ),
    );
  }
  Future<void> _launcher(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception("Gagal membuka url : $_url");
    }
  }
}
