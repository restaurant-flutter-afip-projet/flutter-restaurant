from sqlalchemy import Column, Integer, ForeignKey, DateTime
from backend.db.base import Base

class Reservation(Base):
    __tablename__ = "reservations"

    id = Column(Integer, primary_key=True, index=True)
    userId = Column(Integer, ForeignKey("users.id"), nullable=False)
    tableId = Column(Integer, ForeignKey("tables.id"), nullable=False)
    datetime = Column(DateTime, nullable=False)
    peopleNbr = Column(Integer, nullable=False)