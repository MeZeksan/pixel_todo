class GetDifficultyImageService {
  /// Функция для выбора картинки в зависимости от приоритета
  static String getDifficultyImage(int difficulty) {
    return switch (difficulty) {
      0 => 'assets/images/easy_difficulty.png',
      1 => 'assets/images/medium_difficulty.png',
      2 => 'assets/images/hard_difficulty.png',
      3 => 'assets/images/insane_difficulty.png',
      _ => 'assets/images/easy_difficulty.png',
    };
  }
}
