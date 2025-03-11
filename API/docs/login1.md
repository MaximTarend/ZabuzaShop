# POST /auth/login
## Описание
Аутентификация пользователя с использованием логина и пароля.
## Тело запроса
'''json
{
  "username": "max@gmail.com",
  "password": "password"
}
## Тело ответа
'''json
{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEyMzQiLCJ1c2VybmFtZSI6ImJpcnNjaG5lcnNvZXZfaGVsbG9fc2VjdXJpdHkiLCJyb2xlIjoidXNlciJ9.cZL6FJ2EKzK4gSKpPVo5v6poE1T9m3MxoA3on8RHkJ2I",
  "refreshToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEyMzQiLCJ1c2VybmFtZSI6ImJpcnNjaG5lcnNvZXZfaGVsbG9fc2VjdXJpdHkiLCJyb2xlIjoidXNlciJ9.cZL6FJ2EKzK4gSKpPVo5v6poE1T9m3MxoA3on8RHkJ2I",
  "expiersIn": 3600
}
