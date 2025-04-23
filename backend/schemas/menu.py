from pydantic import BaseModel, constr,confloat

class Dish(BaseModel):
    id: int
    name: constr(min_length=1, max_length=100)
    description: constr(min_length=1, max_length=300)
    price: confloat(ge=0.0,le=1000.0)
    img_url: constr(min_length=1, max_length=300)

    class Config:
        orm_mode = True


