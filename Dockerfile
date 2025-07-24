# Simpler and secure Dockerfile for Flask app
FROM python:3.11-slim

# Set environment variables
# Prevent Python from writing .pyc files and enable real-time stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1 \ 
    PYTHONUNBUFFERED=1

# Create non-root user
RUN useradd -m appuser

# Set working directory
WORKDIR /app

# Copy requirements and install with pip
COPY ./app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY ./app/ .

# Change ownership and drop privileges
RUN chown -R appuser:appuser /app
USER appuser

# Expose port and run app
EXPOSE 5000
CMD ["python", "app.py"]
