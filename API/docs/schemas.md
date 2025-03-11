# Схема ответа на запрос товаров поставщика (товары найдены)
  ```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "supplierId": {
      "type": "integer",
      "example": 25
    },
    "products": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "productId": {
            "type": "integer",
            "example": 101
          },
          "article": {
            "type": "string",
            "example": "1254521"
          },
          "description": {
            "type": "string",
            "example": "Товар_1"
          },
          "unit": {
            "type": "string",
            "example": "шт"
          },
          "category": {
            "type": "string",
            "example": "Манга"
          },
          "price": {
            "type": "string",
            "example": "15.00"
          },
          "stockQuantity": {
            "type": "integer",
            "example": 90
          }
        },
        "required": [
          "productId",
          "article",
          "description",
          "unit",
          "category",
          "price",
          "stockQuantity"
        ]
      }
    }
  },
  "required": ["supplierId", "products"]
}
  ```
# Схема ответа на запрос товаров поставщика (товары не найдены)
  ```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "supplierId": {
      "type": "integer",
      "example": 25
    },
    "products": {
      "type": "array",
      "items": {
        "type": "string"
      },
      "example": []
    },
    "message": {
      "type": "string",
      "default": "На данный момент ваших товаров нет на складе"
    }
  },
  "required": ["supplierId", "products", "message"]
}
  ```
# Схема запроса для создания поставки
```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "deliveryDate": {
      "type": "string",
      "format": "date",
      "example": "2025-03-25"
    },
    "totalSum": {
      "type": "string",
      "example": "5445.00"
    },
    "products": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "article": {
            "type": "string",
            "example": "1254521"
          },
          "price": {
            "type": "string",
            "example": "15.00"
          },
          "quantity": {
            "type": "integer",
            "example": 90
          }
        },
        "required": ["article", "price", "quantity"]
      }
    }
  },
  "required": ["deliveryDate", "totalSum", "products"]
}
```
# Схема запроса для редактирования поставки
```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "deliveryDate": {
      "type": "string",
      "format": "date",
      "example": "2025-03-25"
    },
    "totalSum": {
      "type": "string",
      "example": "5445.00"
    },
    "products": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "article": {
            "type": "string",
            "example": "1254521"
          },
          "price": {
            "type": "string",
            "example": "15.00"
          },
          "quantity": {
            "type": "integer",
            "example": 90
          }
        }
      }
    }
  },
  "required": ["totalSum", "products"]
}
```
# Схема ответа на успешное создание/редактирования поставки  
```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "supplierId": {
      "type": "integer",
      "example": 25
    },
    "orderId": {
      "type": "integer",
      "example": 25
    },
    "status": {
      "type": "string",
      "example": "Создано (отредактировано)"
    },
    "deliveryDate": {
      "type": "string",
      "format": "date",
      "example": "2025-03-25"
    },
    "totalSum": {
      "type": "string",
      "example": "5445.00"
    },
    "products": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "productId": {
            "type": "integer",
            "example": 101
          },
          "article": {
            "type": "string",
            "example": "1254521"
          },
          "price": {
            "type": "string",
            "example": "15.00"
          },
          "quantity": {
            "type": "integer",
            "example": 90
          }
        },
        "required": ["productId", "article", "price", "quantity"]
      }
    }
  },
  "required": ["supplierId", "orderId", "status", "deliveryDate", "totalSum", "products"]
}
```
# Схема ответа на успешное удаление поставки
```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "supplierId": {
      "type": "integer",
      "example": 25
    },
    "orderId": {
      "type": "integer",
      "example": 25
    },
    "status": {
      "type": "string",
      "example": "Удалено"
    }
  },
  "required": ["supplierId", "orderId", "status"]
}
  ```
# Схема товара (полная)
```
  {
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "productId": {
      "type": "integer",
      "example": 101
    },
    "article": {
      "type": "string",
      "example": "1254521"
    },
    "description": {
      "type": "string",
      "example": "Товар_1"
    },
    "unit": {
      "type": "string",
      "example": "шт"
    },
    "category": {
      "type": "string",
      "example": "Манга"
    },
    "price": {
      "type": "string",
      "example": "15.00"
    },
    "stockQuantity": {
      "type": "integer",
      "example": 90
    }
  },
  "required": ["productId", "article", "description", "unit", "category", "price", "stockQuantity"]
}  
```
# Схема ошибки 401 - Токен истек
```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "error": {
      "type": "string",
      "description": "Краткое описание ошибки",
      "example": "Unauthorized"
    },
    "message": {
      "type": "string",
      "description": "Сообщение для клиента",
      "example": "Токен неверный или истек"
    },
    "retryAfter": {
      "type": "integer",
      "description": "Кол-во секунд, на которое пользователю запрещено совершать запросы",
      "example": 60
    }
  },
  "required": ["error", "message"]
}
```
# Схема ошибки 429 - Лимит запросов превышен
```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "error": {
      "type": "string",
      "description": "Краткое описание ошибки",
      "example": "Too Many Requests"
    },
    "message": {
      "type": "string",
      "description": "Сообщение для клиента",
      "example": "Превышен лимит запросов. Попробуйте позже."
    },
    "retryAfter": {
      "type": "integer",
      "description": "Кол-во секунд, на которое пользователю запрещено совершать запросы",
      "example": 60
    }
  },
  "required": ["error", "message", "retryAfter"]
}
```
# Схема ошибки 500 - Ошибка сервера
```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "error": {
      "type": "string",
      "description": "Краткое описание ошибки",
      "example": "Internal Server Error"
    },
    "message": {
      "type": "string",
      "description": "Сообщение для клиента",
      "example": "Внутренняя ошибка сервера. Попробуйте позже."
    }
  },
  "required": ["error", "message"]
}
  ```
