FROM python:3.7

RUN git clone https://github.com/z0sun/Deployment7.git

WORKDIR Deployment7
RUN pip install -r requirements.txt

RUN pip install mysqlclient

RUN pip install gunicorn

RUN python database.py

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0", "app:app"]
