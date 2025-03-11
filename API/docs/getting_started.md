# Установка и настройка API
## Как подключиться к API
Для подключения к API вы можете использовать инструменты, такие как [Postman](https://www.postman.com/) или `curl`
### Требования для работы с API:
* Токен аутентификации (JWT) требуется для защищённых запросов.
* Доступ к базовым URL серверам API.
### Base URL
`https://virtserver.swaggerhub.com/DEDMASIM/ZabuzaAPI/1.0.0`
## Пример запроса (curl)
```
curl -X POST "https://virtserver.swaggerhub.com/DEDMASIM/ZabuzaAPI/1.0.0/auth/login" \
-H "Content-Type: application/json" \
-d '{
  "username": "example@example.com",
  "password": "password"
}'
```
