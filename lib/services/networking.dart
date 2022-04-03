import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    Uri uri = Uri.parse(this.url);
    http.Response httpResponse = await http.get(uri);

    if (httpResponse.statusCode == 200) {
      String rawData = httpResponse.body;
      var jsonData = convert.jsonDecode(rawData) as Map<String, dynamic>;
      return jsonData;
    } else {
      print('Response status: ${httpResponse.statusCode}');
    }
  }
}
