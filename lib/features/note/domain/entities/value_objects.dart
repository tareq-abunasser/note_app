import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/entities/failures.dart';
import '../../../../core/entities/value_objects.dart';
import '../../../../core/entities/value_transformers.dart';
import '../../../../core/entities/value_validators.dart';

class UniqueId extends ValueObject<String, String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    /// this used when you want to create local unique id
    /// like when you create new mission you will give him the id
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    /// in this factory we must trust in the uniqueId string because we will not check it's uniqnesses
    /// this UniqueId always come from firebase , when you create new user in firebase , the firebase give it's the id not you
    return UniqueId._(
      right(uniqueId),
    );
  }

  const UniqueId._(this.value);
}


class NoteBody extends ValueObject<String, String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 1000;

  factory NoteBody(String input) {
    return NoteBody._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const NoteBody._(this.value);
}

class NoteName extends ValueObject<String, String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NoteName(String input) {
    return NoteName._(
      validateStringNotEmpty(input),
    );
  }

  const NoteName._(this.value);
}


class NoteColor extends ValueObject<Color, Color> {
  static const List<Color> predefinedColors = [
    Color(0xFF1321E0), // Basic color
    Color(0xffFFFFFF), // classic white
    Color(0xffF28B81), // light pink
    Color(0xffF7BD02), // yellow
    Color(0xffFBF476 ), // light yellow
    Color(0xffCDFF90), // light green
    Color(0xffA7FEEB), // turquoise
    Color(0xffCBF0F8), // light cyan
    Color(0xffAFCBFA), // light blue
    Color(0xffD7AEFC), // plum
    Color(0xffFBCFE9), // misty rose
    Color(0xffE6C9A9), // light brown
    Color(0xffE9EAEE), // light gray
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;

  factory NoteColor(Color input) {
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}
