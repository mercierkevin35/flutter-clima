import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(this.url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Something failed, status code = ${response.statusCode}");
    }
  }
}
