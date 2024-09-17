FROM python:3.12.5-bullseye

ENV PYTHONBUFFRED=1

WORKDIR /dj_test

COPY requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT [ "sh", "entrypoint.sh"]

COPY . .

