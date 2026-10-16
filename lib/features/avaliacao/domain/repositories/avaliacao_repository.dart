import '../../../../core/result.dart';
import '../../data/models/avaliacao_model.dart';

abstract interface class AvaliacaoRepository {
  Future<Result<AvaliacaoModel>> enviarAvaliacao(AvaliacaoModel avaliacao);
}
