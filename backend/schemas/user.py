from pydantic import BaseModel, constr

class User(BaseModel):
    id : int
    firstname: constr(strip_whitespace=True, min_length=1,max_length=50)
    lastname: constr(strip_whitespace=True, min_length=1,max_length=50, to_upper=True)
    email : constr(strip_whitespace=True, min_length=1, max_length=100)
    password: constr(min_length=1, max_length=500)
    role: constr(min_length=1,max_length=30)

    class Config:
        orm_mode = True