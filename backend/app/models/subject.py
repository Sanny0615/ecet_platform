from typing import TYPE_CHECKING

from app.db import Base
from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

if TYPE_CHECKING:
    from app.models.topic import Topic


class Subject(Base):
    __tablename__ = "subjects"

    id: Mapped[int] = mapped_column(primary_key=True)

    name: Mapped[str] = mapped_column(
        String(100),
        unique=True,
        nullable=False
    )

    total_marks: Mapped[int] = mapped_column(nullable=False)

    topics: Mapped[list["Topic"]] = relationship(
        back_populates="subject"
    )
