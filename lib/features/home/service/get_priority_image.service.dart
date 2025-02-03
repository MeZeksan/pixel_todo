// Функция для выбора картинки в зависимости от приоритета
String getPriorityImage(int priority) {
  switch (priority) {
    case 0:
      return 'assets/images/low_priority.png'; // Изображение для низкого приоритета
    case 1:
      return 'assets/images/medium_priority.png'; // Изображение для среднего приоритета
    case 2:
      return 'assets/images/top_priority.png'; // Изображение для высокого приоритета
    default:
      return 'assets/images/catbox.png'; // По умолчанию низкий приоритет
  }
}
