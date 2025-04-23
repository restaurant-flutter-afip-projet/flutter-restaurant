from pydantic import BaseModel, conint

class Table(BaseModel):
    id: int
    capacity: conint(ge=1, le=99)

    class Config:
        orm_mode = True