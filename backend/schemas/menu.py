from fastapi import APIRouter
from app.schemas.menu import Dish

router = APIRouter()

@router.get("/menu", response_model=list[Dish])
def get_menu():
    return [{"id": 1, "name": "Pizza Margherita", "price": 9.99}]
