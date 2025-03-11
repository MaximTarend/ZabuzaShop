# ZabuzaShop
Документация проекта интернет-магазина zabuza.com
# Цель проекта
Цель представляет собой создание веб-сайта для интернет-магазина, который предлагает широкий ассортимент товаров, включая бакалею, молочные и мясные продукты. Сайт будет оформлен в соответствии с цветами бренд-бука, что обеспечит единое оформление и узнаваемость бренда. Основные функции включают удобный каталог товаров, возможность формирования корзины, систему отзывов, а также интеграцию дисконтной карты и гибкие варианты доставки.
# Поддержка 
При возникновении вопросов по проекту и его документации просим обращаться по адресу [dedmasim@gmail.com](dedmasim@gmail.com)
# Требования к системе
* [Функциональные требования](https://github.com/MaximTarend/ZabuzaShop/blob/main/Requirements/FR.md)
* [Нефункциональные требования](https://github.com/MaximTarend/ZabuzaShop/blob/main/Requirements/NFR.md)
# Архитектура проекта
**Выбранная архитектура**: Микросервисы <br>
**Аргументы**:
* Разделение бизнес процессов: Возможность разместить разные бизнес процессы в независимые компоненты системы позволяет эффективно управлять этими процессами и поддерживать систему 
* Масштабируемость: Возможность масштабировать отдельные компоненты системы независимо. Например, если нагрузка на какой-то из сервисов возрастет (на каталог товаров при распродаже), то можно увеличить ресурсы только для этого сервиса, не затрагивая другие части системы. 
* Гибкость технологий: Разные компоненты системы можно реализовать на подходящих им технологиях (магазин, склад, форум, новостной блог).
* Независимость разработки: Отдельные микросервисы можно разрабатывать, тестировать и развертывать независимо друг от друга. Добавление новых микросервисов в систему при расширении бизнеса будет менее проблематичным процессом.
* Отказоустойчивость: Если один из микросервисов выйдет из строя, это не приведет к полному отказу системы. Например, если сервис корзины временно недоступен, пользователи все еще могут просматривать товары.
### Архитектура описана в нотации С4:
* СONTEXT LEVEL
  ![context](https://github.com/MaximTarend/ZabuzaShop/blob/main/System%20Architecture/C4_CONTEXT.png)
* CONTAINER LEVEL
  ![container](https://github.com/MaximTarend/ZabuzaShop/blob/main/System%20Architecture/C4_CONTAINER.png)
# API
* Документация API для поставщиков находится в папке проекта [API](https://github.com/MaximTarend/ZabuzaShop/tree/main/API)
* Документация API для поставщиков в [Swagger](https://app.swaggerhub.com/apis/DEDMASIM/ZabuzaAPI/1.0.0)
# Kafka
Техническое задание на создание топиков в Kafka для интеграции микросервисов системы находится в папке проекта [Kafka](https://github.com/MaximTarend/ZabuzaShop/tree/main/Kafka)
# База данных
* Диагармма для товаров
  ![products](https://github.com/MaximTarend/ZabuzaShop/blob/main/DB/PRODUCTS_SERVICE.png)
* Диаграмма для пользователей
  ![users](https://github.com/MaximTarend/ZabuzaShop/blob/main/DB/USER_SERVICE.png)
* Документация по базе данных находится в папке проекта [DB](https://github.com/MaximTarend/ZabuzaShop/tree/main/DB)
