import 'package:flutter/material.dart';

import '../../../../core/di.dart';
import '../../../../core/theme/app_colors.dart';
import '../stores/avaliacao_state.dart';
import '../stores/avaliacao_store.dart';
import '../widgets/progress_bar_header.dart';
import '../widgets/step_comment.dart';
import '../widgets/step_sabrina.dart';
import '../widgets/step_success.dart';
import '../widgets/step_welcome.dart';
import '../widgets/step_whatsapp.dart';

class AvaliacaoPage extends StatefulWidget {
  const AvaliacaoPage({super.key});

  @override
  State<AvaliacaoPage> createState() => _AvaliacaoPageState();
}

class _AvaliacaoPageState extends State<AvaliacaoPage> {
  late final AvaliacaoStore _store;
  late final TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _store = DependencyInjection.instance.getIt<AvaliacaoStore>();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _commentController.dispose();
    _store.dispose();
    super.dispose();
  }

  void _onTagPressed(String tag) {
    _store.alternarTag(tag);
    final current = _commentController.text.trim();
    if (_store.value.tags.contains(tag)) {
      if (current.isEmpty) {
        _commentController.text = '$tag. ';
      } else if (!current.contains(tag)) {
        final prefix = current.endsWith('.') ? ' ' : '. ';
        _commentController.text = '$current$prefix$tag. ';
      }
      _store.atualizarComentario(_commentController.text);
    }
  }

  void _onResetPressed() {
    _commentController.clear();
    _store.reiniciar();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AvaliacaoState>(
      valueListenable: _store,
      builder: (context, state, _) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.8, -0.8),
                radius: 1.4,
                colors: [AppColors.bgStart, AppColors.bgMid, AppColors.bgEnd],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Indicador de Progresso (Passo 1 a 3)
                        ProgressBarHeader(currentStep: state.passoAtual),

                        // Card Principal de Luxo
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.90),
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(color: AppColors.slate200),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.slate700.withValues(alpha: 0.12),
                                blurRadius: 40,
                                offset: const Offset(0, 18),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Filete superior metalizado
                              Container(
                                height: 4,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.gold200,
                                      AppColors.gold300,
                                      AppColors.gold200,
                                    ],
                                  ),
                                ),
                              ),

                              // Conteúdo da Etapa Atual em tamanho unificado
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 26.0),
                                child: Container(
                                  constraints: const BoxConstraints(minHeight: 520),
                                  alignment: Alignment.center,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 350),
                                    child: _buildCurrentStep(state),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
                        const Text(
                          'ESTÉTICA AVANÇADA • EXPERIÊNCIA EXCLUSIVA',
                          style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 2.2,
                            color: AppColors.slate600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCurrentStep(AvaliacaoState state) {
    switch (state.passoAtual) {
      case 1:
        return StepWelcome(
          onNext: () => _store.irParaPasso(2),
        );
      case 2:
        return StepWhatsapp(
          score: state.whatsappScore,
          onSelectScore: _store.selecionarWhatsapp,
          onBack: () => _store.irParaPasso(1),
          onNext: state.whatsappScore != null ? () => _store.irParaPasso(3) : null,
        );
      case 3:
        return StepSabrina(
          score: state.sabrinaScore,
          onSelectScore: _store.selecionarSabrina,
          onBack: () => _store.irParaPasso(2),
          onNext: state.sabrinaScore != null ? () => _store.irParaPasso(4) : null,
        );
      case 4:
        return StepComment(
          controller: _commentController,
          selectedTags: state.tags,
          onToggleTag: _onTagPressed,
          onCommentChanged: _store.atualizarComentario,
          onBack: () => _store.irParaPasso(3),
          onSubmit: state.isLoading ? null : () => _store.submeterAvaliacao(),
        );
      case 5:
        return StepSuccess(
          whatsappScore: state.whatsappScore,
          sabrinaScore: state.sabrinaScore,
          comment: state.comentario,
          onReset: _onResetPressed,
        );
      default:
        return StepWelcome(
          onNext: () => _store.irParaPasso(2),
        );
    }
  }
}
