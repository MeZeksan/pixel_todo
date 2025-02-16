
# PIXEL TODO RPG 🎮📝  
**Превращайте рутину в приключение!**  
Кроссплатформенное мобильное приложение на Flutter, где задачи становятся RPG-квестами с системой сложности, приоритета, дедлайнов и будущими наградами.

---

### Текущая версия:
**1.1.0**

## 🛠 Технологии и библиотеки

### Основные зависимости
| Библиотека/Технология | Версия | Назначение |
|-----------------------|--------|------------|
| **Flutter**           | SDK    | Базовый фреймворк для кроссплатформенной разработки |
| **Bloc**              | ^9.0.0 | Управление сложным состоянием приложения |
| **hive_flutter**      | ^1.1.0 | Локальная NoSQL-база данных для хранения задач и настроек |
| **uuid**              | ^4.5.1 | Генерация уникальных ID для задач и сущностей |
| **get_it**            | ^8.0.2 | Внедрение зависимостей (Service Locator) для управления состоянием и сервисами |
| **intl**              | ^0.18.1| Интернационализация и форматирование дат/времени |

### Планы по интеграции (в разработке)
- **Firebase**: Аутентификация, Cloud Firestore, аналитика  
- **FCM (Firebase Cloud Messaging)**: Push-уведомления о дедлайнах  

### Dev-зависимости
- **hive_generator** – Генерация адаптеров для Hive  
- **build_runner** – Автоматизация кодогенерации  

---

## 🌟 Особенности приложения
- **RPG-механики**: Задачи = квесты с параметрами:
  - 💀💀💀 Сложность (Easy/Medium/Hard)  
  - 🔥🔥🔥 Приоритет (Low/Medium/High)  
  - ⏳ Дедлайн квеста
- **Оффлайн-работа**: Все данные хранятся локально (Hive)  
- **Модульная архитектура**: Четкое разделение на слои (UI, логика, данные)  
- **Стейт-менеджмент**: Используется **Bloc 9.0.0** для эффективного управления состоянием приложения  

---

## 📸 Скриншоты

Ниже представлены основные экраны приложения:

### Главный экран
<img src="assets/screenshots/main_screenshot.jpg"  alt="Главный экран" width="300">

### Экран заметки
![Экран заметки](assets\screenshots\note_screenshot.jpg)

### Диалог удаления задачи
![Диалог удаления задачи](assets\screenshots\delete_task_screenshot.jpg)

### Диалог добавления задачи
![Диалог добавления задачи](assets\screenshots\add_task_screenshot.jpg)
