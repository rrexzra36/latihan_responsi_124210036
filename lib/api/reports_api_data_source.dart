import 'base_network.dart';

class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadReports() {
    return BaseNetwork.get("reports/?format=json");
  }

}