# Use the Python image from Docker Hub as a starting point
FROM python:3.9

# Set the working directory in the Docker container
WORKDIR /calorie-calculator/calorie-calculator-python-code

# Copy the requirements and install them using pip
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your Django project files into the working directory
COPY calorie-calculator-python-code/ .

# Collect static files
RUN python manage.py collectstatic --no-input

# Tell Docker which port the app runs on
EXPOSE 8000

# Command to start the app
CMD ["gunicorn", "calorieCalc.wsgi:application", "--bind", "0.0.0.0:8000"]