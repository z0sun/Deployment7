FROM python:3.7

RUN git clone https://github.com/kura-labs-org/c4_deployment-5.git

WORKDIR c4_deployment-5

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python database.py

RUN python load_data.py

EXPOSE 8000

ENTRYPOINT python -m gunicorn app:app -b 0.0.0.0
