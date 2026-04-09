FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY app /app/app
COPY tests /app/tests

# The repo carries deepiri-modelkit vendored under app/deepiri-modelkit.
ENV PYTHONPATH=/app/app/deepiri-modelkit:/app/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8002"]

