import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/result.dart';
import '../../data/models/avaliacao_model.dart';
import '../../domain/repositories/avaliacao_repository.dart';

abstract interface class AvaliacaoService {
  Future<Result<AvaliacaoModel>> salvarAvaliacao(AvaliacaoModel avaliacao);
}

final class AvaliacaoMockService implements AvaliacaoService {
  final List<AvaliacaoModel> _avaliacoes = [];

  List<AvaliacaoModel> get avaliacoes => List.unmodifiable(_avaliacoes);

  @override
  Future<Result<AvaliacaoModel>> salvarAvaliacao(AvaliacaoModel avaliacao) async {
    _avaliacoes.add(avaliacao);
    return Success(avaliacao);
  }
}

final class AvaliacaoFirebaseService implements AvaliacaoService {
  final FirebaseDatabase? _database;
  final AvaliacaoMockService _mockFallback;

  AvaliacaoFirebaseService({this._database, AvaliacaoMockService? mockFallback})
      : _mockFallback = mockFallback ?? AvaliacaoMockService();

  @override
  Future<Result<AvaliacaoModel>> salvarAvaliacao(AvaliacaoModel avaliacao) async {
    try {
      if (Firebase.apps.isEmpty) {
        return await _mockFallback.salvarAvaliacao(avaliacao);
      }
      final db = _database ?? FirebaseDatabase.instance;
      final ref = db.ref('feedbacks').push();
      await ref.set(avaliacao.toMap());
      return Success(avaliacao);
    } catch (e) {
      return Failure('Erro ao salvar avaliação: $e');
    }
  }
}

final class AvaliacaoRepositoryImpl implements AvaliacaoRepository {
  final AvaliacaoService _service;

  const AvaliacaoRepositoryImpl(this._service);

  @override
  Future<Result<AvaliacaoModel>> enviarAvaliacao(AvaliacaoModel avaliacao) {
    return _service.salvarAvaliacao(avaliacao);
  }
}
