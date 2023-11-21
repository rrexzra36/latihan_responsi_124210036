import 'package:flutter/material.dart';
import 'package:latihan_responsi/api/blogs_api_data_source.dart';
import 'package:latihan_responsi/ui/blogs_detail.dart';

import '../model/blogs_model.dart';

class BlogsList extends StatefulWidget {
  const BlogsList({super.key});

  @override
  State<BlogsList> createState() => _BlogsListState();
}

class _BlogsListState extends State<BlogsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs Page'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: FutureBuilder(
          future: ApiDataSource.instance.loadBlogs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("ADA ERROR!");
            }
            if (snapshot.hasData) {
              Blogs blogs = Blogs.fromJson(snapshot.data!);
              return ListView.builder(
                itemCount: blogs.results!.length,
                itemBuilder: (context, index) {
                  var wblogs = blogs.results![index];

                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlogsDetail(wblogs),
                            ),
                          );
                        },
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          child: Image.network(
                            '${wblogs.imageUrl}',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          wblogs.title.toString(),
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
