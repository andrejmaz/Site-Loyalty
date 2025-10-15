BASE_URL = https://api.bmulti.store/webhook/
HEADERS: Authorization: Bearer ${token}

### USER

POST /user/auth
BODY: {
    "initData": "",
    "startApp": ""
}
ANSWER: {
  "status": true,
  "user": {"id":7,"first_name":"Андрей","last_name":"| Технарь","tg_id":"641638479","tg_username":"ma_andrey","avatar":"https://t.me/i/userpic/320/45Apm9ckV6YyiqwwFKfZM7IOhXip9VeWopQ4yQHkU_4.svg","card_balance":1100,"level":"bronze"},
  "JWT_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9sfd"
}

GET /user/tasks
ANSWER: {
  "status": true,
  "tasks": [{"id":8,"title":"Ежедневный бонус","description":null,"points":20,"system_name":"daily_bonus","is_one_time":false,"is_active":true,"monthly_limit":null,"verification_type":"auto","icon_url":"./images/icons/daily.svg","index":1,"completion_count":"0","availability_status":"available","unavailable_reason":null,"is_available":true,"can_start":true}] - ❗️ ПЕРЕПИСАТЬ НА АКТУАЛЬНЫЙ
}


GET /user/transactions
ANSWER: {
  "status": true,
  "transactions": [{"id":8,"created_at":"2025-06-06T10:00:00.000Z","amount":500,"transaction_type":"purchase","is_positive":false,"task":null},{"id":6,"created_at":"2025-06-08T16:30:00.000Z","amount":100,"transaction_type":"task_reward","is_positive":true,"task":{"title":"Пригласить друга","type":"referral","icon":"./images/icons/refferal.svg"}},{"id":5,"created_at":"2025-06-09T10:00:00.000Z","amount":200,"transaction_type":"task_reward","is_positive":true,"task":{"title":"Stories в Instagram","type":"instagram_story","icon":"./images/icons/insta_story.svg"}},{"id":7,"created_at":"2025-06-09T16:30:00.000Z","amount":300,"transaction_type":"cashback","is_positive":false,"task":null}]
}

### STORE

GET /store/items
ANSWER: {
  "status": true,
  "items": [{"id":292,"created_at":"2025-09-30T16:58:16.844Z","internal_id":"T011","title":"Футболка с цепочкой на груди","main_photo":"https://i.postimg.cc/mrWMX4MX/T011-1.jpg","photo_2":"https://i.postimg.cc/vZVftT1x/T011-2.jpg","photo_3":"https://i.postimg.cc/yYWFWvsP/T011-3.jpg","photo_4":"https://i.postimg.cc/RV8wtK0z/T011-4.jpg","ratings_num":null,"rating":"4.7","sizes":"S-3XL","category":"Футболки","male":"","old_price":"2 100","price":"693"},{"id":293,"created_at":"2025-09-30T16:58:16.844Z","internal_id":"F035","title":"Футболка с принтом на груди","main_photo":"https://i.postimg.cc/4dDmdb58/F035-1.jpg","photo_2":"https://i.postimg.cc/wTd1Y23M/F035-2.jpg","photo_3":"https://i.postimg.cc/SRcjz21m/F035-3.jpg","photo_4":"https://i.postimg.cc/RCtWYyS2/F035-4.jpg","ratings_num":null,"rating":"4.7","sizes":"XS-3XL","category":"Футболки","male":"","old_price":"2 500","price":"1 250"}]
}

