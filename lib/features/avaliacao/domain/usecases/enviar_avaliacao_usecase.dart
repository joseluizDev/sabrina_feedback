import '../../../../core/result.dart';
import '../../data/models/avaliacao_model.dart';
import '../repositories/avaliacao_repository.dart';

final class EnviarAvaliacaoUseCase {
  final AvaliacaoRepository _repository;

  const EnviarAvaliacaoUseCase(this._repository);

  Future<Result<AvaliacaoModel>> call(AvaliacaoModel avaliacao) {
    if (avaliacao.whatsappScore < 1 || avaliacao.whatsappScore > 7) {
      return Future.value(const Failure('Nota do WhatsApp inválida'));
    }
    if (avaliacao.sabrinaScore < 1 || avaliacao.sabrinaScore > 7) {
      return Future.value(const Failure('Nota da Sabrina inválida'));
    }
    return _repository.enviarAvaliacao(avaliacao);
  }
}
