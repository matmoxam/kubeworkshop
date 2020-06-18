FROM python:3
EXPOSE 8000
ENV PYTHONUNBUFFERED 1
ENV isContainer True
ENV DJANGO_SUPERUSER_USERNAME admin
ENV DJANGO_SUPERUSER_PASSWORD admin
RUN mkdir /app
WORKDIR /app
RUN pip install django psycopg2
RUN django-admin startproject django_kube /app
RUN sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['*'\]/" /app/django_kube/settings.py
RUN sed -i "s/db.sqlite3/db\/db.sqlite3/" /app/django_kube/settings.py
RUN mkdir /app/db
RUN python manage.py migrate
RUN python manage.py createsuperuser --noinput --email "admin@admin.com"
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
