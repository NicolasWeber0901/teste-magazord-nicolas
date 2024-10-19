// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'Produto.dart';
import 'DetalhesProdutoPage.dart';

class ListaProdutosPage extends StatelessWidget {
  
  const ListaProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).shadowColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: Produto.produtos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (context, index) {
            final produto = Produto.produtos[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesProdutoPage(product: produto),
                  ),
                );
              },
              child: _getCardProduto(produto, context),
            );
          },
        ),
      ),
    );
  }

  Widget _getCardProduto(Produto produto, BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              produto.imagem, 
              errorBuilder: (context, error, stackTrace) {
                return FlutterLogo(size: 200);
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getNomeProduto(produto),
                SizedBox(height: 8.0),
                _getPrecoProduto(produto),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getNomeProduto(Produto produto) {
    return Text(
      overflow: TextOverflow.clip,
      produto.nome,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }

  Widget _getPrecoProduto(Produto produto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'R\$ ${produto.preco.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Em até 10x Sem Juros',
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }
}