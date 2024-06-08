# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /usr/src/app

# Install any needed packages specified in requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Set environment variable to tell django not to run in production mode
ENV DJANGO_ENV=development

# Expose the port Django runs on
EXPOSE 8000

# Run django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
