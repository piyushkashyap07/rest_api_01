FROM python:3.9

# Copy only the requirements file first to leverage Docker cache
COPY requirements.txt /app/requirements.txt

WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
