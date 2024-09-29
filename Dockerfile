# Use the appropriate Python base image
FROM python:3.12-slim

# Install setuptools to get distutils
RUN pip install --upgrade pip setuptools

# Install Django and other dependencies
RUN pip install django==3.2

# Copy project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the application's port
EXPOSE 8000
