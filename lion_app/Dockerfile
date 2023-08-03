FROM python:3.11

# install requirements
COPY ./requirements.txt ./

RUN pip install -r requirements.txt

# run server
COPY . ./

CMD [ "gunicorn", "lion_app.wsgi:application","--config", "lion_app/gunicorn_config.py" ]