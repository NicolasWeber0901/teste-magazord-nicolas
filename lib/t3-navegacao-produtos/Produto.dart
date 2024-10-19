// ignore_for_file: file_names

class Produto {
  final String nome;
  final double preco;
  final String imagem;
  final String descricao;

  Produto({
    required this.nome,
    required this.preco,
    required this.imagem,
    required this.descricao,
  });


  static List<Produto> get produtos => [
    Produto(
      nome: 'Headset Sem Fio H3',
      preco: 159.90,
      imagem: 'assets/images/headset.png', 
      descricao: descricaoPadrao * 2,
    ),
    Produto(
      nome: 'Headset Gamer Redragon Zeus X',
      preco: 279.90,
      imagem: 'assets/images/headset-2.png', 
      descricao: descricaoPadrao * 2,
    ),
    Produto(
      nome: 'Notebook Acer Aspire 5 ',
      preco: 2349.90,
      imagem: 'assets/images/notebook.png', 
      descricao: descricaoPadrao * 2,
    ),
    Produto(
      nome: 'Placa de Vídeo Gigabyte Radeon RX 6600',
      preco: 1399.90,
      imagem: 'assets/images/placa-video.png', 
      descricao: descricaoPadrao * 2,
    ),
    Produto(
      nome: 'Processador AMD Ryzen 7 5700X3D',
      preco: 1229.90,
      imagem: 'assets/images/processador.png', 
      descricao: descricaoPadrao * 2,
    ),
    Produto(
      nome: 'SSD SATA WD Green, 1TB',
      preco: 799.90,
      imagem: 'assets/images/ssd.png', 
      descricao: descricaoPadrao * 2,
    ),
  ];

  static String get descricaoPadrao => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis massa in lorem iaculis cursus quis at purus. Vestibulum non quam iaculis, dignissim lectus ut, rhoncus nibh.';
}