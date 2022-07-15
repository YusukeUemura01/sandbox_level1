// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_profile_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfilePageState {
  File? get newAccountImage => throw _privateConstructorUsedError;
  Account? get myAccount => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  TextEditingController get textEditingController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfilePageStateCopyWith<EditProfilePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfilePageStateCopyWith<$Res> {
  factory $EditProfilePageStateCopyWith(EditProfilePageState value,
          $Res Function(EditProfilePageState) then) =
      _$EditProfilePageStateCopyWithImpl<$Res>;
  $Res call(
      {File? newAccountImage,
      Account? myAccount,
      bool isLoading,
      TextEditingController textEditingController});

  $AccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class _$EditProfilePageStateCopyWithImpl<$Res>
    implements $EditProfilePageStateCopyWith<$Res> {
  _$EditProfilePageStateCopyWithImpl(this._value, this._then);

  final EditProfilePageState _value;
  // ignore: unused_field
  final $Res Function(EditProfilePageState) _then;

  @override
  $Res call({
    Object? newAccountImage = freezed,
    Object? myAccount = freezed,
    Object? isLoading = freezed,
    Object? textEditingController = freezed,
  }) {
    return _then(_value.copyWith(
      newAccountImage: newAccountImage == freezed
          ? _value.newAccountImage
          : newAccountImage // ignore: cast_nullable_to_non_nullable
              as File?,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      textEditingController: textEditingController == freezed
          ? _value.textEditingController
          : textEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }

  @override
  $AccountCopyWith<$Res>? get myAccount {
    if (_value.myAccount == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.myAccount!, (value) {
      return _then(_value.copyWith(myAccount: value));
    });
  }
}

/// @nodoc
abstract class _$$_EditProfilePageStateCopyWith<$Res>
    implements $EditProfilePageStateCopyWith<$Res> {
  factory _$$_EditProfilePageStateCopyWith(_$_EditProfilePageState value,
          $Res Function(_$_EditProfilePageState) then) =
      __$$_EditProfilePageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {File? newAccountImage,
      Account? myAccount,
      bool isLoading,
      TextEditingController textEditingController});

  @override
  $AccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class __$$_EditProfilePageStateCopyWithImpl<$Res>
    extends _$EditProfilePageStateCopyWithImpl<$Res>
    implements _$$_EditProfilePageStateCopyWith<$Res> {
  __$$_EditProfilePageStateCopyWithImpl(_$_EditProfilePageState _value,
      $Res Function(_$_EditProfilePageState) _then)
      : super(_value, (v) => _then(v as _$_EditProfilePageState));

  @override
  _$_EditProfilePageState get _value => super._value as _$_EditProfilePageState;

  @override
  $Res call({
    Object? newAccountImage = freezed,
    Object? myAccount = freezed,
    Object? isLoading = freezed,
    Object? textEditingController = freezed,
  }) {
    return _then(_$_EditProfilePageState(
      newAccountImage: newAccountImage == freezed
          ? _value.newAccountImage
          : newAccountImage // ignore: cast_nullable_to_non_nullable
              as File?,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      textEditingController: textEditingController == freezed
          ? _value.textEditingController
          : textEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_EditProfilePageState
    with DiagnosticableTreeMixin
    implements _EditProfilePageState {
  _$_EditProfilePageState(
      {this.newAccountImage,
      this.myAccount,
      this.isLoading = false,
      required this.textEditingController});

  @override
  final File? newAccountImage;
  @override
  final Account? myAccount;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final TextEditingController textEditingController;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditProfilePageState(newAccountImage: $newAccountImage, myAccount: $myAccount, isLoading: $isLoading, textEditingController: $textEditingController)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditProfilePageState'))
      ..add(DiagnosticsProperty('newAccountImage', newAccountImage))
      ..add(DiagnosticsProperty('myAccount', myAccount))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(
          DiagnosticsProperty('textEditingController', textEditingController));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfilePageState &&
            const DeepCollectionEquality()
                .equals(other.newAccountImage, newAccountImage) &&
            const DeepCollectionEquality().equals(other.myAccount, myAccount) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.textEditingController, textEditingController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newAccountImage),
      const DeepCollectionEquality().hash(myAccount),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(textEditingController));

  @JsonKey(ignore: true)
  @override
  _$$_EditProfilePageStateCopyWith<_$_EditProfilePageState> get copyWith =>
      __$$_EditProfilePageStateCopyWithImpl<_$_EditProfilePageState>(
          this, _$identity);
}

abstract class _EditProfilePageState implements EditProfilePageState {
  factory _EditProfilePageState(
          {final File? newAccountImage,
          final Account? myAccount,
          final bool isLoading,
          required final TextEditingController textEditingController}) =
      _$_EditProfilePageState;

  @override
  File? get newAccountImage => throw _privateConstructorUsedError;
  @override
  Account? get myAccount => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  TextEditingController get textEditingController =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfilePageStateCopyWith<_$_EditProfilePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
