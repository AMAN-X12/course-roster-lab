
# CS442 Flutter Lab — Study Tracker

**Name:** Amaan Khan  
**Roll Number:** 04072313024

## Numeric Answers

A1: 6

A2: 6

A3: 3

A4: 29

## Written Answers

### B1: Stateless and Stateful Widgets

LabApp, HomePage, StudentCard, and GoalBanner are StatelessWidgets because they describe UI from their configuration without managing changing state internally.

Tally, Countdown, and BuggyCounter are StatefulWidgets because their associated State objects manage changing values, such as the count, countdown time, and click count.

### B2: Why must the Timer be cancelled in dispose()?

The timer must be cancelled to prevent callbacks from running after the widget has been removed. Otherwise, a callback could call setState() after dispose(), causing an error and wasting resources.

### B3: Which widgets can be const, and what does const do?

Widgets with constant constructors and constant arguments can be declared const, such as LabApp, MaterialApp, Tally, Countdown, SizedBox, and some Text widgets. The exact widgets depend on their arguments.

The const keyword allows Dart and Flutter to reuse compile-time constant objects instead of repeatedly creating equivalent objects, where applicable.
