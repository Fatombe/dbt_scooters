# dbt_scooters

## Описание проекта

`dbt_scooters` — это проект, предназначенный для моделирования и трансформации данных, связанных с использованием электрических самокатов. Проект использует dbt (Data Build Tool) для управления процессами ETL, улучшения качества данных и построения аналитических моделей.

## Установка

1. Убедитесь, что Python и dbt установлены на вашем компьютере.
2. Клонируйте репозиторий проекта:
   ```bash
   git clone https://github.com/Fatombe/dbt_scooters.git
   Перейдите в директорию проекта:
   cd dbt_scooters
   Установите зависимости dbt:
   dbt deps
   Основные команды dbt
   Вот некоторые основные команды dbt, которые помогут вам работать с проектом:
   ```

dbt run: Выполняет все модели в проекте.
dbt test: Запускает тесты для проверки качества данных.
dbt compile: Компилирует SQL-файлы без выполнения.
dbt docs generate: Генерирует документацию для моделей.
dbt docs serve: Запускает локальный сервер для просмотра документации.
dbt debug: Проверяет конфигурацию и подключение к базе данных.
Дополнительная информация
Для более подробной информации и документации посетите официальный сайт dbt.

4. Активируйте PostGIS в базе PostgreSQL, если еще этого не делали:

```sql
create extension postgis schema public;
```



```bash
# Установка Python
python --version # проверка версии python
pip --version # проверка версии pip
py -m pip install --upgrade pip # обновление pip
# Создание папки
py -m venv .venv # создание виртуального окружения в папке
.venv\Scripts\activate # активация виртуального окружения
# Установка dbt
pip install dbt-core dbt-postgres # установка dbt-core и адаптера для базы данных PostgreSQL
dbt --version # проверка версии dbt
dbt init dbt_scooters # создание новой папки с проектом dbt (указывается данные базы) и файла profiles.yml
# Переходим в папку проекта
cd dbt_scooters
dbt debug # запуск команды отладки
```

```bash
# Файл profiles.yml (C:\Users\user\.dbt\profiles.yml)
dbt_scooters:
  outputs:
    dev:
      dbname: dbt_scooters
      host: localhost
      pass: postgres
      port: 5432
      schema: dbt
      threads: 1
      type: postgres
      user: postgres
  target: dev
```

```bash
# GIT
git config --global user.name "Alex Be" # указать имя
git config --global user.email "belrev@yahoo.com" # указать почту
git -v # проверка что git установлен и версии
git init # создание локального репозитория в папке проекта
git add . # добавление всех файлов проекта в индекс (staging area)
git status # проверка статуса репозитория
git commit -m "Initial project" # добавление файлов в репозиторий

git remote add origin https://github.com/Fatombe/dbt_scooters.git # привязка локального репозитория к серверу
git branch -M main # создание ветки "main"
git push -u origin main # отправка локального репозитория на сервер
git push # отправка локального репозитория на сервер в ту же ветку
```

```bash
# Работа с dbt
dbt debug # проверка подключения к базе данных и отображения информации для целей отладки, такой как достоверность вашего файла проекта, версия dbt и ваша установка любых необходимых зависимостей
dbt parse # проверка правильности всех файлов проекта
dbt compile # компилирование шаблонизированных моделей в полноценные SQL-скрипты
dbt run # запуск материализации моделей в базе, ТЕСТЫ ИГНОРИРУЮТСЯ!!!!!

dbt build # запуск материализации моделей в базе, С ТЕСТАМИ!!!!
dbt build -s config.materialized:incremental # обновление инкрементальных моделей

dbt ls #просмотр всех моделей и источников

dbt show -s trips_prep --output json # просмотр таблицы в терминале
dbt show --inline "select current_setting('TIMEZONE')" # вывод в терминал информации о текущей зоне времени



--full-refresh # флаг полного обновления, сокращенно -f
--select # выбор модели, сокращенно -s
--log-level # логирование процессов, доступные опции для уровней журнала являются debug, info, warn, error или none.
--debug # логирование процессов, сокращенно -d
--vars #  передача модели строки с переменными в виде YAML-словаря
```
