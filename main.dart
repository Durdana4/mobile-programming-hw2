class Car { 
  String make; 
  String model; 
  int year;
  // Constructor
  Car(this.make , this.model , this.year);
  // Method to display car information
  void displayInfo () {
    print("Car Information: $year $make $model"); 
  }
}

class Book {
  String title;
  String author;
  int numberOfPages;
  //Constructor
  Book(this.title , this.author , this.numberOfPages);
  void displayInfo () {
    print("Book Information: $title $author $numberOfPages"); 
  }
}

class Student {
  String name;
  int age;
  List <double> grades;
  //constructor
  Student(this.name , this.age , this.grades);
  // Method to calculate average grade
  double calculateAverageGrade() {
    if (grades.isEmpty) {
      return 0.0; // Return 0 if no grades
    }
    
    double sum = 0;
    for (var grade in grades) {
      sum += grade;
    }
    return sum / grades.length;
  }  
}

class BankAccount {
  String accountNumber;
  String accountHolderName;
  double balance;
  
  // Constructor
  BankAccount(this.accountNumber, this.accountHolderName, [this.balance = 0.0]);
  
  // Deposit method
  void deposit(double amount) {
    if (amount <= 0) {
      print('Error: Deposit amount must be positive');
      return;
    }
    balance += amount;
    print('Deposited: \$${amount.toStringAsFixed(2)}');
    print('New Balance: \$${balance.toStringAsFixed(2)}');
  }
  
  // Withdraw method
  void withdraw(double amount) {
    if (amount <= 0) {
      print('Error: Withdrawal amount must be positive');
      return;
    }
    
    if (amount > balance) {
      print('Error: Insufficient funds. Cannot withdraw \$${amount.toStringAsFixed(2)}');
      print('Current Balance: \$${balance.toStringAsFixed(2)}');
      return;
    }
    
    balance -= amount;
    print('Withdrew: \$${amount.toStringAsFixed(2)}');
    print('New Balance: \$${balance.toStringAsFixed(2)}');
  }
  
  // Display account info
  void displayInfo() {
    print('\n=== Account Information ===');
    print('Account Number: $accountNumber');
    print('Account Holder: $accountHolderName');
    print('Current Balance: \$${balance.toStringAsFixed(2)}');
    print('===========================\n');
  }
}

class Rectangle {
  double width;
  double height;
  
  // Constructor
  Rectangle(this.width, this.height);
  
  // Area getter (calculated property)
  double get area => width * height;
  
  // Perimeter getter (calculated property)
  double get perimeter => 2 * (width + height);
  
  // Optional: Method to display rectangle info
  void displayInfo() {
    print('Rectangle: ${width.toStringAsFixed(2)} x ${height.toStringAsFixed(2)}');
    print('Area: ${area.toStringAsFixed(2)}');
    print('Perimeter: ${perimeter.toStringAsFixed(2)}');
  }
}

void main () {
  // Create an instance of the Car class
  var myCar = Car("Toyota", "Corolla", 2022);
  // Call the method to display its info on the console
  myCar.displayInfo(); 
  
  //create an instance of the Book class
  var myBook = Book("Miraacle Morning", "Hal Elrod", 240);
  myBook.displayInfo();
  
  // Create a student with some grades
  var student = Student('John Doe', 20, [85.5, 92.0, 78.5, 88.0, 95.5]);
  
  // Calculate and print the average grade
  double average = student.calculateAverageGrade();
  print('Student: ${student.name}');
  print('Age: ${student.age}');
  print('Grades: ${student.grades}');
  print('Average Grade: ${average.toStringAsFixed(2)}');
  
  // Example with empty grades list
  var student2 = Student('Jane Smith', 22, []);
  print('\nStudent: ${student2.name}');
  print('Average Grade: ${student2.calculateAverageGrade()}');
  
  
   // Create a bank account with initial balance
  var account = BankAccount('123456789', 'John Doe', 1000.0);
  account.displayInfo();
  
  // Test deposit scenarios
  print('=== Testing Deposit Scenarios ===');
  account.deposit(500.0);  // Valid deposit
  account.deposit(-100.0); // Invalid deposit (negative amount)
  account.deposit(0.0);    // Invalid deposit (zero amount)
  
  // Test withdrawal scenarios
  print('\n=== Testing Withdrawal Scenarios ===');
  account.withdraw(200.0);  // Valid withdrawal
  account.withdraw(1500.0); // Invalid withdrawal (insufficient funds)
  account.withdraw(-50.0);  // Invalid withdrawal (negative amount)
  account.withdraw(0.0);    // Invalid withdrawal (zero amount)
  
  // Test successful withdrawal after previous operations
  print('\n=== Additional Valid Operations ===');
  account.withdraw(800.0);  // Valid withdrawal
  account.deposit(300.0);   // Valid deposit
  
  // Final account status
  account.displayInfo();
  
  // Test edge case: empty account
  print('=== Testing Empty Account ===');
  var emptyAccount = BankAccount('987654321', 'Jane Smith');
  emptyAccount.displayInfo();
  emptyAccount.withdraw(100.0); // Attempt to withdraw from empty account
  emptyAccount.deposit(200.0);  // Deposit to empty account
  emptyAccount.withdraw(100.0); // Valid withdrawal
}