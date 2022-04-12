import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR code'),
      ),
      body: MobileScanner(
        allowDuplicates: false,
        controller: MobileScannerController(
          facing: CameraFacing.back, torchEnabled: false
        ),
        onDetect: (barcode, args){
          final String? code = barcode.rawValue;
          debugPrint('Bestelling gevonden! $code');
        }
      ),
    );
  }
}
