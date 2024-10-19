// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'Produto.dart';

class DetalhesProdutoPage extends StatelessWidget {
  final Produto product;

  DetalhesProdutoPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).shadowColor,
      appBar: AppBar(
        title: Text(product.nome), // Keep in Portuguese for the title, or translate as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getImagemProduto(product.imagem),
            SizedBox(height: 16),
            _getNomeProduto(product.nome),
            SizedBox(height: 8),
            _getPrecoProduto(product.preco),
            SizedBox(height: 16),
            _getDescricaoProduto(product.descricao),
          ],
        ),
      ),
    );
  }

  Widget _getImagemProduto(String image) {
    return Image.asset(
      image,
      errorBuilder: (context, error, stackTrace) {
        return FlutterLogo(size: 200);
      },
    );
  }

  Widget _getNomeProduto(String name) {
    return Center(
      child: Text(
        name,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _getPrecoProduto(double price) {
    return Text(
      'R\$ ${price.toStringAsFixed(2)}',
      style: TextStyle(fontSize: 20, color: Colors.green),
    );
  }

  Widget _getDescricaoProduto(String description) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          description,
          style: TextStyle(
            fontSize: 16
          ),
        ),
      ),
    );
  }
}
