import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class HttpServices {
  static Future<Map<String, dynamic>> getHttpMethod(
      {required String? url}) async {
    Map<String, String> headers = {
      "Content-Type": " application/x-www-form-urlencoded"
    };
    log("Get Http Method Url ::: $url");
    log("Get Http Method Headers ::: $headers");
    http.Response response = await http
        .get(Uri.parse("$url"), headers: headers)
        .timeout(const Duration(seconds: 10));
    log("Get Http Method's Status Code ::: '${response.statusCode}'");
    log("Get Http Response Body ::: '${response.body}'");

    return {'body': response.body};
  }

  static Future<Map<String, dynamic>> postHttpMethod(
      {required String url, required Map<String, String> payload}) async {
    var encoding = Encoding.getByName('utf-8');
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    log("Post Http Method Url ::: $url");
    log("Get Http Method Headers ::: $headers");
    http.Response response = await http
        .post(
          Uri.parse(url),
          body: payload,
          encoding: encoding,
          headers: headers,
        )
        .timeout(const Duration(seconds: 10));
    log("Post Http Method Status Code ::: ${response.statusCode}");
    log("Post Http Method Response Body ::: ${response.body}");
    return  {'body': response.body};
  }
}
