import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flutter/unittesting/randomizer.dart';

void main() {
  Randomizer r;

  setUp(() {
    r = Randomizer();
  });

  test('return a random number in range', () {
    expect(r.nextInRange(1, 3), allOf(greaterThanOrEqualTo(1), lessThanOrEqualTo(3)));
    //expect(r.nextInRange(5, 7), 6);
  });
}
