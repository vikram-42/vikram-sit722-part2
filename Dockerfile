# Use an official Python runtime as the base image.
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /book_catalog

# Copy the requirements file into the container at /book_catalog
COPY book_catalog/requirements.txt /book_catalog/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the contents of the book_catalog directory to /book_catalog within the container.
COPY book_catalog /book_catalog

# Expose port 8000 to external access outside of this container.
EXPOSE 8000

# Set an environment variable for the database URL.
ENV DATABASE_URL="postgresql://library_db_ukuu_user:JK1UYU4Tyhlqd8A0swc5T8iatJXsfvX5@dpg-cr836vjqf0us73boeeg0-a.oregon-postgres.render.com/library_db_ukuu"

# Start the FastAPI server with Uvicorn.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

