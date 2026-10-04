FROM python:3.11-slim
WORKDIR /app
RUN pip install --no-cache-dir fastapi uvicorn pydantic
COPY . .
CMD ["sh", "-c", "if [ -f main.py ]; then uvicorn main:app --host 0.0.0.0 --port ${PORT:-10000}; else find . -name 'main.py' -execdir uvicorn main:app --host 0.0.0.0 --port ${PORT:-10000} \\;; fi"]
