// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DogModel {
  final String id;
  final String nome;
  final String img;
  final String avatar;
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
    required this.avatar,
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
      'avatar': avatar,
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
      id: map['id'] as String,
      nome: map['nome'] as String,
      img: map['img'] as String,
      avatar: map['avatar'] as String,
      descricao: map['descricao'] as String,
      comportamento: map['comportamento'] as String,
      historia: map['historia'] as String,
      pelo: map['pelo'] as String,
      tamanho: map['tamanho'] as String,
      idade: map['idade'] as String,
    );
  }

  @override
  String toString() {
    return 'DogModel(id: $id, nome: $nome, img: $img, descricao: $descricao, comportamento: $comportamento, historia: $historia, pelo: $pelo, tamanho: $tamanho, idade: $idade,)';
  }

  String toJson() => json.encode(toMap());

  factory DogModel.fromJson(String source) =>
      DogModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
