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
    return {
      'id': id,
      'nome': nome,
      'avatar': avatar,
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
      avatar: map['avatar'],
      descricao: map['descricao'],
      comportamento: map['comportamento'],
      historia: map['historia'],
      pelo: map['pelo'],
      tamanho: map['tamanho'],
      idade: map['idade'],
    );
  }

  static Map<String, dynamic> toJson(DogModel dogModel) => {
        'id': dogModel.id,
        'nome': dogModel.nome,
        'img': dogModel.img,
        'avatar': dogModel.avatar,
        'descricao': dogModel.descricao,
        'comportamento': dogModel.comportamento,
        'historia': dogModel.historia,
        'pelo': dogModel.pelo,
        'tamanho': dogModel.tamanho,
        'idade': dogModel.idade,
      };

  @override
  String toString() {
    return 'DogModel(id: $id, nome: $nome, img: $img, descricao: $descricao, comportamento: $comportamento, historia: $historia, pelo: $pelo, tamanho: $tamanho, idade: $idade,)';
  }
}
