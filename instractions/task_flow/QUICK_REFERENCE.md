# Быстрый справочник по SQL-запросам

## 1. Проверка доступности
```sql
-- 1_check_availability.sql
-- Параметры: user_id, task_id
SELECT ... FROM tasks WHERE id = $2 AND user_id = $1;
```
**N8N настройка:**
```javascript
[
  {{ $json.user_id }},
  {{ $json.task_id }}
]
```

---

## 2. Создание user_task
```sql
-- 2_create_user_task.sql
-- Параметры: user_id, task_id, salebot_order_id, comment
INSERT INTO user_tasks (...) VALUES ($1, $2, $3, $4);
```
**N8N настройка (auto):**
```javascript
[
  {{ $json.user_id }},
  {{ $json.task_id }},
  0,
  null
]
```

**N8N настройка (manual с данными):**
```javascript
[
  {{ $json.user_id }},
  {{ $json.task_id }},
  {{ $json.salebot_order_id }},
  {{ JSON.stringify($json.form_data) }}
]
```

---

## 3. Завершение (auto)
```sql
-- 3_complete_task_auto.sql
-- Параметры: user_task_id
UPDATE user_tasks SET status = 'approved' WHERE id = $1;
```
**N8N настройка:**
```javascript
[
  {{ $json.user_task.id }}
]
```

---

## 4. Webhook успех (manual)
```sql
-- 4_webhook_success.sql
-- Параметры: identifier, search_type, custom_points
-- search_type: 'id' | 'salebot_order_id'
-- custom_points: NULL = использовать points_awarded из задания
```
**N8N настройка (поиск по ID):**
```javascript
[
  {{ $json.user_task_id }},
  'id',
  null  // или {{ $json.custom_points }} для переопределения баллов
]
```

**N8N настройка (поиск по SaleBot ID):**
```javascript
[
  {{ $json.salebot_order_id }},
  'salebot_order_id',
  null  // или {{ $json.custom_points }} для переопределения баллов
]
```

**N8N настройка (с кастомными баллами):**
```javascript
[
  {{ $json.salebot_order_id }},
  'salebot_order_id',
  150  // начислить 150 баллов вместо стандартных
]
```

---

## 5. Webhook отказ (manual)
```sql
-- 5_webhook_failure.sql
-- Параметры: identifier, search_type, rejection_reason
```
**N8N настройка:**
```javascript
[
  {{ $json.salebot_order_id }},
  'salebot_order_id',
  {{ $json.rejection_reason || 'Заявка отклонена' }}
]
```

---

## Примеры задач

### Ежедневный бонус (daily_bonus)
```
verification_type: auto
system_name: daily_bonus

Flow:
1_check_availability → 2_create_user_task → 3_complete_task_auto
```

### Подписка на Telegram (telegram_subscribe)
```
verification_type: auto
system_name: telegram_subscribe

Flow:
1_check_availability → 2_create_user_task → 3_complete_task_auto
```

### Кешбэк (cashback)
```
verification_type: manual
system_name: cashback

Flow:
1_check_availability → 2_create_user_task → SaleBot → 4_webhook_success / 5_webhook_failure
```

### Подписка на Instagram (instagram_subscribe)
```
verification_type: manual
system_name: instagram_subscribe

Flow:
1_check_availability → 2_create_user_task → SaleBot → 4_webhook_success / 5_webhook_failure
```

### Отзыв (review)
```
verification_type: manual
system_name: review

Flow:
1_check_availability → 2_create_user_task → SaleBot → 4_webhook_success / 5_webhook_failure
```

### Stories в Instagram (instagram_story)
```
verification_type: manual
system_name: instagram_story
monthly_limit: 1

Flow:
1_check_availability → 2_create_user_task → SaleBot → 4_webhook_success / 5_webhook_failure
```

### Приглашение друга (referral)
```
verification_type: auto
system_name: referral
monthly_limit: 10

Flow:
1_check_availability → 2_create_user_task → 3_complete_task_auto
```

---

## Обработка ответов в N8N

### После проверки доступности:
```javascript
// If Node
{{ $json.result.status === true }}
```

### После создания user_task:
```javascript
// Switch Node по verification_type
{{ $json.result.verification_type }}

// Case 'auto' → 3_complete_task_auto
// Case 'manual' → SaleBot + уведомление
```

### Webhook от SaleBot:
```javascript
// Switch Node по статусу
{{ $json.status }}

// Case 'approved' → 4_webhook_success
// Case 'rejected' → 5_webhook_failure
```

---

## Формат данных для comment

### Кешбэк (cashback):
```json
{
  "purchase_amount": 5000,
  "receipt_url": "https://...",
  "photo_url": "https://..."
}
```

### Instagram подписка (instagram_subscribe):
```json
{
  "screenshot_url": "https://..."
}
```

### Отзыв (review):
```json
{
  "purchase_photo_url": "https://...",
  "review_photo_url": "https://..."
}
```

### Instagram stories (instagram_story):
```json
{
  "instagram_username": "@username",
  "screenshot_url": "https://..."
}
```

---

## Коды ошибок

| Код ошибки | Сообщение | Действие |
|------------|-----------|----------|
| `TASK_NOT_FOUND` | Задание не найдено | Проверить task_id |
| `TASK_INACTIVE` | Задание неактивно | Задание отключено |
| `ALREADY_COMPLETED` | Уже выполнено | Одноразовое задание |
| `DAILY_LIMIT` | Возвращайся завтра | Ежедневный бонус |
| `MONTHLY_LIMIT` | Месячный лимит исчерпан | Достигнут лимит |
| `IN_PROGRESS` | У вас уже есть заявка в работе | Дождаться проверки |

---

## Тестирование

### 1. Тест ежедневного бонуса:
```sql
-- Проверка
SELECT * FROM tasks WHERE system_name = 'daily_bonus';

-- Выполнение
-- 1. 1_check_availability.sql с [user_id, task_id]
-- 2. 2_create_user_task.sql с [user_id, task_id, 0, null]
-- 3. 3_complete_task_auto.sql с [user_task_id]

-- Проверка результата
SELECT * FROM user_tasks WHERE user_id = ? AND task_id = ?;
SELECT * FROM point_transactions WHERE user_id = ?;
SELECT card_balance FROM users WHERE id = ?;
```

### 2. Тест подписки на Telegram:
```sql
-- То же самое, что и ежедневный бонус
-- Но проверяем, что нельзя выполнить дважды
```

### 3. Тест кешбэка:
```sql
-- 1. 1_check_availability.sql
-- 2. 2_create_user_task.sql с comment
-- Проверяем, что статус = 'pending'
-- 4. 4_webhook_success.sql (симулируем одобрение)
-- Проверяем баланс и транзакцию
```

