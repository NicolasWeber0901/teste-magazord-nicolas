// ignore_for_file: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class QRCodeController {

  Future<String?> geraQRCode(String text) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.qrserver.com/v1/create-qr-code/?data=$text&size=200x200'),
      );
      if (response.statusCode == 200) {
        return response.request!.url.toString();
      } else {
        return null;
      }
    } catch(e) {
      return null;
    }
  }
  
}