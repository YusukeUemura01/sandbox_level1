// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loginpage_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginPageState {
  TextEditingController get emailFiledController =>
      throw _privateConstructorUsedError;
  TextEditingController get passFiledController =>
      throw _privateConstructorUsedError;
  String? get emailFiledErrorText => throw _privateConstructorUsedError;
  String? get passFiledErrorText => throw _privateConstructorUsedError;
  Account? get loginAccount => throw _privateConstructorUsedError;
  UserCredential? get loginUserCredential =>
      throw _privateConstructorUsedError; // 初期値
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController emailFiledController,
      TextEditingController passFiledController,
      String? emailFiledErrorText,
      String? passFiledErrorText,
      Account? loginAccount,
      UserCredential? loginUserCredential,
      bool isLoading});

  $AccountCopyWith<$Res>? get loginAccount;
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  final LoginPageState _value;
  // ignore: unused_field
  final $Res Function(LoginPageState) _then;

  @override
  $Res call({
    Object? emailFiledController = freezed,
    Object? passFiledController = freezed,
    Object? emailFiledErrorText = freezed,
    Object? passFiledErrorText = freezed,
    Object? loginAccount = freezed,
    Object? loginUserCredential = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      emailFiledController: emailFiledController == freezed
          ? _value.emailFiledController
          : emailFiledController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passFiledController: passFiledController == freezed
          ? _value.passFiledController
          : passFiledController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      emailFiledErrorText: emailFiledErrorText == freezed
          ? _value.emailFiledErrorText
          : emailFiledErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      passFiledErrorText: passFiledErrorText == freezed
          ? _value.passFiledErrorText
          : passFiledErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      loginAccount: loginAccount == freezed
          ? _value.loginAccount
          : loginAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      loginUserCredential: loginUserCredential == freezed
          ? _value.loginUserCredential
          : loginUserCredential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AccountCopyWith<$Res>? get loginAccount {
    if (_value.loginAccount == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.loginAccount!, (value) {
      return _then(_value.copyWith(loginAccount: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoginPageStateCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$$_LoginPageStateCopyWith(
          _$_LoginPageState value, $Res Function(_$_LoginPageState) then) =
      __$$_LoginPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TextEditingController emailFiledController,
      TextEditingController passFiledController,
      String? emailFiledErrorText,
      String? passFiledErrorText,
      Account? loginAccount,
      UserCredential? loginUserCredential,
      bool isLoading});

  @override
  $AccountCopyWith<$Res>? get loginAccount;
}

/// @nodoc
class __$$_LoginPageStateCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res>
    implements _$$_LoginPageStateCopyWith<$Res> {
  __$$_LoginPageStateCopyWithImpl(
      _$_LoginPageState _value, $Res Function(_$_LoginPageState) _then)
      : super(_value, (v) => _then(v as _$_LoginPageState));

  @override
  _$_LoginPageState get _value => super._value as _$_LoginPageState;

  @override
  $Res call({
    Object? emailFiledController = freezed,
    Object? passFiledController = freezed,
    Object? emailFiledErrorText = freezed,
    Object? passFiledErrorText = freezed,
    Object? loginAccount = freezed,
    Object? loginUserCredential = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_LoginPageState(
      emailFiledController: emailFiledController == freezed
          ? _value.emailFiledController
          : emailFiledController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passFiledController: passFiledController == freezed
          ? _value.passFiledController
          : passFiledController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      emailFiledErrorText: emailFiledErrorText == freezed
          ? _value.emailFiledErrorText
          : emailFiledErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      passFiledErrorText: passFiledErrorText == freezed
          ? _value.passFiledErrorText
          : passFiledErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      loginAccount: loginAccount == freezed
          ? _value.loginAccount
          : loginAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      loginUserCredential: loginUserCredential == freezed
          ? _value.loginUserCredential
          : loginUserCredential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginPageState
    with DiagnosticableTreeMixin
    implements _LoginPageState {
  _$_LoginPageState(
      {required this.emailFiledController,
      required this.passFiledController,
      this.emailFiledErrorText,
      this.passFiledErrorText,
      this.loginAccount,
      this.loginUserCredential,
      this.isLoading = false});

  @override
  final TextEditingController emailFiledController;
  @override
  final TextEditingController passFiledController;
  @override
  final String? emailFiledErrorText;
  @override
  final String? passFiledErrorText;
  @override
  final Account? loginAccount;
  @override
  final UserCredential? loginUserCredential;
// 初期値
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginPageState(emailFiledController: $emailFiledController, passFiledController: $passFiledController, emailFiledErrorText: $emailFiledErrorText, passFiledErrorText: $passFiledErrorText, loginAccount: $loginAccount, loginUserCredential: $loginUserCredential, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginPageState'))
      ..add(DiagnosticsProperty('emailFiledController', emailFiledController))
      ..add(DiagnosticsProperty('passFiledController', passFiledController))
      ..add(DiagnosticsProperty('emailFiledErrorText', emailFiledErrorText))
      ..add(DiagnosticsProperty('passFiledErrorText', passFiledErrorText))
      ..add(DiagnosticsProperty('loginAccount', loginAccount))
      ..add(DiagnosticsProperty('loginUserCredential', loginUserCredential))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginPageState &&
            const DeepCollectionEquality()
                .equals(other.emailFiledController, emailFiledController) &&
            const DeepCollectionEquality()
                .equals(other.passFiledController, passFiledController) &&
            const DeepCollectionEquality()
                .equals(other.emailFiledErrorText, emailFiledErrorText) &&
            const DeepCollectionEquality()
                .equals(other.passFiledErrorText, passFiledErrorText) &&
            const DeepCollectionEquality()
                .equals(other.loginAccount, loginAccount) &&
            const DeepCollectionEquality()
                .equals(other.loginUserCredential, loginUserCredential) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailFiledController),
      const DeepCollectionEquality().hash(passFiledController),
      const DeepCollectionEquality().hash(emailFiledErrorText),
      const DeepCollectionEquality().hash(passFiledErrorText),
      const DeepCollectionEquality().hash(loginAccount),
      const DeepCollectionEquality().hash(loginUserCredential),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_LoginPageStateCopyWith<_$_LoginPageState> get copyWith =>
      __$$_LoginPageStateCopyWithImpl<_$_LoginPageState>(this, _$identity);
}

abstract class _LoginPageState implements LoginPageState {
  factory _LoginPageState(
      {required final TextEditingController emailFiledController,
      required final TextEditingController passFiledController,
      final String? emailFiledErrorText,
      final String? passFiledErrorText,
      final Account? loginAccount,
      final UserCredential? loginUserCredential,
      final bool isLoading}) = _$_LoginPageState;

  @override
  TextEditingController get emailFiledController =>
      throw _privateConstructorUsedError;
  @override
  TextEditingController get passFiledController =>
      throw _privateConstructorUsedError;
  @override
  String? get emailFiledErrorText => throw _privateConstructorUsedError;
  @override
  String? get passFiledErrorText => throw _privateConstructorUsedError;
  @override
  Account? get loginAccount => throw _privateConstructorUsedError;
  @override
  UserCredential? get loginUserCredential => throw _privateConstructorUsedError;
  @override // 初期値
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginPageStateCopyWith<_$_LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
