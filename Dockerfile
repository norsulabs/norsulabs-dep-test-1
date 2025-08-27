FROM python:3.12-slim

COPY . /app

WORKDIR /app

RUN pip install uv

RUN uv sync

EXPOSE 8501

CMD ["uv", "run", "streamlit", "run", "main.py"]
