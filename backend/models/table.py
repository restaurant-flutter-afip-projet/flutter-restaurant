from sqlalchemy import Column, Integer
from backend.db.base import Base

class Table(Base):
    __tablename__ = "tables"

    id = Column(Integer, primary_key=True, index=True)
    capacity = Column(Integer, nullable=False)