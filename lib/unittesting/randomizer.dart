import 'dart:math' as math;

class Randomizer {
  num nextInRange(int a, int b) {
    return a + math.Random().nextInt(b);
  }

  num nextInRange2(double a, double b) {
    return a + math.Random().nextDouble();
  }
}
