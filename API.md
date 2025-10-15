# API Документация

## Базовый URL
```
https://api.bmulti.store/webhook
```

## Авторизация

Все запросы (кроме `/user/auth`) требуют JWT токен в заголовке:
```
Authorization: Bearer <token>
```

---

## Эндпоинты

### 1. Авторизация пользователя

**POST** `/user/auth`

Авторизует пользователя через Telegram WebApp и возвращает JWT токен.

**Request Body:**
```json
{
  "initData": "string",  // Telegram initData
  "startApp": "string"   // Опционально: start_param
}
```

**Response:**
```json
{
  "status": true,
  "JWT_token": "eyJhbGc...",
  "user": {
    "id": 12345,
    "first_name": "Иван",
    "last_name": "Иванов",
    "card_balance": 1500
  },
  "transactions": [],
  "referral_stats": {
    "invited_count": 5,
    "total_earned": 500
  }
}
```

---

### 2. Получить список заданий

**GET** `/user/tasks`

Возвращает список всех заданий пользователя.

**Response:**
```json
{
  "status": true,
  "tasks": [
    {
      "id": 1,
      "title": "Ежедневный бонус",
      "points": 50,
      "task_type": "daily_bonus",
      "icon_url": "https://...",
      "availability_status": "available",
      "unavailable_reason": null
    }
  ]
}
```

**Task Types:**
- `daily_bonus` - Ежедневный бонус
- `cashback` - Кешбек за покупку
- `instagram_subscription` - Подписка на Instagram
- `instagram_stories` - Stories в Instagram
- `telegram_subscription` - Подписка на Telegram
- `referral` - Реферальная программа
- `review_bonus` - Бонус за отзыв

---

### 3. Получить ежедневный бонус

**POST** `/tasks/daily-bonus`

Начисляет ежедневный бонус пользователю.

**Request Body:**
```json
{
  "action": "Получение"
}
```

**Response:**
```json
{
  "code": "SUCCESS",
  "message": "Ежедневный бонус получен!"
}
```

**Коды ответа:**
- `SUCCESS` - Бонус успешно начислен
- `ALREADY_EXISTS` - Бонус уже получен сегодня

---

### 4. Отправить заявку на задание

**POST** `/tasks/submit-request`

Отправляет заявку на выполнение задания с файлами.

**Request (FormData):**
- `task_type` - Тип задания (cashback, instagram_subscription, instagram_stories, review_bonus)
- `marketplace` - Маркетплейс (для cashback и review_bonus)
- `receipt_image` - Фото чека (для cashback и review_bonus)
- `tag_image` - Фото бирки (для cashback и review_bonus)
- `screenshot_image` - Скриншот (для instagram_subscription и instagram_stories)

**Response:**
```json
{
  "success": true,
  "message": "Заявка принята"
}
```

---

### 5. Проверить подписку на Telegram

**GET** `/tasks/check-telegram-subscription`

Проверяет, подписан ли пользователь на Telegram канал.

**Response:**
```json
{
  "subscribed": true
}
```

---

### 6. Получить товары каталога

**GET** `/store/items`

Возвращает список товаров в каталоге.

**Response:**
```json
{
  "status": true,
  "items": [
    {
      "id": 1,
      "title": "Кроссовки Nike Air Max",
      "price": "5 990",
      "old_price": "8 990",
      "main_photo": "https://...",
      "photo_2": "https://...",
      "photo_3": "https://...",
      "photo_4": "https://...",
      "rating": "4.8",
      "ratings_num": "256",
      "sizes": "40, 41, 42, 43, 44"
    }
  ]
}
```

---

## Коды ошибок

- `401` - Unauthorized (токен отсутствует или невалидный)
- `403` - Forbidden (нет доступа)
- `404` - Not Found (ресурс не найден)
- `500` - Internal Server Error (ошибка сервера)

---

## Примечания

1. Все денежные значения в рублях
2. Даты в формате ISO 8601
3. Изображения принимаются в форматах: JPG, PNG, WebP
4. Максимальный размер файла: 10MB
