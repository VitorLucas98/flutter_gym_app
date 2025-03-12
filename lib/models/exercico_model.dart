class ExcercicioModel {
  String id;
  String name;
  String treino;
  String comoFazer;
  String? urlImagem;
  
  ExcercicioModel({
    required this.id,
    required this.name,
    required this.treino,
    required this.comoFazer
  });

  ExcercicioModel.fromMap(Map<String, dynamic> map) :
    id = map['id'],
    name = map['name'],
    treino = map['treino'],
    comoFazer = map['comoFazer'];

    Map<String, dynamic> toMap() {
      return {
        'id': id,
        'name': name,
        'treino': treino,
        'comoFazer': comoFazer,
        'urlImagem': urlImagem
      };
    }

}