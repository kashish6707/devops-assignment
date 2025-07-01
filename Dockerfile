# Use an official Python runtime as a parent image
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential

# Copy requirements and install
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app source
COPY src/ .

# Expose FastAPI default port
EXPOSE 80

# Run FastAPI using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]