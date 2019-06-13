class Person {
  String name;
  int age;


  Person(this.name, this.age);


  void addPerson() {
    print(" Person : name = $name , age = $age");
  }


  void setPersonAge(int age){
    this.age = age;
  }
}