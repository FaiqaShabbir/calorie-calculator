FROM python:3.9
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN python manage.py collectstatic --no-input
EXPOSE 8000
CMD gunicorn calorie_calculator.wsgi:application --bind 0.0.0.0:8000