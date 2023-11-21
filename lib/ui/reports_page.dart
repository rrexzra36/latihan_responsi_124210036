import 'package:flutter/material.dart';
import 'package:latihan_responsi/api/reports_api_data_source.dart';
import 'package:latihan_responsi/ui/reports_detail.dart';

import '../model/reports_model.dart';

class ReportsList extends StatefulWidget {
  const ReportsList({super.key});

  @override
  State<ReportsList> createState() => _ReportsListState();
}

class _ReportsListState extends State<ReportsList> {
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
          future: ApiDataSource.instance.loadReports(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("ADA ERROR!");
            }
            if (snapshot.hasData) {
              Reports reports = Reports.fromJson(snapshot.data!);
              return ListView.builder(
                itemCount: reports.results!.length,
                itemBuilder: (context, index) {
                  var laporan = reports.results![index];

                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportsDetail(laporan),
                            ),
                          );
                        },
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          child: Image.network(
                            '${laporan.imageUrl}',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          laporan.title.toString(),
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
