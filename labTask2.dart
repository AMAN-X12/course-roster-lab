// part 1
/// A simple welcome function prints a welcome banner for the application.
void printWelcome(String appName) {
  print('=== $appName ===');
}

//helper func
String generateCode(String title) {
  return (title.substring(0, 2).toUpperCase() + '101');
}

void main() {
  //part 1
  printWelcome("Course Roster Manager");

  //part 2

  const int maxCapacity = 4;

  final DateTime createdAt = DateTime.now();

  String courseTitle = 'CS201: Mobile App Development';

  int capacity = maxCapacity;

  double creditHours = 3.0;

  bool isOpen = true;

  List<String> enrolledStudents = ['Aiden', 'Maria', 'Jamal'];

  Set<String> waitlist = {'Priya', 'Noah'};

  Map<String, int> attendanceCount = {'Aiden': 3, 'Maria': 4, 'Jamal': 2};

  print(
    '$courseTitle | Capacity: $capacity | Enrolled: ${enrolledStudents.length}',
  );

  // teh declaration (createdAt) couldnot be const legally beacuse DateTime.now() is determined when the program runs not at the compile time.

  //part 3
  String? instructorEmail;

  print(instructorEmail ?? 'TBA');

  late String enrollmentCode;

  enrollmentCode = generateCode(courseTitle);

  print('Enrollment code: $enrollmentCode');

  //   print('Instructor email length: ${instructorEmail!.length}');
  print('Instructor email length: ${instructorEmail?.length ?? 0}');

  //part 4
  String rawNames = ' Aiden , maria ,JAMAL , Priya ';

  List<String> cleanNames = [];
  List<String> splitedNames = rawNames.split(',');
  for (var name in splitedNames) {
    cleanNames.add(name.trim());
  }

  print('Clean names: $cleanNames');

  String courseDescription =
      '''
Course: $courseTitle
Credit Hours: $creditHours
Capacity: $capacity
Created At: $createdAt
''';

  print(courseDescription);
  print('Seats left: ${capacity - enrolledStudents.length}');

  //part 5
  int fullGroups = enrolledStudents.length ~/ 3;

  int leftover = enrolledStudents.length % 3;

  print('Full groups of 3: $fullGroups, leftover: $leftover');

  Object formInput = 'twenty-two';

  if (formInput is String) {
    print('Form input is a String.');
  }

  if (formInput is! int) {
    print('Form input is not an int.');
  }
  StringBuffer report = StringBuffer()
    ..write('Report: $courseTitle')
    ..write(' | Cap: $capacity')
    ..write(' | Roster: ${enrolledStudents.length}');

  print(report.toString());

  List<String>? extraNotes;

  extraNotes?..add('Room change pending');

  print('Extra notes: $extraNotes');

  int? bonusSeats;

  bonusSeats ??= 0;

  print('Bonus seats: $bonusSeats');

  //part 6
  if (isOpen && enrolledStudents.length < capacity) {
    print("You're in Welcome aboard.");
  } else {
    print('Sorry, the course is full or closed.');
  }

  int enrollmentStatusCode = 200;

  switch (enrollmentStatusCode) {
    case 200:
      print('Enrolled');
      break;

    case 404:
      print('Course not found');
      break;

    default:
      print('Unknown error');
      break;
  }

  String statusTag = isOpen ? 'OPEN' : 'FULL';
  print(statusTag);
}
