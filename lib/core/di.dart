import 'package:get_it/get_it.dart';

import '../features/avaliacao/data/repositories/avaliacao_repository_impl.dart';
import '../features/avaliacao/domain/repositories/avaliacao_repository.dart';
import '../features/avaliacao/domain/usecases/enviar_avaliacao_usecase.dart';
import '../features/avaliacao/presentation/stores/avaliacao_store.dart';

final class DependencyInjection {
  static final DependencyInjection instance = DependencyInjection._();
  DependencyInjection._();

  final GetIt _getIt = GetIt.instance;
  GetIt get getIt => _getIt;

  void init() {
    if (_getIt.isRegistered<AvaliacaoStore>()) return;

    // Data Sources & Services
    _getIt.registerLazySingleton<AvaliacaoService>(() => AvaliacaoFirebaseService());

    // Repositories
    _getIt.registerLazySingleton<AvaliacaoRepository>(
      () => AvaliacaoRepositoryImpl(_getIt<AvaliacaoService>()),
    );

    // Use Cases
    _getIt.registerFactory<EnviarAvaliacaoUseCase>(
      () => EnviarAvaliacaoUseCase(_getIt<AvaliacaoRepository>()),
    );

    // Presentation Stores
    _getIt.registerFactory<AvaliacaoStore>(
      () => AvaliacaoStore(_getIt<EnviarAvaliacaoUseCase>()),
    );
  }

  void reset() {
    _getIt.reset();
  }
}
