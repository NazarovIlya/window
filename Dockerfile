FROM python:3.10

WORKDIR /api

COPY ./requirements.txt /api/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /api/requirements.txt

COPY ./ /api/

EXPOSE 8000

CMD ["uvicorn", "--reload", "--host", "0.0.0.0", "--port", "8000", "app.main:app"]

# FROM python:3.10

# ENV PYTHONUNBUFFERED=1
# ENV PYTHONDONTWRITEBYTECODE=1

# # Устанавливаем обновления и необходимые модули
# RUN apk update && apk add libpq
# RUN apk add --virtual .build-deps gcc python3-dev musl-dev postgresql-dev

# # Обновление pip python
# RUN pip install --upgrade pip && pip install wheel

# # Установка пакетов для проекта
# COPY requirements.txt ./requirements.txt
# RUN pip install -r requirements.txt

# WORKDIR /app

# # Удаляем зависимости билда
# #RUN apk del .build-deps

# # Копирование проекта
# COPY . .

# # Настройка записи и доступа
# RUN chmod -R 777 ./