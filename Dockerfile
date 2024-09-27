FROM python:3

WORKDIR /data

# Install necessary system packages and python3-distutils
RUN apt-get update && apt-get install -y python3-distutils

# Install Django directly
RUN pip install --no-cache-dir django==3.2

# Copy the application code
COPY . .

# Ensure Django is installed and run migrations
RUN python -m pip install --no-cache-dir django==3.2 && python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
