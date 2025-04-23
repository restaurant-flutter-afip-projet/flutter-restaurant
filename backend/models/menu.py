from sqlalchemy import Column, Integer, String, Float, ForeignKey
from backend.db.base import Base

class Dish(Base):
    __tablename__ = "dishes"

    id = Column(Integer, primary_key=True, index=True)
    userId = Column(Integer, ForeignKey("users.id"), nullable=False)
    price = Column(Float(1000.0), nullable=False)
    img_url = Column(String(300), nullable=False)