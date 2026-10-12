# CS442 — Mobile Application Development
## Campus Library System Lab — Reflection Answers

**Name:** Amaan Khan  
**Roll Number:** 04072313024

### Q1. What can a subclass using `extends` use for free that a class using `implements` has to write itself?

A subclass using `extends` inherits the parent class's accessible fields, methods, and existing implementations. A class using `implements` must implement all the interface members itself, even if the class being implemented already has method bodies.

### Q2. Book and Dvd both use Renewable. When would you pick a mixin, and when an abstract parent class?

I would use a mixin when multiple classes need to share reusable behaviour without making it part of their main inheritance hierarchy. I would use an abstract parent class when related classes share a common identity, state, or base implementation, such as `LibraryItem`.

### Q3. Why must you override hashCode whenever you override ==?

When two objects are equal according to `==`, they must return the same `hashCode`. Sets and maps rely on this rule to handle equal objects correctly, so overriding equality without a matching hash code can cause incorrect collection behaviour.

### Q4. An extension method on String and a subclass of String both add behaviour. Why does Dart let you write the first one but not the second?

An extension adds convenience methods to an existing type without modifying or inheriting from that type. Dart does not allow ordinary subclassing of `String` because it is a built-in  class.