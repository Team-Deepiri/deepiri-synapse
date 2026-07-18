FROM python:3.11-slim

WORKDIR /app

# Bedd runtime (Bun-style) — glibc binary
ARG BEDD_IMAGE=ghcr.io/team-deepiri/bedd:0.6
COPY --from=${BEDD_IMAGE} /usr/local/bin/bedd /usr/local/bin/bedd
COPY --from=${BEDD_IMAGE} /opt/bedd/skills /opt/bedd/skills
ENV BEDD_SKILLS_DIR=/opt/bedd/skills


COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY app /app/app
COPY tests /app/tests

# The repo carries deepiri-modelkit vendored under app/deepiri-modelkit.
ENV PYTHONPATH=/app/app/deepiri-modelkit:/app/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8002"]

