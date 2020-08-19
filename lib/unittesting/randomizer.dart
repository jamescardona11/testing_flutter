import 'dart:math' as math;

class Randomizer {
  num nextInRange(num a, num b) {
    return a + math.Random().nextInt(b);
  }
}
