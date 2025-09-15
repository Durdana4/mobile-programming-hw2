// Mobile Programming Lab4
enum DaysOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

enum OrderStatus { pending, processing, shipped, delivered, cancelled }

enum TrafficLight { red, yellow, green }

enum UserRole { admin, editor, guest }


// 1.1 Car Class
class Car {
  String make;
  String model;
  int year;

  Car(this.make, this.model, this.year);

  void displayInfo() {
    print('Car Information: $year $make $model');
  }
}

// 1.2 Book Class
class Book {
  String title;
  String author;
  int numberOfPages;

  Book(this.title, this.author, this.numberOfPages);
}

// 1.3 Student Class
class Student {
  String name;
  int age;
  List<double> grades;

  Student(this.name, this.age, this.grades);

  double calculateAverageGrade() {
    if (grades.isEmpty) return 0.0;
    double sum = 0;
    for (var grade in grades) {
      sum += grade;
    }
    return sum / grades.length;
  }
}

// 1.4 Bank Account Class
class BankAccount {
  String accountNumber;
  String accountHolderName;
  double balance;

  BankAccount(this.accountNumber, this.accountHolderName, [this.balance = 0.0]);

  void deposit(double amount) {
    if (amount <= 0) {
      print('Error: Deposit amount must be positive');
      return;
    }
    balance += amount;
    print(
      'Deposited: \$${amount.toStringAsFixed(2)}. New balance: \$${balance.toStringAsFixed(2)}',
    );
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Error: Withdrawal amount must be positive');
      return;
    }
    if (amount > balance) {
      print(
        'Error: Insufficient funds. Cannot withdraw \$${amount.toStringAsFixed(2)}',
      );
      return;
    }
    balance -= amount;
    print(
      'Withdrew: \$${amount.toStringAsFixed(2)}. New balance: \$${balance.toStringAsFixed(2)}',
    );
  }
}

// 1.5 Rectangle Class
class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double get area => width * height;
  double get perimeter => 2 * (width + height);
}

// 2.4 User Class with Enum
class User {
  String name;
  UserRole role;

  User(this.name, this.role);

  bool hasEditPermission() {
    return role == UserRole.admin || role == UserRole.editor;
  }
}

// 2.5 TrafficLight Extension
extension TrafficLightExtension on TrafficLight {
  int get durationInSeconds {
    switch (this) {
      case TrafficLight.red:
        return 30;
      case TrafficLight.yellow:
        return 5;
      case TrafficLight.green:
        return 45;
    }
  }
}

// --- INHERITANCE CLASSES ---
// 3.1 Vehicle Hierarchy
class Vehicle {
  String make;
  String model;

  Vehicle(this.make, this.model);

  void display() {
    print('Vehicle: $make $model');
  }
}

class CarInherited extends Vehicle {
  int numberOfDoors;

  CarInherited(String make, String model, this.numberOfDoors)
    : super(make, model);

  @override
  void display() {
    super.display();
    print('Doors: $numberOfDoors');
  }
}

// 3.2 Animal Sounds
class Animal {
  void makeSound() {
    print('Some sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Woof!');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Meow!');
  }
}

// 3.3 Shape Hierarchy
class Shape {
  String color;

  Shape(this.color);
}

class Circle extends Shape {
  double radius;

  Circle(String color, this.radius) : super(color);
}

class Square extends Shape {
  double sideLength;

  Square(String color, this.sideLength) : super(color);
}

// 3.4 Employee and Manager
class Employee {
  String name;
  double baseSalary;

  Employee(this.name, this.baseSalary);

  double calculateSalary() {
    return baseSalary;
  }
}

class Manager extends Employee {
  double bonus;

  Manager(String name, double baseSalary, this.bonus) : super(name, baseSalary);

  @override
  double calculateSalary() {
    return baseSalary + bonus;
  }
}

// 3.5 Library Items
class LibraryItem {
  String title;
  String id;

  LibraryItem(this.title, this.id);

  String getDetails() {
    return 'Title: $title, ID: $id';
  }
}

class BookItem extends LibraryItem {
  String author;

  BookItem(String title, String id, this.author) : super(title, id);

  @override
  String getDetails() {
    return '${super.getDetails()}, Author: $author';
  }
}

class DVD extends LibraryItem {
  String director;

  DVD(String title, String id, this.director) : super(title, id);

  @override
  String getDetails() {
    return '${super.getDetails()}, Director: $director';
  }
}

// --- MIXINS ---
// 4.1 Swimmer Mixin
mixin Swimmer {
  void swim() {
    print('Moving through the water...');
  }
}

class Human with Swimmer {
  String name;
  Human(this.name);
}

class Fish with Swimmer {
  String species;
  Fish(this.species);
}

// 4.2 Flyer Mixin
mixin Flyer {
  void fly() {
    print('Taking off!');
  }
}

class Bird with Flyer {
  String name;
  Bird(this.name);
}

class Plane with Flyer {
  String model;
  Plane(this.model);
}

// 4.3 Logger Mixin
mixin Logger {
  void log(String message) {
    print('[LOG] $message');
  }
}

class DataService with Logger {
  void fetchData() {
    log('Fetching data...');
  }
}

// 4.4 Validator Mixin
mixin Validator {
  bool isEmailValid(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool isPasswordStrong(String password) {
    return password.length >= 8;
  }
}

class UserSignup with Validator {
  void validateInput(String email, String password) {
    print('Email valid: ${isEmailValid(email)}');
    print('Password strong: ${isPasswordStrong(password)}');
  }
}

// 4.5 Combining Mixins
mixin Performer {
  void perform() {
    print('Performing...');
  }
}

mixin Musician {
  void playInstrument() {
    print('Playing instrument...');
  }
}

class Artist {
  String name;
  Artist(this.name);
}

class Dancer extends Artist with Performer {
  Dancer(String name) : super(name);
}

class Guitarist extends Artist with Performer, Musician {
  Guitarist(String name) : super(name);
}

// --- POLYMORPHISM CLASSES ---
// 5.1 Shape Area Calculation
abstract class ShapePoly {
  double area();
}

class CirclePoly extends ShapePoly {
  double radius;
  CirclePoly(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}

class RectanglePoly extends ShapePoly {
  double width;
  double height;
  RectanglePoly(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

// 5.2 Weapon Actions
class Weapon {
  void action() {
    print('Using weapon');
  }
}

class Sword extends Weapon {
  @override
  void action() {
    print('Swinging!');
  }
}

class Bow extends Weapon {
  @override
  void action() {
    print('Firing!');
  }
}

// 5.3 Animal Feeder
class AnimalPoly {
  void eat() {
    print('Eating food');
  }
}

class Lion extends AnimalPoly {
  @override
  void eat() {
    print('Eating meat.');
  }
}

class Goat extends AnimalPoly {
  @override
  void eat() {
    print('Eating grass.');
  }
}

// 5.4 Payment Processing
abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCard extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paying \$${amount.toStringAsFixed(2)} with Credit Card');
  }
}

class PayPal extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paying \$${amount.toStringAsFixed(2)} with PayPal');
  }
}

// 5.5 Data Formatting System
abstract class DataFormatter {
  String format(Map<String, dynamic> data);
}

class JSONFormatter extends DataFormatter {
  @override
  String format(Map<String, dynamic> data) {
    return '{${data.entries.map((e) => '"${e.key}":"${e.value}"').join(', ')}}';
  }
}

class KeyValueFormatter extends DataFormatter {
  @override
  String format(Map<String, dynamic> data) {
    return data.entries.map((e) => '${e.key}: ${e.value}').join('\n');
  }
}

// --- HELPER FUNCTIONS ---
void checkDay(DaysOfWeek day) {
  switch (day) {
    case DaysOfWeek.saturday:
    case DaysOfWeek.sunday:
      print('$day is on the weekend!');
      break;
    default:
      print('$day is a weekday.');
  }
}

String getTrafficAction(TrafficLight light) {
  switch (light) {
    case TrafficLight.red:
      return "Stop";
    case TrafficLight.yellow:
      return "Caution";
    case TrafficLight.green:
      return "Go";
  }
}

void feed(AnimalPoly animal) {
  animal.eat();
}

void processPayment(PaymentMethod method, double amount) {
  method.pay(amount);
}

void main() {
  var myCar = Car('Toyota', 'Corolla', 2022);
  myCar.displayInfo();
  print('');

  var book = Book('Miracle Morning', 'Hal Elrod', 240);
  print('Book: ${book.title} by ${book.author}, ${book.numberOfPages} pages');
  print('');

  var student = Student('Alice', 20, [85.5, 92.0, 78.5, 88.0]);
  print(
    'Student: ${student.name}, Average Grade: ${student.calculateAverageGrade().toStringAsFixed(2)}',
  );
  print('');

  var account = BankAccount('123456789', 'John Doe', 1000.0);
  account.deposit(500.0);
  account.withdraw(200.0);
  account.withdraw(2000.0);
  print('');

  var rectangle = Rectangle(5.0, 3.0);
  print('Area: ${rectangle.area}, Perimeter: ${rectangle.perimeter}');
  print('');

  OrderStatus order = OrderStatus.processing;
  print('Order status: $order');
  print('');

  print('Red: ${getTrafficAction(TrafficLight.red)}');
  print('Yellow: ${getTrafficAction(TrafficLight.yellow)}');
  print('Green: ${getTrafficAction(TrafficLight.green)}');
  print('');

  var adminUser = User('Admin', UserRole.admin);
  var guestUser = User('Guest', UserRole.guest);
  print('Admin can edit: ${adminUser.hasEditPermission()}');
  print('Guest can edit: ${guestUser.hasEditPermission()}');
  print('');

  for (var light in TrafficLight.values) {
    print(
      '${light.toString().split('.').last}: ${light.durationInSeconds} seconds',
    );
  }
  print('');

  Dog().makeSound();
  Cat().makeSound();
  print('');

  var manager = Manager('Alice', 50000, 10000);
  print('Manager salary: \$${manager.calculateSalary()}');
  print('');

  Bird('Eagle').fly();
  Plane('Boeing 747').fly();
  print('');

  Sword().action();
  Bow().action();
  print('');

  feed(Lion());
  feed(Goat());
  print('');
}
