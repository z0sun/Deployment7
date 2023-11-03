FROM python:3.7

EXPOSE 8000

RUN git clone https://github.com/djtoler/Deployment7.git

WORKDIR Deployment7
RUN pip install -r requirements.txt

RUN pip install mysqlclient
RUN apt-get update && apt-get install -y default-libmysqlclient-dev

RUN pip install gunicorn

RUN python database.py

RUN python load_data.py



CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
