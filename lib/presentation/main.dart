// Импорт библиотек
import 'package:flutter/material.dart';
import 'package:new_ui/new_ui.dart';

import '../domain/globals.dart';

// Губайдуллина Камилла Рустемовна, 23.12.2025, 12:46

void main() {
  // Точка входа в проект
  runApp(const MyApp());
}

// Корневой виджет приложения
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TestPage());
  }
}

// Класс главного экрана
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

// Класс состояния главного экрана
class _TestPageState extends State<TestPage> {
  int _selectedIndex = 0;
  int _index = 0;
  String? _nameError;
  String? _passwordError;
  bool inCart = false;

  void _validateForm() {
    setState(() {
      // Валидация имени
      if (nameController.text.isEmpty) {
        _nameError = 'Введите имя';
      } else {
        _nameError = null;
      }

      // Валидация пароля
      if (passwordController.text.isEmpty) {
        _passwordError = 'Введите пароль';
      } else if (passwordController.text.length < 6) {
        _passwordError = 'Минимум 6 символов';
      } else {
        _passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomTextField(
                    type: TextFieldType.text,
                    controller: nameController,
                    title: 'Имя',
                    haveTitle: true,
                    paddingTitle: 10,
                    paddingTextField: 10,
                    hintText: 'Введите ваше имя',
                    keyboardType: TextInputType.text,
                    color: input_bg,
                    borderColor: input_stroke,
                    focusColor: focus_textfield,
                    cursorColor: accent,
                    borderRadius: 10,
                    errorText: _nameError,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    type: TextFieldType.password,
                    controller: passwordController,
                    title: 'Пароль',
                    haveTitle: true,
                    paddingTitle: 10,
                    paddingTextField: 10,
                    hintText: 'Введите пароль',
                    keyboardType: TextInputType.visiblePassword,
                    color: input_bg,
                    borderColor: input_stroke,
                    focusColor: focus_textfield,
                    cursorColor: accent,
                    borderRadius: 10,
                    errorText: _passwordError,
                  ),
                  SizedBox(height: 30),
                  CustomDropdown(
                    items: ['Мужской', 'Женский'],
                    hintText: 'Пол',
                    borderRadius: 10,
                    padding: 25,
                    color: input_bg,
                    borderColor: input_stroke,
                    margin: 10,
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    type: ButtonType.primary,
                    widthButton: 335,
                    heightButton: 56,
                    borderRadius: 10,
                    elevationButton: 0,
                    textButton: 'Отправить',
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    onPressed: _validateForm,
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          type: ButtonType.chips,
                          widthButton: 110,
                          heightButton: 48,
                          borderRadius: 10,
                          elevationButton: 0,
                          textButton: 'Тест',
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          onPressed: () {},
                          isSelected: true,
                          background: accent,
                          colorText: white,
                        ),
                        CustomButton(
                          type: ButtonType.chips,
                          widthButton: 110,
                          heightButton: 48,
                          borderRadius: 10,
                          elevationButton: 0,
                          textButton: 'Тест',
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          onPressed: () {},
                          isSelected: false,
                          background: input_bg,
                          colorText: description,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 610,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(text[index], style: textStyle[index]),
                        );
                      },
                      itemCount: text.length,
                    ),
                  ),
                  SizedBox(
                    height: 870,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          width: double.infinity,
                          color: colors[index],
                          margin: EdgeInsets.symmetric(vertical: 5),
                        );
                      },
                      itemCount: colors.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBubble(
                          pathBubble: 'assets/sort.svg',
                          borderRadius: 16,
                          widthBubble: 24,
                          heightBubble: 24,
                          onPressed: () {},
                        ),
                        SizedBox(width: 20),
                        CustomToggleButton(
                          widthToggle: 48,
                          heightToggle: 28,
                          sizeToggle: 10,
                          colorToggle: white,
                          colorActive: accent,
                          colorInactive: input_stroke,
                        ),
                        SizedBox(width: 20),
                        CustomCounter(
                          widthCounter: 64,
                          heightCounter: 32,
                          radiusCounter: 8,
                          colorCounter: input_bg,
                          paddingCounter: 6,
                          onPlus: () {},
                          onMinus: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomHeader(
                    type: HeaderType.big,
                    textHeader: 'Корзина',
                    pathBubble: 'assets/back.svg',
                    heightBubble: 32,
                    widthBubble: 32,
                    pathIcon: 'assets/delete.svg',
                    heightIcon: 20,
                    widthIcon: 20,
                    horizontalPadding: 10,
                    verticalPadding: 10,
                    onBubble: () {},
                    onIcon: () {},
                  ),
                  SizedBox(height: 20),
                  CustomHeader(
                    type: HeaderType.small,
                    textHeader: 'Корзина',
                    pathBubble: 'assets/back.svg',
                    heightBubble: 32,
                    widthBubble: 32,
                    pathIcon: 'assets/delete.svg',
                    heightIcon: 20,
                    widthIcon: 20,
                    horizontalPadding: 10,
                    verticalPadding: 10,
                    onBubble: () {},
                    onIcon: () {},
                  ),
                  SizedBox(height: 20),
                  CustomCard(
                    colorCard: white,
                    type: CardType.primary,
                    title: 'Рубашка Воскресенье для машинного вязания',
                    category: 'Мужская одежда',
                    price: '300 ₽',
                    widthTitle: 303,
                    textButton: 'Добавить',
                    secondaryText: 'Убрать',
                    secondaryPressed: () {
                      setState(() {
                        inCart = false;
                      });
                    },
                    onPressed: () {
                      setState(() {
                        inCart = true;
                      });
                    },
                    paddingCard: 16,
                    inCart: inCart,
                  ),
                  SizedBox(height: 20),
                  CustomCard(
                    colorCard: white,
                    type: CardType.cart,
                    title: 'Рубашка воскресенье для машинного вязания',
                    widthTitle: 275,
                    paddingCard: 16,
                    price: '300 ₽',
                    count: '1 штук',
                    onMinus: () {},
                    onIcon: () {},
                    onPlus: () {},
                    inCart: false,
                  ),
                  SizedBox(height: 20),
                  CustomCard(
                    colorCard: white,
                    type: CardType.project,
                    title: 'Мой первый проект',
                    widthTitle: 303,
                    paddingCard: 16,
                    textButton: 'Открыть',
                    day: 'Прошло 2 дня',
                    onPressed: () {},
                    inCart: false,
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    type: ButtonType.primary,
                    widthButton: 335,
                    heightButton: 56,
                    borderRadius: 10,
                    elevationButton: 0,
                    textButton: 'Открыть модальное окно',
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    onPressed: () {
                      CustomModal.show(
                        context: context,
                        titleModal: 'Рубашка Воскресенье для машинного вязания',
                        contentModal:
                            'Мой выбор для этих шапок – кардные составы, которые раскрываются деликатным пушком. Кашемиры, мериносы, смесовки с ними отлично подойдут на шапку.Кардные составы берите в большое количество сложений, вязать будем резинку 1х1, плотненько.Пряжу 1400-1500м в 100г в 4 сложения, пряжу 700м в 2 сложения. Ориентир для конечной толщины – 300-350м в 100г.Артикулы, из которых мы вязали эту модель: Zermatt Zegna Baruffa, Cashfive, Baby Cashmere Loro Piana, Soft Donegal и другие.Примерный расход на шапку с подгибом 70-90г.',
                        content2Modal: '80-90 г',
                        backgroundColor: white,
                        radiusLeft: 20,
                        radiusRight: 20,
                        paddingModal: 20,
                        textButton: 'Добавить за 690',
                        widthTitle: 267,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        pathIcon: 'assets/close.svg',
                        text1: 'Описание',
                        text2: 'Примерный расход:',
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    type: ButtonType.inactive,
                    widthButton: 335,
                    heightButton: 56,
                    borderRadius: 10,
                    elevationButton: 0,
                    textButton: 'Открыть оповещение',
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    onPressed: () {
                      CustomSnackBar.show(
                        context: context,
                        title: 'Произошла ошибка',
                        text: 'Ну вот опять',
                        colorSnackBar: white,
                        radius: 12,
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    type: ButtonType.secondary,
                    widthButton: 335,
                    heightButton: 56,
                    borderRadius: 10,
                    elevationButton: 0,
                    textButton: 'Подтвердить',
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    type: ButtonType.tetriary,
                    widthButton: 335,
                    heightButton: 56,
                    borderRadius: 10,
                    elevationButton: 0,
                    textButton: 'Подтвердить',
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    type: ButtonType.cart,
                    widthButton: 335,
                    heightButton: 56,
                    borderRadius: 10,
                    elevationButton: 0,
                    textButton: 'В корзину',
                    price: '500 ₽',
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    iconButton: 'assets/cart.svg',
                    onPressed: () {},
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text('Категории меню', style: title2Semibold),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        return CustomButton(
                          type: ButtonType.chips,
                          widthButton: 110,
                          heightButton: 48,
                          borderRadius: 10,
                          elevationButton: 0,
                          isSelected: _selectedIndex == index,
                          textButton: categories[index],
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          onPressed: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: categories.length,
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomButton(
                    type: ButtonType.login,
                    widthButton: 335,
                    heightButton: 56,
                    borderRadius: 10,
                    elevationButton: 0,
                    textButton: 'Войти с VK',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    onPressed: () {},
                    iconButton: 'assets/vk.svg',
                  ),
                  SizedBox(height: 20),
                  CustomSearch(
                    hintText: 'Искать описание',
                    colorCursor: accent,
                    colorSearch: input_bg,
                    radiusSearch: 14,
                    colorBorder: input_stroke,
                    padding: 10,
                    controller: searchController,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text('Divider', style: title2Semibold),
                        Spacer(),
                      ],
                    ),
                  ),
                  CustomDivider(
                    colorDivider: divider,
                    heightDivider: 0,
                    thicknessDivider: 1,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomTabBar(
        color: white,
        onPressed: (index) {
          setState(() {
             _index = index;
          });
        },
        titles: ['Главная', 'Каталог', 'Проекты', 'Профиль'],
        icons: [
          'assets/home.png',
          'assets/categories.png',
          'assets/projects.png',
          'assets/profile.png',
        ], selectedIndex: _index,
      ),
    );
  }
}
