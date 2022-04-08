import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluri/fluri.dart';

abstract class Wrapper {
  final Fluri _baseUri;

  Wrapper(this._baseUri);

  Future<Map<String, String>> getAuthHeaders() async {
    var token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
    return {"Authorization": "Bearer $token"};
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
