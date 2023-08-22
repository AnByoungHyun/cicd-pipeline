FROM python:3.9

COPY src/* /root/
WORKDIR /root
RUN pip install -r requorements.txt
ENV FLASK_APP=run.py
ENV FLASK_ENV=development
ENTRYPOINT ['flask run', '--host', '0.0.0.0']
