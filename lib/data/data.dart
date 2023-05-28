import 'dart:ui';

class ProductDataModel {
  int id;
  String name;
  String description;
  String price;
  String image;
  String tagLine;
  Color color;

  ProductDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.tagLine,
    required this.color,
  });
}

List<ProductDataModel> productData = [
  ProductDataModel(
    id: 1,
    name: "Apple Watch Series 10",
    description:
        "Total de vendas: 10\n\nFornecedor:Apple\n\nAinda em estoque:sim\n\nQuantidade em estoque:102\n\nDescrição: Total de vendas: 10\n\nFornecedor:Apple\n\nAinda em estoque:sim\n\nQuantidade em estoque:102\n\nDescrição: The future of health is on your wrist. Measure your blood oxygen level with a revolutionary new sensor and app. Take an ECG anytime, anywhere. See your fitness metrics at a glance with the enhanced Always-On Retina display. With Apple Watch Series 6 on your wrist, a healthier, more active, more connected life is within reach.",
    price: "\$399",
    image: "https://imgs.casasbahia.com.br/1510888877/1xg.jpg?imwidth=500",
    tagLine: "New",
    color: const Color(0xFFEAEAEA),
  ),
  ProductDataModel(
    id: 2,
    name: "Apple Watch Series 5",
    description:
        "Total de vendas: 10\n\nFornecedor:Apple\n\nAinda em estoque:sim\n\nQuantidade em estoque:102\n\nDescrição: The future of health is on your wrist. Measure your blood oxygen level with a revolutionary new sensor and app. Take an ECG anytime, anywhere. See your fitness metrics at a glance with the enhanced Always-On Retina display. With Apple Watch Series 6 on your wrist, a healthier, more active, more connected life is within reach.",
    price: "\$349",
    image: "https://imgs.casasbahia.com.br/1510888877/1xg.jpg?imwidth=500",
    tagLine: "New",
    color: const Color(0xFFEAEAEA),
  ),
  ProductDataModel(
    id: 3,
    name: "Apple Watch Series 4",
    description:
        "Total de vendas: 10\n\nFornecedor:Apple\n\nAinda em estoque:sim\n\nQuantidade em estoque:102\n\nDescrição: The future of health is on your wrist. Measure your blood oxygen level with a revolutionary new sensor and app. Take an ECG anytime, anywhere. See your fitness metrics at a glance with the enhanced Always-On Retina display. With Apple Watch Series 6 on your wrist, a healthier, more active, more connected life is within reach.",
    price: "\$299",
    image: "https://imgs.casasbahia.com.br/1510888877/1xg.jpg?imwidth=500",
    tagLine: "New",
    color: const Color(0xFFEAEAEA),
  ),
  ProductDataModel(
    id: 4,
    name: "Samsung Galaxy Watch 3",
    description:
        "Total de vendas: 10\n\nFornecedor:Apple\n\nAinda em estoque:sim\n\nQuantidade em estoque:102\n\nDescrição: The future of health is on your wrist. Measure your blood oxygen level with a revolutionary new sensor and app. Take an ECG anytime, anywhere. See your fitness metrics at a glance with the enhanced Always-On Retina display. With Apple Watch Series 6 on your wrist, a healthier, more active, more connected life is within reach.",
    price: "\$399",
    image: "https://imgs.casasbahia.com.br/1510888877/1xg.jpg?imwidth=500",
    tagLine: "New",
    color: const Color(0xFFEAEAEA),
  ),
];
