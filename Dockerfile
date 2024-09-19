FROM python:3.12.5-slim-bullseye

WORKDIR /dj_test

RUN python3 -m venv venv
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

COPY requirements.txt .

RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y git-lfs
RUN git lfs install


COPY . .

ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV PORT=8000
 
EXPOSE ${PORT}

CMD gunicorn --bind :${PORT} --workers 2 dj_test.wsgi:application

