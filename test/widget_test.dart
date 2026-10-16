import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sabrina_feedback/app.dart';
import 'package:sabrina_feedback/core/di.dart';

void main() {
  setUp(() {
    DependencyInjection.instance.reset();
    DependencyInjection.instance.init();
  });

  testWidgets('Feedback flow smoke test with DDD architecture', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const SabrinaFeedbackApp());

    // Step 1: Welcome Screen
    expect(find.text('Como foi o seu momento conosco?'), findsOneWidget);
    expect(find.text('PROSSEGUIR'), findsOneWidget);
    final prosseguirBottom = (tester.renderObject(find.text('PROSSEGUIR')) as RenderBox).localToGlobal(Offset.zero).dy;

    // Navigate to Step 2
    await tester.tap(find.text('PROSSEGUIR'));
    await tester.pumpAndSettle();

    // Step 2: WhatsApp Screen
    expect(find.text('Como foi seu atendimento pelo WhatsApp?'), findsOneWidget);
    expect(find.text('Nota 7 • Impecável / Excelente'), findsNothing);

    final heightBeforeVote = (tester.renderObject(find.byKey(const ValueKey(2))) as RenderBox).size.height;

    // Select score 1 then 7
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();
    expect(find.text('Nota 1 • Pouco satisfatório'), findsOneWidget);

    final heightAfterVote1 = (tester.renderObject(find.byKey(const ValueKey(2))) as RenderBox).size.height;
    expect(heightAfterVote1, equals(heightBeforeVote));

    await tester.tap(find.text('7'));
    await tester.pumpAndSettle();
    expect(find.text('Nota 7 • Impecável / Excelente'), findsOneWidget);

    final heightAfterVote7 = (tester.renderObject(find.byKey(const ValueKey(2))) as RenderBox).size.height;
    expect(heightAfterVote7, equals(heightBeforeVote));

    final continuar2Bottom = (tester.renderObject(find.text('CONTINUAR')) as RenderBox).localToGlobal(Offset.zero).dy;
    expect(continuar2Bottom, equals(prosseguirBottom));

    // Navigate to Step 3
    await tester.tap(find.text('CONTINUAR'));
    await tester.pumpAndSettle();

    // Step 3: Sabrina Screen
    expect(find.text('Como foi seu atendimento com a Sabrina?'), findsOneWidget);
    await tester.tap(find.text('6'));
    await tester.pumpAndSettle();
    expect(find.text('Nota 6 • Encantador'), findsOneWidget);

    final continuar3Bottom = (tester.renderObject(find.text('CONTINUAR')) as RenderBox).localToGlobal(Offset.zero).dy;
    expect(continuar3Bottom, equals(prosseguirBottom));

    // Navigate to Step 4
    await tester.tap(find.text('CONTINUAR'));
    await tester.pumpAndSettle();

    // Step 4: Comment / Tag Screen
    expect(find.text('Como podemos melhorar sua experiência?'), findsOneWidget);
    await tester.tap(find.text('✦ Pontualidade'));
    await tester.pumpAndSettle();

    final enviarBottom = (tester.renderObject(find.text('ENVIAR AVALIAÇÃO')) as RenderBox).localToGlobal(Offset.zero).dy;
    expect(enviarBottom, equals(prosseguirBottom));

    // Submit Feedback
    final submitFinder = find.text('ENVIAR AVALIAÇÃO');
    await tester.ensureVisible(submitFinder);
    await tester.tap(submitFinder);
    await tester.pumpAndSettle();

    // Step 5: Success Screen
    expect(find.text('Gratidão pelo seu carinho!'), findsOneWidget);
    expect(find.text('7/7'), findsOneWidget);
    expect(find.text('6/7'), findsOneWidget);

    final resetFinder = find.text('ENVIAR NOVO FEEDBACK');
    expect(resetFinder, findsOneWidget);
    await tester.tap(resetFinder);
    await tester.pumpAndSettle();

    // Back to Step 1
    expect(find.text('Como foi o seu momento conosco?'), findsOneWidget);
  });
}
