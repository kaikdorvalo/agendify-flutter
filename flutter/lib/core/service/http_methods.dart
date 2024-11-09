import 'package:http/http.dart' as http;

class HttpMethods {
  Future<http.Response> post(Uri url, dynamic data) async {
    var res = await http.post(url, body: data);
    return res;
  }

  Future<http.Response> get(Uri url) async {
    return await http.get(url);
  }

  Future<http.Response> delete(Uri url) async {
    return await http.delete(url);
  }

  Future<http.Response> put(Uri url, dynamic data) async {
    return await http.put(url, body: data);
  }
}
