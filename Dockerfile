FROM python:3.9

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./main.py /code/app/main.py
RUN --mount=type=secret,id=TEST,required=true cat /run/secrets/TEST > /test

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]