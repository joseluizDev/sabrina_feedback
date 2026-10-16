class AvaliacaoModel {
  final int whatsappScore;
  final int sabrinaScore;
  final String comentario;
  final List<String> tags;
  final DateTime criadaEm;

  const AvaliacaoModel({
    required this.whatsappScore,
    required this.sabrinaScore,
    required this.comentario,
    required this.tags,
    required this.criadaEm,
  });

  Map<String, dynamic> toMap() => {
    'whatsappScore': whatsappScore,
    'sabrinaScore': sabrinaScore,
    'comentario': comentario,
    'tags': tags,
    'criadaEm': criadaEm.toIso8601String(),
  };

  factory AvaliacaoModel.fromMap(Map<String, dynamic> map) {
    return AvaliacaoModel(
      whatsappScore: (map['whatsappScore'] as num).toInt(),
      sabrinaScore: (map['sabrinaScore'] as num).toInt(),
      comentario: (map['comentario'] as String?) ?? '',
      tags: List<String>.from((map['tags'] as List?) ?? const []),
      criadaEm: DateTime.tryParse((map['criadaEm'] as String?) ?? '') ?? DateTime.now(),
    );
  }
}
