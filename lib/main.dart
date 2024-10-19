// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:teste_magazord_nicolas/bonus-qr-code/QRCodePage.dart';
import 'package:teste_magazord_nicolas/t1-lista/TodoList.dart';
import 'package:teste_magazord_nicolas/t3-navegacao-produtos/ListaProdutosPage.dart';
import 'package:teste_magazord_nicolas/t2-api-clima/ClimaPage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _redTheme,
      darkTheme: _purpleTheme,
      themeMode: _themeMode,
      home: Home(
        toggleTheme: _toggleTheme
      ), // Passa a função para a página
    );
  }

  ThemeData get _purpleTheme => ThemeData(
    primaryColor: Colors.purple,
    shadowColor: Colors.purple.shade100,
    focusColor: Colors.white,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.purple,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  ThemeData get _redTheme => ThemeData(
    primaryColor: Colors.red.shade400,
    shadowColor: Colors.red.shade100,
    focusColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red.shade300,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.purple,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

class Home extends StatefulWidget {
  final Function(ThemeMode) toggleTheme;

  Home({
    super.key, 
    required this.toggleTheme
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 3;

  List<Widget> views = [
    TodoList(),
    ClimaPage(),
    ListaProdutosPage(),
    QRCodePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste Magazord Nicolas'),
        actions: [
          PopupMenuButton<ThemeMode>(
            onSelected: (ThemeMode mode) {
              widget.toggleTheme(mode);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Tema Roxo'),
                ),
                const PopupMenuItem(
                  value: ThemeMode.light,
                  child: Text('Tema Vermelho'),
                ),
              ];
            },
          ),
        ],
      ),
      body: views[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Componente\n Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Clima',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR Code',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).focusColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
