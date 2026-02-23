class Vehicle
{

  var typeofVehicle;
  var fuelType;
  var maxSpeed;

  Details(){
  }

}

class Bike extends Vehicle
{
  Details(){
    typeofVehicle='Two Wheeler';
    fuelType='Petrol';
    maxSpeed=100;
  }
  display(){
    print("Bike : $typeofVehicle  $fuelType  $maxSpeed");
  }
}


class Car extends Vehicle
{
  Details(){
    typeofVehicle='Four Wheeler';
    fuelType='Petrol or Diesel or CNG';
    maxSpeed=200;
  }
  display(){
    print("Car : $typeofVehicle  $fuelType  $maxSpeed");
  }
}

void main(){

  Bike b=Bike();
  b.Details();
  b.display();
  Car c=Car();
  c.Details();
  c.display();

}