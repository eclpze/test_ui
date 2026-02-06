import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_ui/new_ui.dart';
import 'package:test_ui/presentation/main.dart';

void main() {
  // Тест 1
  testWidgets('TextField Error', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // При нажатии на кнопку проверяем валидацию данных
    await tester.tap(find.text('Отправить'));
    await tester.pump();

    // Переменные для проверки параметров
    final textField = find.byType(TextField).first;
    final textFieldWidget = tester.widget<TextField>(textField);
    final errorMessage = tester.widget<Text>(find.text('Введите имя'));
    final decoration = textFieldWidget.decoration as InputDecoration;
    final border = decoration.border as OutlineInputBorder;

    // Проверка наличия ошибки
    expect(find.text('Введите имя'), findsOneWidget);

    // Проверка фона, обводки и соотвествующего цвета ошибки
    expect((decoration.fillColor), error_textfield);
    expect((border.borderSide.color), error);
    expect((errorMessage.style!.color!), error);

    // Вводим нужные данные, нажимаем кнопку для проверки
    await tester.enterText(textField, 'Камилла');
    await tester.tap(find.text('Отправить'));
    await tester.pump();

    // Данные в поле верны, ошибка исчезает
    expect(find.text('Введите имя'), findsNothing);
  });

  // Тест 2
  testWidgets('Work Dropdown', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Проверка того, что изначально виден только hintText
    expect(find.text('Пол'), findsOneWidget);
    expect(find.text('Женский'), findsNothing);
    expect(find.text('Мужской'), findsNothing);

    // Выбор пола
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pump();

    // Проверка, что после нажатия видны оба варианта
    expect(find.text('Женский'), findsOneWidget);
    expect(find.text('Мужской'), findsOneWidget);
  });

  // Тест 3
  testWidgets('Work Button Chips', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Переменные для проверки
    final chips = find.byWidgetPredicate(
      (w) =>
          w is CustomButton &&
          w.textButton == 'Тест' &&
          w.type == ButtonType.chips,
    );
    final listChips = tester.widgetList<CustomButton>(chips);

    // Проверка количества chips и состояний кнопок
    expect(listChips, hasLength(2));
    expect(listChips.first.isSelected, true);
    expect(listChips.last.isSelected, false);
    expect(listChips.first.background, accent);
    expect(listChips.last.background, input_bg);
    expect(listChips.first.colorText, white);
    expect(listChips.last.colorText, description);
  });

  // Тест 4
  testWidgets('Work Card Primary', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Переменные для проверки
    final card = find.byWidgetPredicate(
      (w) => w is CustomCard && w.type == CardType.primary,
    );
    final cardWidget = tester.widget<CustomCard>(card);
    final button = find.descendant(
      of: card,
      matching: find.byType(CustomButton),
    );
    final buttonWidget = tester.widget<CustomButton>(button);

    // Проверяем количество виджетов и состояние карточки
    expect(card, findsOneWidget);
    expect(cardWidget.inCart, false);
    expect(button, findsOneWidget);

    // Проверка карточки на соответствие с макетом
    if (cardWidget.inCart) {
      expect(buttonWidget.type, ButtonType.secondary);
      expect(buttonWidget.textButton, 'Убрать');
    } else {
      expect(buttonWidget.type, ButtonType.primary);
      expect(buttonWidget.textButton, 'Добавить');
    }
  });

  // Тест 5
  testWidgets('Work TabBar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Переменные для проверки
    final tabBar = find.byType(BottomNavigationBar);
    final tabBarWidget = tester.widget<BottomNavigationBar>(tabBar);
    final image = find.descendant(of: tabBar, matching: find.byType(Image));
    final images = tester.widgetList<Image>(image).toList();

    // Проверка индекса и наличия tabbar
    expect(tabBar, findsOneWidget);
    expect(tabBarWidget.currentIndex, 0);

    // Проверка цветов до нажатия
    expect(images[0].color, accent);
    expect(images[1].color, color_icons);

    //  Переход на следующий раздел
    await tester.tap(find.text('Каталог'));
    await tester.pump();

    // Переменные после нажатия
    final updateTabBarWidget = tester.widget<BottomNavigationBar>(tabBar);
    expect(updateTabBarWidget.currentIndex, 1);
    final updateImages = tester.widgetList<Image>(image).toList();

    // Проверка цветов после нажатия
    expect(updateImages[0].color, color_icons);
    expect(updateImages[1].color, accent);

  });
}
