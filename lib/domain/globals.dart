//
import 'package:flutter/cupertino.dart';
import 'package:new_ui/new_ui.dart';

// Губайдуллина Камилла Рустемовна, 23.12.2025, 12:46, переменные проекта

// Список для отображения текста с определенным стилем
List<String> text = [
  'Title 1 - Semibold ',
  'Title 1 -  ExtraBold',
  'Title 2 -  Regular ',
  'Title 2 - Semibold ',
  'Title 2 -  ExtraBold ',
  'Title 3 -  Regular',
  'Title 3 -  Medium ',
  'Title 3 -  Semibold',
  'Headline -  Regular',
  'Headline -  Medium',
  'Text -  Regular',
  'Text -  Medium ',
  'Caption -  Regular',
  'Caption -  Semibold',
  'Caption 2 -  Regular',
  'Caption 2 -  Bold',
];

// Список со стилями текста
List<TextStyle> textStyle = [
  title1Semibold,
  title1ExtraBold,
  title2Regular,
  title2Semibold,
  title2ExtraBold,
  title3Regular,
  title3Medium,
  title3Semibold,
  headlineRegular,
  headlineMedium,
  textRegular,
  textMedium,
  captionRegular,
  captionSemibold,
  caption2Regular,
  caption2Bold,
];

// Список цветов
List<Color> colors = [
  accent,
  inactive,
  black,
  accent_inactive,
  white,
  error,
  success,
  input_bg,
  input_stroke,
  input_icon,
  placeholder,
  description,
  card_stroke,
];

// Список категорий для навигации в приложении
List<String> categories = [
  'Популярные',
  'Женщинам',
  'Мужчинам',
  'Детям',
  'Аксуссуары',
];

TextEditingController nameController =
    TextEditingController(); // Контроллер для имени пользователя
TextEditingController passwordController =
    TextEditingController(); // Контроллер для пароля
TextEditingController searchController =
    TextEditingController(); // Контроллер для поиска

