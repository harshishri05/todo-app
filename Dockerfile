FROM python:3.12-slim

# Install necessary system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-distutils \
    gcc \
    libffi-dev \
    libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data

# Install Django directly
RUN pip install --no-cache-dir django==3.2

# Copy the application code
COPY . .

# Run migrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
