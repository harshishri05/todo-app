FROM python:3

WORKDIR /data

# Install necessary system packages including distutils
RUN apt-get update && apt-get install -y python3-distutils

# Install Django directly
RUN pip install --no-cache-dir django==3.2

# Copy the application code
COPY . .

# Run migrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
