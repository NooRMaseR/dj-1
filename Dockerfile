FROM python:3.12.5-bullseye

ENV PYTHONBUFFRED=1

WORKDIR /dj_test

COPY . .

RUN pip install -r requirements.txt

CMD python manage.py runserver
