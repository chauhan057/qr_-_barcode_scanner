import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerSimple extends StatefulWidget {
  const BarcodeScannerSimple({super.key});

  @override
  State<BarcodeScannerSimple> createState() => _BarcodeScannerSimpleState();
}

class _BarcodeScannerSimpleState extends State<BarcodeScannerSimple> {
  String? scannedBarcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner Simple'),
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              onDetect: (BarcodeCapture capture) {
                final barcode = capture.barcodes.first;
                if (barcode.rawValue != null) {
                  setState(() {
                    scannedBarcode = barcode.rawValue;
                  });
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text('Barcode Found: $scannedBarcode')),
                  // );
                }
              },
            ),
          ),
          if (scannedBarcode != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Scanned Barcode: $scannedBarcode',
                style: const TextStyle(fontSize: 18),
              ),
            ),
        ],
      ),
    );
  }
}
