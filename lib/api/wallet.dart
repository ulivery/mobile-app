import 'dart:convert';

import 'package:fluri/fluri.dart';
import 'package:http/http.dart' as http;
import 'package:ulivery_mobile_app/api/models.dart';
import 'package:ulivery_mobile_app/api/wrapper.dart';

class Wallet extends Wrapper {
  Wallet() : super(Fluri("https://wallet.ulivery.nl/"));

  Future<WalletResponse> get() async {
    var response = await http.get(getUri("api/wallet"), headers: await getAuthHeaders());
    if (response.statusCode == 200) {
      return WalletResponse.fromJson(jsonDecode(response.body));
    }

    throw ApiException(response.statusCode, response.body);
  }
}
