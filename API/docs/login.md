# POST /auth/login
## Описание
Аутентификация пользователя с использованием логина и пароля.
## Тело запроса
```json
{
  "username": "max@gmail.com",
  "password": "password"
}
```
## Тело ответа (200 OK)
```json
{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEyMzQiLCJ1c2VybmFtZSI6ImJpcnNjaG5lcnNvZXZfaGVsbG9fc2VjdXJpdHkiLCJyb2xlIjoidXNlciJ9.cZL6FJ2EKzK4gSKpPVo5v6poE1T9m3MxoA3on8RHkJ2I",
  "refreshToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEyMzQiLCJ1c2VybmFtZSI6ImJpcnNjaG5lcnNvZXZfaGVsbG9fc2VjdXJpdHkiLCJyb2xlIjoidXNlciJ9.cZL6FJ2EKzK4gSKpPVo5v6poE1T9m3MxoA3on8RHkJ2I",
  "expiersIn": 3600
}
```
## Ошибки
### 400 - Некорректный запрос
Пример ответа:
```json
{
  "error": "Bad Request",
  "message": "Некорректный формат данных",
  "details": {
    "field": "password",
    "issue": "Пароль должен содержать минимум 8 символов, включая цифры и буквы."
  }
}
```
### 401 - Неавторизованный пользователь
Пример ответа:
```json
{
  "error": "Internal Server Error",
  "message": "Внутренняя ошибка сервера. Попробуйте позже.",
  "retryAfter": 60
}
```
### 429 - Слишком много запросов
Пример ответа:
```json
{
  "error": "Unauthorized",
  "message": "Токен неверный или истек"
}
```
### 500 - Внутренняя ошибка сервера
Пример ответа:
```json
{
  "error": "Internal Server Error",
  "message": "Внутренняя ошибка сервера. Попробуйте позже."
}
```
