// ignore_for_file: depend_on_referenced_packages, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ClimaController {
  
  String apiKey = 'e07a00378c98432c85c163901241910';

  Future<bool> verificaPermissaoLocalizacao(Function(String) showMessage) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      LocationPermission requestPermission = await Geolocator.requestPermission();
      if (requestPermission == LocationPermission.denied || requestPermission == LocationPermission.deniedForever) {
        showMessage('Permissão de localização negada.');
        return false;
      }
    }
    return true;
  }

  Future<bool> verificaPermissaoInternet(Function(String) showMessage) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showMessage('Sem conexão com a internet');
      return false;
    }
    return true;
  }

  Future<Map<String, dynamic>?> getClimaAtual(Function(String) showMessage) async {
    // Verifica permissão de localização
    bool hasPermission = await verificaPermissaoLocalizacao(showMessage);
    if (!hasPermission) {
      return null;  
    } 

    bool isConnected = await verificaPermissaoInternet(showMessage);
    if (!isConnected) {
       return null;
    } 

    try {
      // Obtém a localização atual do usuário
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      
      // Constrói a URL da API para obter o clima atual
      final String url =
          'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=${position.latitude},${position.longitude}&aqi=no';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['current']; // Retorna os dados atuais do clima
      } else {
        showMessage('Falha ao carregar dados de clima.');
        return null;
      }
    } catch (e) {
      showMessage('Erro ao obter localização ou dados: $e');
      return null;
    }
  }
}
