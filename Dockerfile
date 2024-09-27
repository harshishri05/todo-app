FROM python:3

WORKDIR /data

RUN apt-get update && apt-get install -y python3-distutils python3-pip

COPY . .

RUN pip install --no-cache-dir django==3.2

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
