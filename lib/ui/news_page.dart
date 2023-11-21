import 'package:flutter/material.dart';
import 'package:latihan_responsi/api/news_api_data_source.dart';
import 'package:latihan_responsi/ui/news_detail.dart';

import '../model/news_model.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
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
        child: FutureBuilder(
          future: ApiDataSource.instance.loadNews(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("ADA ERROR!");
            }
            if (snapshot.hasData) {
              News news = News.fromJson(snapshot.data!);
              return ListView.builder(
                itemCount: news.results!.length,
                itemBuilder: (context, index) {
                  var berita = news.results![index];

                  return Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetail(berita),
                            ),
                          );
                        },
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          child: Image.network(
                            '${berita.imageUrl}',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          berita.title.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right_rounded, color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
