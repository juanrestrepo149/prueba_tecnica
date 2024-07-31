FROM python:3.8-slim

COPY . /app

WORKDIR /app

CMD ["sh", "-c", "python app.py && tail -f /dev/null"]
