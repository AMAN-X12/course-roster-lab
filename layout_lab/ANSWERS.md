# CS442 Week 7 Lab — Team Board

**Name:** Amaan Khan  
**Roll Number:** 04072313024  
**Seed:** 24

## Part A — Numeric Answers

A1: 23  
A2: 5  
A3: 4  
A4: 75

## Part B — Written Answers

### B1: Stateless and Stateful Widgets

**Stateless widgets:** `LabApp`, `HomePage`, `SettingsCard`, `Welcome`, `Probe`, `InfoPanel`, `SummaryRow`, and `ShareRow`. These widgets do not manage their own mutable state.

**Stateful widgets:** `Clock`, `Tile`, and `SwapBoard`. `Clock` manages the timer and seconds, `Tile` manages its tap counter, and `SwapBoard` manages the tile order when the Swap button is pressed.

### B2: Widget, Element, and RenderObject

A Widget describes how part of the interface should look. A new Widget configuration can be created whenever `setState` triggers a rebuild. The Element remains associated with its position in the widget tree and manages the relationship between the Widget and its state. The RenderObject handles layout, painting, and hit testing.

In `Probe`, the Widget identity changes between rebuilds, while the Element identity stays stable. This demonstrates that Widget configurations can be replaced while the Element remains in the tree.

### B3: Constraints Go Down, Sizes Go Up

In Step 7, `Expanded` gives each Text widget a limited share of the Row's available width. The constraints travel down the widget tree. Each Text wraps its content within the permitted width and determines the space it needs. Its resulting size travels back up the tree. This allows the three paragraphs to fit into equal-width columns instead of overflowing horizontally.