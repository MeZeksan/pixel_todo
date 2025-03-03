class GetPriorityImageService {
  /// Функция для выбора картинки в зависимости от приоритета
  static String getPriorityImage(int priority) {
    return switch (priority) {
      0 => 'assets/images/low_priority.png', // Изображение для низкого приоритета
      1 => 'assets/images/medium_priority.png', // Изображение для среднего приоритета
      2 => 'assets/images/top_priority.png', // Изображение для высокого приоритета
      _ => 'assets/images/catbox.png', // По умолчанию низкий приоритет
    };
  }
}
