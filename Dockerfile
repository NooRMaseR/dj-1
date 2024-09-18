FROM python:3.12.5-slim-bullseye

WORKDIR /dj_test

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

COPY requirements.txt .

RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y git-lfs
RUN git lfs install

COPY . .

EXPOSE 8000



