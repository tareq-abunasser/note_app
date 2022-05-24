import 'package:dartz/dartz.dart';

import 'failures.dart';



Either<ValueFailure<String>, String> validateMaxStringLength(
    String input,
    int maxLength,
    ) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  print("999");
  print(input);
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateNotDefaultValue(
    String input,
    ) {
  String defaultValue = "Type something....";
  if (input != defaultValue) {
    return right(input);
  } else {
    return left(
      ValueFailure.defaultValue(failedValue: input),
    );
  }
}