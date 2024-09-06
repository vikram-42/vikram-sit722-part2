FROM python:3.9-slim

WORKDIR /book_catalog

COPY book_catalog/requirements.txt /book_catalog/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY book_catalog /book_catalog

EXPOSE 8000

ENV DATABASE_URL="postgresql://library_db_ukuu_user:JK1UYU4Tyhlqd8A0swc5T8iatJXsfvX5@dpg-cr836vjqf0us73boeeg0-a.oregon-postgres.render.com/library_db_ukuu"

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

