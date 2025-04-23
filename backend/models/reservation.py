from fastapi import APIRouter
from app.schemas.reservation import ReservationCreate

router = APIRouter()

@router.post("/reservations")
def create_reservation(reservation: ReservationCreate):
    return {"message": "Reservation created", "reservation": reservation}
