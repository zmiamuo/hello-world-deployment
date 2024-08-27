FROM python:3.8-slim-buster

RUN mkdir /python-app

WORKDIR /python-app

COPY ./hello-world-app .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl --fail http://localhost:5000/ || exit 1

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
