import 'package:budgetly/core/utils/math_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('add comma to number', () {

    test('Given a double number, it should return a string', () {
      var number = 1500.00;
      var formattedNumber = MathUtils.addComma(number: number);

      expect(formattedNumber, isA<String>());
    });

    test('Given a number greater than 3 digits, it should add a comma', () {
      var number = 1500000.00;
      var formattedNumber = MathUtils.addComma(number: number);

      expect(formattedNumber, '1,500,000.00');
    });
  });
}