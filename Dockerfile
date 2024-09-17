FROM python:3.12.5-bullseye

ENV PYTHONBUFFRED=1

WORKDIR /dj_test

COPY requirements.txt .

RUN pip install -r requirements.txt

# ENTRYPOINT ["sh", "entrypoint.sh"]

COPY . .

CMD ["gunicorn", "dj_test.wsgi:application", "--bind", "0.0.0.0:8000"]

EXPOSE 8000