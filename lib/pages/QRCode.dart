import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatelessWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bestelling bevestigen"),
      ),
      body: QRCodeBody(),
    );
  }
}

class QRCodeBody extends StatefulWidget {
  const QRCodeBody({Key? key}) : super(key: key);

  @override
  State<QRCodeBody> createState() => _QRCodeBodyState();
}

class _QRCodeBodyState extends State<QRCodeBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
        child: Center(
          child: Expanded(
            child: QR(screenWidth: screenWidth, data: "123",),

          ),
        ),
    );
  }
}

class QR extends StatelessWidget {
  final String data;
  const QR({
    Key? key,
    required this.screenWidth, required this.data,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: data,
      version: QrVersions.auto,
      size: screenWidth * 0.8,
      foregroundColor: Theme.of(context).colorScheme.primary,

    );
  }
}
