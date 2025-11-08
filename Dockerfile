# ------- Build Stage -------#

FROM python:3.14-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# -------- Runtime Stage -----#

FROM python:3.14-slim

WORKDIR /app

ENV NAME=Developer

COPY --from=builder /install /usr/local

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
