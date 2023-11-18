import 'package:flutter_test/flutter_test.dart';

import 'package:flatbeat/main.dart'; // Certifique-se de que o caminho do import está correto

void main() {
  testWidgets('HomeScreen has a title', (WidgetTester tester) async {
    // Construa nosso app e dispare um frame.
    await tester.pumpWidget(const FlabeatApp());

    // Verifique se o título está presente no AppBar.
    expect(find.text('Flabeat'), findsOneWidget);
  });

  // Adicione mais testes conforme necessário para os widgets que você criou
}
