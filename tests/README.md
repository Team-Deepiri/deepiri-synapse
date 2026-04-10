Overview
--------
Build and run Synapse tests from this repository root.

Local run (no Docker)
---------------------

```bash
PYTHONPATH=./app/deepiri-modelkit:./app python tests/test_event_models.py
```

Build the image
---------------

```bash
docker build -t deepiri-synapse:dev .
```

Run the test file in Docker
---------------------------

```bash
docker run --rm deepiri-synapse:dev bash -lc \
  "PYTHONPATH=/app/app/deepiri-modelkit:/app/app python /app/tests/test_event_models.py"
```

Interactive shell (optional)
----------------------------

```bash
docker run --rm -it deepiri-synapse:dev bash
```

Quick troubleshooting
---------------------

- Import errors (`ModuleNotFoundError`): verify `PYTHONPATH` includes `app/deepiri-modelkit` and `app`.
- Missing packages: run `pip install -r requirements.txt`.
