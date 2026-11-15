from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker,declarative_base
from app.config import settings

engine = create_engine(settings.database_url)
SessionLocal = sessionmaker(bind=engine)

class Base(declarative_base()):
    pass

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
      