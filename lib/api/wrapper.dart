import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluri/fluri.dart';
import 'package:http/http.dart' as http;

abstract class Wrapper {
  final Fluri _baseUri;

  Wrapper(this._baseUri);

  Future<Map<String, String>> _getAuthHeaders(bool refresh) async {
    var token = await FirebaseAuth.instance.currentUser!.getIdToken(false);
    return {"Authorization": "Bearer $token"};
  }

  Future<http.Response> post(Uri uri,
      {Map<String, String>? headers, Map<String, dynamic> body = const {}, bool retry = false}) async {
    headers ??= {};
    headers.addAll(await _getAuthHeaders(retry));
    var response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 401 && retry == false) {
      headers.remove("Authorization");
      return post(uri, headers: headers, body: body, retry: true);
    }

    return response;
  }

  Future<http.Response> get(Uri uri, {Map<String, String>? headers, bool retry = false}) async {
    headers ??= {};
    headers.addAll(await _getAuthHeaders(retry));
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 401 && retry == false) {
      headers.remove("Authorization");
      return post(uri, headers: headers, retry: true);
    }

    return response;
  }

  Uri getUri(String path, {Map<String, String> params = const {}}) {
    var uri = (Fluri(_baseUri.toString()))..appendToPath(path);
    for (var param in params.entries) {
      uri.setQueryParam(param.key, param.value);
    }
    return Uri.parse(uri.toString());
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);
}
