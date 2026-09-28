// Week3.dart - Library Desk Assistant
// Name: ____________________ Roll no: ____________

final List<Map<String, dynamic>> books = [
  {
    'title': 'Dart in Action',
    'author': 'Ada',
    'year': 2021,
    'copies': 3,
    'tags': ['dart', 'programming'],
  },
  {
    'title': 'Flutter Basics',
    'author': 'Sam',
    'year': 2023,
    'copies': 0,
    'tags': ['flutter', 'mobile'],
  },
  {
    'title': 'Clean Code',
    'author': 'Martin',
    'year': 2008,
    'copies': 2,
    'tags': ['programming', 'design'],
  },
  {
    'title': 'Algorithms',
    'author': 'Knuth',
    'year': 1968,
    'copies': 1,
    'tags': ['programming', 'math'],
  },
  {
    'title': 'UI Design',
    'author': 'Nora',
    'year': 2019,
    'copies': 4,
    'tags': ['design', 'mobile'],
  },
];

//part 1 functions
double lateFee(int daysLate, double ratePerDay) => daysLate * ratePerDay;

String formatTitle(String title, [String? author]) =>
    author == null ? title : '$title by $author';

Map<String, dynamic> makeBook({
  required String title,
  required String author,
  int year = 2024,
  int copies = 1,
}) {
  return {'title': title, 'author': author, 'year': year, 'copies': copies};
}

bool isClassic(int year) => year < 2000;

//part 2 functions
List<String> transformAll(List<String> items, String Function(String) fn) {
  return items.map(fn).toList();
}

int Function() makeCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

double Function(int) makeFeeCalculator(double rate) {
  return (int days) => days * rate;
}

int sumDigits(int n) {
  if (n < 10) {
    return n;
  }

  return (n % 10) + sumDigits(n ~/ 10);
}

//part 3 functions
Map<String, int> buildStock() {
  return {for (var b in books) b['title'] as String: b['copies'] as int};
}

//part 4  functions
class Box<T> {
  T value;

  Box(this.value);
}
T firstOr<T>(List<T> items, T fallback) {
  if (items.isNotEmpty) {
    return items.first;
  }

  return fallback;
}
class Pair<A, B> {
  A first;
  B second;

  Pair(this.first, this.second);

  @override
  String toString() {
    return '($first, $second)';
  }
}


void main() async {
  part1();
  part2();
  part3();
  part4();
  part5();
  await part6();
}

void part1() {
  print('--- Part 1 ---');
  print('Late fee: ${lateFee(5, 0.5)}');
  print(formatTitle('Dart in Action'));
  print(formatTitle('Dart in Action', 'Ada'));
  print(makeBook(title: 'Clean Code', author: 'Martin'));

  print(makeBook(title: 'Algorithms', author: 'Knuth', year: 1968));
  print(isClassic(1968));
  print(isClassic(2021));
}

void part2() {
  print('--- Part 2 ---');
  print(
    transformAll([
      'Dart in Action',
      'Clean Code',
    ], (item) => item.toUpperCase()),
  );
  print(transformAll(['Dart in Action', 'Clean Code'], (item) => '$item!'));
  var desk1 = makeCounter();
  var desk2 = makeCounter();

  print(desk1());
  print(desk1());
  print(desk1());
  print(desk2());
  var studentFee = makeFeeCalculator(0.25);
  var staffFee = makeFeeCalculator(0.10);
  print('Student fee: ${studentFee(4)}');
  print('Staff fee: ${staffFee(4)}');
  print('Sum of digits: ${sumDigits(1232)}');
}

void part3() {
  print('--- Part 3 ---');
  final titles = books.map((b) => b['title'] as String).toList();
  print('Titles: $titles');
  final available = books
      .where((b) => (b['copies'] as int) > 0)
      .map((b) => b['title'] as String)
      .toList();

  print('Available: $available');

  final totalCopies = books.fold<int>(
    0,
    (sum, b) => sum + (b['copies'] as int),
  );

  print('Total copies: $totalCopies');

  final years = books.map((b) => b['year'] as int).toList();

  final oldestYear = years.reduce(
    (oldest, year) => year < oldest ? year : oldest,
  );

  print('Oldest year: $oldestYear');
  final sortedBooks = [...books];
  sortedBooks.sort((a, b) => (a['year'] as int).compareTo(b['year'] as int));
  final sortedTitles = sortedBooks.map((b) => b['title'] as String).toList();
  print('By year: $sortedTitles');

  final stock = buildStock();
  print('Stock: $stock');
  stock.forEach((title, copies) {
    if (copies == 0) {
      print('Out of stock: $title');
    }
  });
  print('Copies of Unknown: ${stock['Unknown'] ?? 0}');

  final allTags = {for (var b in books) ...(b['tags'] as List<String>)};

  print('All tags: $allTags');

  var a = {'Dart in Action', 'Clean Code', 'Flutter Basics'};

  var b = {'Clean Code', 'Flutter Basics', 'Algorithms'};

  print('Union: ${a.union(b)}');
  print('Common: ${a.intersection(b)}');
  print('Only in A: ${a.difference(b)}');
}

void part4() {
  print('--- Part 4 ---');
  var intBox = Box<int>(5);
  var stringBox = Box<String>('dart');

  print('Box<int>: ${intBox.value}');
  print('Box<String>: ${stringBox.value}');
  //compiel time error
  // intBox.value = 'hello';

  print(firstOr(
    ['Dart in Action', 'Clean Code'],
    'none',
  ));
  print(firstOr<String>([], 'z'));
  print(Pair('Dart in Action', 3));
}

void part5() {
  print('--- Part 5 ---');
}

Future<void> part6() async {
  print('--- Part 6 ---');
}
