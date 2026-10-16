import 'package:flutter/foundation.dart';
import '../../data/models/avaliacao_model.dart';
import '../../domain/usecases/enviar_avaliacao_usecase.dart';
import 'avaliacao_state.dart';

final class AvaliacaoStore extends ValueNotifier<AvaliacaoState> {
  final EnviarAvaliacaoUseCase _enviarAvaliacaoUseCase;
  bool _descartado = false;

  AvaliacaoStore(this._enviarAvaliacaoUseCase) : super(const AvaliacaoState());

  void irParaPasso(int passo) {
    if (_descartado) return;
    value = value.copyWith(passoAtual: passo);
  }

  void selecionarWhatsapp(int nota) {
    if (_descartado) return;
    value = value.copyWith(whatsappScore: nota);
  }

  void selecionarSabrina(int nota) {
    if (_descartado) return;
    value = value.copyWith(sabrinaScore: nota);
  }

  void alternarTag(String tag) {
    if (_descartado) return;
    final novasTags = Set<String>.from(value.tags);
    if (novasTags.contains(tag)) {
      novasTags.remove(tag);
    } else {
      novasTags.add(tag);
    }
    value = value.copyWith(tags: novasTags);
  }

  void atualizarComentario(String comentario) {
    if (_descartado) return;
    value = value.copyWith(comentario: comentario);
  }

  Future<void> submeterAvaliacao() async {
    if (_descartado || value.isLoading) return;
    final wScore = value.whatsappScore;
    final sScore = value.sabrinaScore;
    if (wScore == null || sScore == null) return;

    value = value.copyWith(isLoading: true, errorMessage: null);

    final model = AvaliacaoModel(
      whatsappScore: wScore,
      sabrinaScore: sScore,
      comentario: value.comentario.trim(),
      tags: value.tags.toList(),
      criadaEm: DateTime.now(),
    );

    final result = await _enviarAvaliacaoUseCase(model);

    if (_descartado) return;

    result.fold(
      onSuccess: (data) {
        value = value.copyWith(
          isLoading: false,
          isSuccess: true,
          passoAtual: 5,
          avaliacaoSalva: data,
        );
      },
      onFailure: (message, _) {
        value = value.copyWith(
          isLoading: false,
          errorMessage: message,
        );
      },
    );
  }

  void reiniciar() {
    if (_descartado) return;
    value = value.reset();
  }

  @override
  void dispose() {
    _descartado = true;
    super.dispose();
  }
}
