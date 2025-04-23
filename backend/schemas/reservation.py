from pydantic import BaseModel, conint
from datetime import datetime


class Reservation(BaseModel):
    id : int
    userId : int
    tableId : int
    datetime: datetime
    peopleNbr: conint(ge=0,le=100)

    class Config:
        orm_mode = True
