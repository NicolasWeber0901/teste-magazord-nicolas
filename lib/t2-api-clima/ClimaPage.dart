// ignore_for_file: prefer_const_constructors, file_names, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:teste_magazord_nicolas/t2-api-clima/ClimaController.dart';

class ClimaPage extends StatefulWidget {
  const ClimaPage({super.key});

  @override
  ClimaPageState createState() => ClimaPageState();
}

class ClimaPageState extends State<ClimaPage> {
  Map<String, dynamic>? _climaAtual;
  bool _isLoading = false;

  final ClimaController _climaController = ClimaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).shadowColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isLoading
                ? CircularProgressIndicator()
                : _getCardClima(_climaAtual),
            SizedBox(height: 20), // Espaçamento entre o card e o botão
            _getBotaoLocalizacao, // Botão para obter localização
          ],
        ),
      ),
    );
  }

  // Método para obter os dados do clima
  Future<void> _getWeather() async {
    setState(() {
      _isLoading = true; // Inicia o carregamento
    });

    final weather = await _climaController.getClimaAtual(exibeMensagem);
    setState(() {
      _isLoading = false; // Termina o carregamento
      _climaAtual = weather; // Atualiza os dados do clima
    });
  }

  // Botão para obter a localização
  Widget get _getBotaoLocalizacao => Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        onPressed: _getWeather, // Chama _getWeather ao clicar
        child: Text(
          'Buscar Localização',
          style: TextStyle(fontSize: 20),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor)
        ),
      ),
    ),
  );

  // Método para exibir o card com os dados do clima
  Widget _getCardClima(Map<String, dynamic>? weather) {
    if(_climaAtual != null) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Detalhes do Clima',
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: 
                    FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),
                Image.network(
                  'https:${weather!['condition']['icon']}',
                  height: 70,
                  width: 70,
                ),
                SizedBox(height: 10),
                _textoPadrao('Temperatura: ', '${weather['temp_c']}'),
                _textoPadrao('Condições: ', '${weather['condition']['text']}'),
                _textoPadrao('Humidade: ', '${weather['humidity']}%'),
                _textoPadrao('Vento: ', '${weather['wind_kph']} km/h')
              ],
            ),
          ),
        ),
      );
    }
    return SizedBox();
  }

  Widget _textoPadrao(String title, String text) {
    return Text.rich(
      TextSpan(
        text: title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18
            )
          ),
        ],
      )
    );
  }

  void exibeMensagem(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
