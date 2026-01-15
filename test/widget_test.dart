import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_ui/new_ui.dart';
import 'package:test_ui/presentation/main.dart';

void main() {
  testWidgets('TextField Error', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // При нажатии на кнопку проверяем валидацию данных
    await tester.tap(find.text('Отправить'));
    await tester.pump();

    // Появляется ошибка, т.к. текстовое поле пустое
    expect(find.text('Введите имя'), findsOneWidget);


    // Вводим нужные данные, нажимаем кнопку для проверки
    final nameTextField = find.widgetWithText(CustomTextField, 'Имя');
    await tester.enterText(nameTextField, 'Камилла');
    await tester.tap(find.text('Отправить'));
    await tester.pump();

    // Данные в поле верны, ошибка исчезает
    expect(find.text('Введите имя'), findsNothing);
  });

  // testWidgets('', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MyApp());
  //
  //   expect(find.text('0'), findsOneWidget);
  //
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   expect(find.text('1'), findsOneWidget);
  // });
}
