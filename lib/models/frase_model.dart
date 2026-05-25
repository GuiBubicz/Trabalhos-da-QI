class FraseModel {

  final int? id;

  final String texto;

  final int icone;

  final int cor;

  FraseModel({

    this.id,

    required this.texto,

    required this.icone,

    required this.cor,
  });

  Map<String, dynamic> toMap() {

    return {

      'id': id,

      'texto': texto,

      'icone': icone,

      'cor': cor,
    };
  }

  factory FraseModel.fromMap(
    Map<String, dynamic> map,
  ) {

    return FraseModel(

      id: map['id'],

      texto: map['texto'],

      icone: map['icone'],

      cor: map['cor'],
    );
  }
}