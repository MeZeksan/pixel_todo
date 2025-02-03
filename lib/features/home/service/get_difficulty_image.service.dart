// Функция для выбора картинки в зависимости от приоритета
String getDiffucultyImage(int difficulty) {
  switch (difficulty) {
    case 0:
      return 'assets/images/easy_difficulty.png';
    case 1:
      return 'assets/images/medium_difficulty.png';
    case 2:
      return 'assets/images/hard_difficulty.png';
    case 3:
      return 'assets/images/insane_difficulty.png';
    default:
      return 'assets/images/easy_difficulty.png'; // По умолчанию низкий приоритет
  }
}
