FROM python:3.9.9
ENV PYTHONUNBUFFERED True

RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install --no-cache-dir -r  requirements.txt

ENV APP_HOME /root
WORKDIR $APP_HOME
COPY /app $APP_HOME/app
COPY /main.py $APP_HOME

ARG PORT
ENV PORT $PORT

EXPOSE $PORT/tcp

RUN echo "PORT: [$PORT]"
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]