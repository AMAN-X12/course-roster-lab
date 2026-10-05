// lab3.dart  -  Campus Cafe Order System 
// Name: Amaan Khan  Roll no: _04072313024

 // lab3.dart  -  Campus Cafe Order System 
// Name: Amaan Khan  Roll no: _04072313024

 const String rollNo = '04072313024';

// ===== Seeded settings (generated from YOUR roll number). Do not edit. =====
final int seed = int.parse(rollNo.substring(rollNo.length - 2));
final int t = seed ~/ 10; // tens digit
final int u = seed % 10;  // units digit

const List menu = [
  'Chai', 'Latte', 'Mocha', 'Samosa', 'Brownie',
  'Sandwich', 'Cold Coffee', 'Fries', 'Pakora', 'Zinger Wrap',
];

int priceOf(int i) => 100 + 7 * i + 3 * t; // price of menu[i], in rupees
final int priceFloor = 60 + 5 * t;
final int taxPercent = 5 + t;
final int bigOrderLimit = 450 + 20 * t;
final int balanceCap = 600 + 20 * t;
final int couponPercent = 5 + t + u;
// =====


//step 1

class Dish {
  late String name;
  late int price;
}

//step 2 


// Think: Why could price not be declared final in this version of the class?
// Because we are modifying 'this.price' inside the constructor body. A final variable can only be assigned once and cannot be changed after its initial assignment.
class MenuItem {
  String name;
  int price;

  MenuItem(this.name, this.price) {
    if (this.price < priceFloor) {
      this.price = priceFloor;
    }
  }

  //step 3 
  MenuItem.free(this.name) : price = 0;
  MenuItem.fromString(String text) : name = text.split(':')[0],price = int.parse(text.split(':')[1]);
//step 8 func 
  @override
  String toString() => '$name (Rs $price)';
}

//step 3 

// Think: The floor is, say, 80 but free() produced 0. Why did the floor logic not run?
// The floor logic is inside the body of the main constructor. Named constructors like MenuItem.free() do not run the main constructor's body unless they explicitly redirect to it. Since we used an initializer list to set price = 0, the main constructor's body doesnot run.


//step 4 
class OrderLog {
  static OrderLog? _instance;
  final List<String> entries = [];

  OrderLog._internal();

  factory OrderLog() {
    return _instance ??= OrderLog._internal();
  }

  void add(String msg) => entries.add(msg);
}


//step 5  and 6
class OrderLine {
  final MenuItem item;
  final int qty;
  final int total;
  final int tax;

  OrderLine(this.item, this.qty)
      : total = item.price * qty,
        tax = (item.price * qty) * taxPercent ~/ 100,
        assert(qty > 0, 'qty must be positive');

  int get grand => total + tax;

  bool get isBigOrder => grand > bigOrderLimit;

  String get label => '${item.name} x$qty';
}
OrderLine mainOrder() {
  return OrderLine(
    MenuItem(menu[u], priceOf(u)),
    2 + (t + u) % 5,
  );
}

//step 6 think:

// Why does that line fail? What would you have to add to make it legal? 
// line.grand = 5; fails because grand is a getter without a setter.
// To make assignment legal, a setter for grand would have to be added.


// step 7 
class StudentCard {
  final String owner;
  int _balance;
  StudentCard(this.owner) : _balance = 0;
  int get balance => _balance;
  set balance(int v) {
    if (v < 0) {
      _balance = 0;
    } else if (v > balanceCap) {
      _balance = balanceCap;
    } else {
      _balance = v;
    }
  }
}
//question : The setter silently clamps a bad value. What is one other thing  a setter could do with an invalid value? 
//Instead of silently clamping an invalid value,
// a setter could throw an exception or reject the value.


// step 8 
List<MenuItem> buildMenu() {
  return [
    for (int k = 0; k < 4; k++)
      MenuItem.fromString(
        '${menu[(u + 3 * k) % 10]}:${priceOf((u + 3 * k) % 10)}',
      ),
  ];
}


// step 9
List<OrderLine> buildReceipt() {
  List<MenuItem> items = buildMenu();

  return [
    for (int k = 0; k < 3; k++)
      OrderLine(
        items[k],
        1 + (t + k) % 4,
      ),
  ];
}


//step 10 
class Coupon {
  static final Map<String, Coupon> _cache = {};
  final String code;
  final int percent;
  final int minSpend;

  Coupon(this.code, this.percent): minSpend = percent * 70,
        assert(percent >= 1 && percent <= 50);
  factory Coupon.fromCode(String code) {
    return _cache.putIfAbsent(
      code,
      () => Coupon(code, couponPercent),
    );
  }
  int discountOn(int amount) {
    if (amount >= minSpend) {
      return amount * percent ~/ 100;
    }
    return 0;
  }
}
void main() {
  print('Seed: $seed (t=$t, u=$u)');
  step1();
  step2();
  step3();
  step4();
  step5();
  step6();
  step7();
  step8();
  step9();
  step10();
}

void step1() {
  print('--- Step 1 ---');
  
  Dish item1 = Dish();
  item1.name = menu[u];
  item1.price = priceOf(u);

  Dish item2 = Dish();
  item2.name = menu[(u + 1) % 10];
  item2.price = priceOf((u + 1) % 10);
  item2.price = item2.price - u;

print('Step 1: ${item1.name} Rs ${item1.price}');
print('Step 1: ${item2.name} Rs ${item2.price}');
}

void step2() {print('--- Step 2 ---');
  
  MenuItem a = MenuItem(menu[u], priceOf(u));
  MenuItem b = MenuItem('Test Special', 15 * u);
print('Step 2: ${a.name} Rs ${a.price}');
print('Step 2: Test Special Rs ${b.price}');}

void step3() {
  print('--- Step 3 ---');  
  MenuItem freebie = MenuItem.free('Water');
  int i = (u + 2) % 10;
String text = '${menu[i]}:${priceOf(i)}';
  MenuItem parsed = MenuItem.fromString(text);
  print('Step 3: ${freebie.name} Rs ${freebie.price}');
print('Step 3: ${parsed.name} Rs ${parsed.price}');
print('Step 3: floor=$priceFloor, free price=${freebie.price}');
}
void step4() {
  print('--- Step 4 ---');
  OrderLog log1 = OrderLog();
  OrderLog log2 = OrderLog();
  for (int i = 1; i <= u + 2; i++) {
    String message = 'order #${100 * t + i}';
    if (i % 2 == 1) {
      log1.add(message);
    } else {
      log2.add(message);
    }
  }

  print('Step 4: same object? ${identical(log1, log2)}');
  print('Step 4: entries = ${log1.entries.length}');
  print('Step 4: last = ${log2.entries.last}');
}
void step5() {
  print('--- Step 5 ---');
  OrderLine line = mainOrder();
  print('Step 5: ${line.item.name} x${line.qty}');
  print('Step 5: total=${line.total} tax=${line.tax}');
  try {
    OrderLine(line.item, 0);
    print('Step 5: assert did NOT fire');
  } on AssertionError {
    print('Step 5: assert fired');
  }
}
void step6() {
  print('--- Step 6 ---');
  OrderLine line = mainOrder();
  print('Step 6: grand=${line.grand}');
  print('Step 6: big order? ${line.isBigOrder} (limit $bigOrderLimit)');
  print('Step 6: label=${line.label}');
}
void step7() {
  print('--- Step 7 ---');
  StudentCard card = StudentCard('S$seed');
  card.balance = seed * 10 + 50;
  print('Step 7: topped up -> ${card.balance}');
  card.balance = -seed - 1;
  print('Step 7: bad value -> ${card.balance}');
  card.balance = balanceCap - u;
  print('Step 7: reset -> ${card.balance}');
  card.balance = card.balance - mainOrder().grand;
  print('Step 7: paid order -> ${card.balance}');
}
void step8() {
  print('--- Step 8 ---');

  List<MenuItem> items = buildMenu();

  MenuItem priciest = items.reduce(
    (a, b) => a.price > b.price ? a : b,
  );
  int sum = items.fold(
    0,
    (total, item) => total + item.price,
  );
  print('Step 8: menu = $items');
  print('Step 8: priciest = ${priciest.name}');
  print('Step 8: sum = $sum');
}
void step9() {
  print('--- Step 9 ---');

  List<OrderLine> receipt = buildReceipt();
  OrderLog log = OrderLog();
  int receiptTotal = 0;
  for (OrderLine line in receipt) {
    print('Step 9: ${line.label} = ${line.grand}');

    log.add('receipt: ${line.label}');

    receiptTotal += line.grand;
  }
  print('Step 9: receipt total = $receiptTotal');
  print('Step 9: log size = ${log.entries.length}');
}
void step10() {
  print('--- Step 10 ---');
  String code = 'CAFE${seed.toString().padLeft(2, '0')}';
  Coupon c1 = Coupon.fromCode(code);
  Coupon c2 = Coupon.fromCode(code);
  int receipt = 0;
  for (OrderLine line in buildReceipt()) {
    receipt += line.grand;
  }
  int discount = c1.discountOn(receipt);
  print(
    'Step 10: ${c1.code} gives ${c1.percent}% off, min spend ${c1.minSpend}',
  );
  print('Step 10: cached? ${identical(c1, c2)}');
  print(
    'Step 10: receipt $receipt, discount $discount, payable ${receipt - discount}',
  );
}


// Q1. Animal(this.name, this.type); and the verbose constructor give the same result. What does the shorthand save you?
// Answer: The shorthand saves us from writing this.name = name and this.type = type
// manually inside the constructor body. It makes the constructor shorter and cleaner.


// Q2. When would you choose a named constructor, and when a factory constructor?
// Answer: A named constructor is useful when a class needs different ways to create
// an object. A factory constructor is useful when we may want to return an existing object instead of always creating a new one.


// Q3. What is the difference between assigning a field in a constructor body and assigning it in an initializer list?
// Answer: A constructor body assigns fields after the object has been initialized,
// while an initializer list assigns fields before the constructor body runs and can be used to initialize final fields.


/* Q4. Give one reason to use a getter instead of storing the value in a field, and one reason to use a setter instead of a public field.
// Answer: A getter can expose computed data without storing it separately. A setter can validate or control a value before storing it.
*/