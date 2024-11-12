#!/bin/sh

# Перейти на уровень выше, если это необходимо
echo "Переход на уровень выше..."
if [ -d "../ios" ]; then
  cd ..
fi

# Выполнить очистку Flutter
echo "Выполняем очистку Flutter..."
if ! fvm flutter clean; then
  echo "Ошибка при выполнении 'fvm flutter clean'"
  exit 1
fi

# Перейти в каталог iOS
echo "Переход в каталог ios..."
if ! cd ios; then
  echo "Ошибка при переходе в ios"
  exit 1
fi

# Удалить папку Pods
echo "Удаление папки Pods..."
if ! rm -rf Pods; then
  echo "Ошибка при удалении папки Pods"
  exit 1
fi

# Удалить кеши в DerivedData
echo "Удаление кешей в DerivedData..."
if ! rm -rf ~/Library/Developer/Xcode/DerivedData/*; then
  echo "Ошибка при удалении кешей в DerivedData"
  exit 1
fi

# Очистить кеши CocoaPods
echo "Очистка кешей CocoaPods..."
if ! pod cache clean --all; then
  echo "Ошибка при очистке кешей CocoaPods"
  exit 1
fi

# Вернуться к корню проекта
echo "Возврат в корень проекта..."
if ! cd ..; then
  echo "Ошибка при возврате в корень проекта"
  exit 1
fi

# Получить зависимости Flutter
echo "Получение зависимостей Flutter..."
if ! fvm flutter pub get; then
  echo "Ошибка при выполнении 'fvm flutter pub get'"
  exit 1
fi

echo "Очистка и установка завершены."