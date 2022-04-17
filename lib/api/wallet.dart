import 'dart:convert';

import 'package:fluri/fluri.dart';
import 'package:ulivery_mobile_app/api/models.dart';
import 'package:ulivery_mobile_app/api/wrapper.dart';

class Wallet extends Wrapper {
  Wallet() : super(Fluri("https://wallet.ulivery.nl/"));

  Future<WalletResponse> getWallet() async {
    var response = await get(getUri("api/wallet"));
    if (response.statusCode == 200) {
      return WalletResponse.fromJson(jsonDecode(response.body));
    }

    throw ApiException(response.statusCode, response.body);
  }
}
