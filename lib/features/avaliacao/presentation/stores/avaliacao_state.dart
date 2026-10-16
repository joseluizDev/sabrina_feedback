import '../../data/models/avaliacao_model.dart';

final class AvaliacaoState {
  final int passoAtual;
  final int? whatsappScore;
  final int? sabrinaScore;
  final String comentario;
  final Set<String> tags;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final AvaliacaoModel? avaliacaoSalva;

  const AvaliacaoState({
    this.passoAtual = 1,
    this.whatsappScore,
    this.sabrinaScore,
    this.comentario = '',
    this.tags = const {},
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.avaliacaoSalva,
  });

  AvaliacaoState copyWith({
    int? passoAtual,
    int? whatsappScore,
    int? sabrinaScore,
    String? comentario,
    Set<String>? tags,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    AvaliacaoModel? avaliacaoSalva,
  }) {
    return AvaliacaoState(
      passoAtual: passoAtual ?? this.passoAtual,
      whatsappScore: whatsappScore ?? this.whatsappScore,
      sabrinaScore: sabrinaScore ?? this.sabrinaScore,
      comentario: comentario ?? this.comentario,
      tags: tags ?? this.tags,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      avaliacaoSalva: avaliacaoSalva ?? this.avaliacaoSalva,
    );
  }

  AvaliacaoState reset() => const AvaliacaoState();
}
