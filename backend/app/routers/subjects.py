from fastapi import APIRouter

router = APIRouter(prefix="/subjects", tags=["subjects"])


@router.get("/")
def list_subjects():
    return [{"id": 1, "name": "Java"}]