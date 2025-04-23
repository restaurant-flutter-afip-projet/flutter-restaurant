from fastapi import FastAPI
from api.endpoints import menu, reservation

app = FastAPI(title="Restaurant API")

app.include_router(menu.router, prefix="/api/", tags=["Menu"])
app.include_router(reservation.router, prefix="/api/", tags=["Reservations"])
