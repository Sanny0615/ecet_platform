from fastapi import FastAPI
from app.routers import subjects

app = FastAPI(title="ECET Platform")

app.include_router(subjects.router)


@app.get("/health")
def health():
    return {"status": "ok"}