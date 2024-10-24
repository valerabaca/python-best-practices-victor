# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install curl
RUN apt-get update && apt-get install -y curl

# Install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add poetry to PATH
ENV PATH="/root/.local/bin:$PATH"

# Set the working directory in the container
WORKDIR /app

# Copy pyproject.toml and poetry.lock first
COPY pyproject.toml poetry.lock /app/

# Install dependencies
RUN poetry install --no-dev --no-interaction --no-ansi

# Copy the rest of the code
COPY . /app

# Expose the port
EXPOSE 5000

ENV FLASK_APP="lundpy/app.py"

# Run the application
CMD ["poetry", "run", "flask", "run", "--host=0.0.0.0", "--port=5001"]