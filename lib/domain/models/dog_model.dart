import 'dart:convert';

class DogModel {
  final String id;
  final String nome;
  final String img;
  final String descricao;
  final String comportamento;
  final String historia;
  final String pelo;
  final String tamanho;
  final String idade;
  DogModel({
    required this.id,
    required this.nome,
    required this.img,
    required this.descricao,
    required this.comportamento,
    required this.historia,
    required this.pelo,
    required this.tamanho,
    required this.idade,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'img': img,
      'descricao': descricao,
      'comportamento': comportamento,
      'historia': historia,
      'pelo': pelo,
      'tamanho': tamanho,
      'idade': idade,
    };
  }

  factory DogModel.fromMap(Map<String, dynamic> map) {
    return DogModel(
      id: map['id'],
      nome: map['nome'],
      img: map['img'],
      descricao: map['descricao'],
      comportamento: map['comportamento'],
      historia: map['historia'],
      pelo: map['pelo'],
      tamanho: map['tamanho'],
      idade: map['idade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DogModel.fromJson(String source) =>
      DogModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
