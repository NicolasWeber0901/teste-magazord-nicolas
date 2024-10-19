// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_magazord_nicolas/bonus-qr-code/QRCodeController.dart';

class QRCodePage extends StatelessWidget {
  QRCodePage({super.key});

  final ValueNotifier<String> _textNotifier = ValueNotifier('');
  final ValueNotifier<String?> _qrCodeUrl = ValueNotifier(null);
  final QRCodeController _qrCodeService = QRCodeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).shadowColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Insira o texto aqui para gerar um QR Code',
              ),
              onChanged: (value) {
                _textNotifier.value = value;
              },
            ),
            SizedBox(height: 20),
            _botaoQrCode(context),
            SizedBox(height: 20),
            ValueListenableBuilder<String?>(
              valueListenable: _qrCodeUrl,
              builder: (context, url, child) {
                return url != null ? Image.network(url) : SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _botaoQrCode(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
        onPressed: () {
          _geraQRCode(_textNotifier.value, context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor)
        ),
        child: Text('Gerar QR Code'),
      ),
    );
  }

  Future<void> _geraQRCode(String text, BuildContext context) async {
    if(text.isNotEmpty) {
      final qrCodeUrl = await _qrCodeService.geraQRCode(text);
      _qrCodeUrl.value = qrCodeUrl;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Digite um valor para gerar o QR Code!'))
      );
    }
  }
}
