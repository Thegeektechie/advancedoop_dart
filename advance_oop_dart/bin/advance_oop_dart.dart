import 'dart:io';

// Define the Student class
class Student {
  String name;
  int age;
  String gradeLevel;

  // Constructor
  Student(this.name, this.age, this.gradeLevel);

  // Method to print student's information
  void printStudentInfo() {
    print('Student Information:');
    print('-----------------------------------');
    print('| Name          | Age  | Grade Level  |');
    print('-----------------------------------');
    print('| ${name.padRight(13)} | ${age.toString().padRight(4)} | ${gradeLevel.padRight(12)} |');
    print('-----------------------------------');
  }
}

// Define the Teacher class
class Teacher {
  String name;
  int age;
  List<String> subjects;

  // Constructor
  Teacher(this.name, this.age, this.subjects);

  // Method to print teacher's information
  void printTeacherInfo() {
    print('Teacher Information:');
    print('---------------------------------------------------');
    print('| Name          | Age  | Subjects                    |');
    print('---------------------------------------------------');
    print('| ${name.padRight(13)} | ${age.toString().padRight(4)} | ${subjects.join(", ").padRight(26)} |');
    print('---------------------------------------------------');
  }
}

// Define the School class that manages Students and Teachers
class School {
  List<Student> students = [];
  List<Teacher> teachers = [];

  // Method to add a student
  void addStudent() {
    print('Enter Student Name:');
    String name = stdin.readLineSync()!;
    print('Enter Student Age:');
    int age = int.parse(stdin.readLineSync()!);
    print('Enter Student Grade Level:');
    String gradeLevel = stdin.readLineSync()!;
    students.add(Student(name, age, gradeLevel));
    print('Student added successfully.\n');
  }

  // Method to remove a student
  void removeStudent() {
    print('Enter Student Name to Remove:');
    String name = stdin.readLineSync()!;
    students.removeWhere((student) => student.name == name);
    print('Student removed successfully.\n');
  }

  // Method to add a teacher
  void addTeacher() {
    print('Enter Teacher Name:');
    String name = stdin.readLineSync()!;
    print('Enter Teacher Age:');
    int age = int.parse(stdin.readLineSync()!);
    print('Enter Subjects (comma separated):');
    List<String> subjects = stdin.readLineSync()!.split(',').map((s) => s.trim()).toList();
    teachers.add(Teacher(name, age, subjects));
    print('Teacher added successfully.\n');
  }

  // Method to remove a teacher
  void removeTeacher() {
    print('Enter Teacher Name to Remove:');
    String name = stdin.readLineSync()!;
    teachers.removeWhere((teacher) => teacher.name == name);
    print('Teacher removed successfully.\n');
  }

  // Method to view students' information
  void viewStudents() {
    if (students.isEmpty) {
      print('No students available.\n');
      return;
    }
    students.forEach((student) => student.printStudentInfo());
  }

  // Method to view teachers' information
  void viewTeachers() {
    if (teachers.isEmpty) {
      print('No teachers available.\n');
      return;
    }
    teachers.forEach((teacher) => teacher.printTeacherInfo());
  }

  // Method to display menu and handle user choices
  void displayMenu() {
    while (true) {
      print('School Management System');
      print('1. Add Student');
      print('2. Remove Student');
      print('3. Add Teacher');
      print('4. Remove Teacher');
      print('5. View Students');
      print('6. View Teachers');
      print('7. Exit');
      print('Enter your choice:');
      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          addStudent();
          break;
        case 2:
          removeStudent();
          break;
        case 3:
          addTeacher();
          break;
        case 4:
          removeTeacher();
          break;
        case 5:
          viewStudents();
          break;
        case 6:
          viewTeachers();
          break;
        case 7:
          print('Exiting...');
          return;
        default:
          print('Invalid choice, please try again.\n');
      }
    }
  }
}

// Main function to execute the program
void main() {
  // Create an instance of School
  School school = School();
  // Display the menu to interact with the user
  school.displayMenu();
}
