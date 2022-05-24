// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoteDTOTearOff {
  const _$NoteDTOTearOff();

  _NoteDTO call(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required String body,
      @HiveField(3) required int colorIndex}) {
    return _NoteDTO(
      id: id,
      name: name,
      body: body,
      colorIndex: colorIndex,
    );
  }
}

/// @nodoc
const $NoteDTO = _$NoteDTOTearOff();

/// @nodoc
mixin _$NoteDTO {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get body => throw _privateConstructorUsedError;
  @HiveField(3)
  int get colorIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteDTOCopyWith<NoteDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDTOCopyWith<$Res> {
  factory $NoteDTOCopyWith(NoteDTO value, $Res Function(NoteDTO) then) =
      _$NoteDTOCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String body,
      @HiveField(3) int colorIndex});
}

/// @nodoc
class _$NoteDTOCopyWithImpl<$Res> implements $NoteDTOCopyWith<$Res> {
  _$NoteDTOCopyWithImpl(this._value, this._then);

  final NoteDTO _value;
  // ignore: unused_field
  final $Res Function(NoteDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? body = freezed,
    Object? colorIndex = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      colorIndex: colorIndex == freezed
          ? _value.colorIndex
          : colorIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$NoteDTOCopyWith<$Res> implements $NoteDTOCopyWith<$Res> {
  factory _$NoteDTOCopyWith(_NoteDTO value, $Res Function(_NoteDTO) then) =
      __$NoteDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String body,
      @HiveField(3) int colorIndex});
}

/// @nodoc
class __$NoteDTOCopyWithImpl<$Res> extends _$NoteDTOCopyWithImpl<$Res>
    implements _$NoteDTOCopyWith<$Res> {
  __$NoteDTOCopyWithImpl(_NoteDTO _value, $Res Function(_NoteDTO) _then)
      : super(_value, (v) => _then(v as _NoteDTO));

  @override
  _NoteDTO get _value => super._value as _NoteDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? body = freezed,
    Object? colorIndex = freezed,
  }) {
    return _then(_NoteDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      colorIndex: colorIndex == freezed
          ? _value.colorIndex
          : colorIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'NoteDTOAdapter')
class _$_NoteDTO extends _NoteDTO {
  _$_NoteDTO(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.body,
      @HiveField(3) required this.colorIndex})
      : super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String body;
  @override
  @HiveField(3)
  final int colorIndex;

  @override
  String toString() {
    return 'NoteDTO(id: $id, name: $name, body: $body, colorIndex: $colorIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality()
                .equals(other.colorIndex, colorIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(colorIndex));

  @JsonKey(ignore: true)
  @override
  _$NoteDTOCopyWith<_NoteDTO> get copyWith =>
      __$NoteDTOCopyWithImpl<_NoteDTO>(this, _$identity);
}

abstract class _NoteDTO extends NoteDTO {
  factory _NoteDTO(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required String body,
      @HiveField(3) required int colorIndex}) = _$_NoteDTO;
  _NoteDTO._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get body;
  @override
  @HiveField(3)
  int get colorIndex;
  @override
  @JsonKey(ignore: true)
  _$NoteDTOCopyWith<_NoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
