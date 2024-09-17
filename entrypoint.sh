#!/bin/sh

python manage.py makemigrations --no-input
python manage.py migrate --no-input
python manage.py collectstatic --no-input

gunicorn dj_test.wsgi:application --bind 0.0.0.0:5000