FROM python:3.12.5-bullseye

ENV PYTHONBUFFRED=1

WORKDIR /dj_test

COPY requirements.txt .

RUN pip install -r requirements.txt


COPY . .

ENTRYPOINT ["sh", "entrypoint.sh"]

EXPOSE 8000

CMD ["gunicorn", "dj_test.wsgi:application", "--bind", "0.0.0.0:8000"]
