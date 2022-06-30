// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_list_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserListPageState {
  List<Account> get allUserList => throw _privateConstructorUsedError;
  Account? get myAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserListPageStateCopyWith<UserListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListPageStateCopyWith<$Res> {
  factory $UserListPageStateCopyWith(
          UserListPageState value, $Res Function(UserListPageState) then) =
      _$UserListPageStateCopyWithImpl<$Res>;
  $Res call({List<Account> allUserList, Account? myAccount});

  $AccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class _$UserListPageStateCopyWithImpl<$Res>
    implements $UserListPageStateCopyWith<$Res> {
  _$UserListPageStateCopyWithImpl(this._value, this._then);

  final UserListPageState _value;
  // ignore: unused_field
  final $Res Function(UserListPageState) _then;

  @override
  $Res call({
    Object? allUserList = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_value.copyWith(
      allUserList: allUserList == freezed
          ? _value.allUserList
          : allUserList // ignore: cast_nullable_to_non_nullable
              as List<Account>,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
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
abstract class _$$_UserListPageStateCopyWith<$Res>
    implements $UserListPageStateCopyWith<$Res> {
  factory _$$_UserListPageStateCopyWith(_$_UserListPageState value,
          $Res Function(_$_UserListPageState) then) =
      __$$_UserListPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Account> allUserList, Account? myAccount});

  @override
  $AccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class __$$_UserListPageStateCopyWithImpl<$Res>
    extends _$UserListPageStateCopyWithImpl<$Res>
    implements _$$_UserListPageStateCopyWith<$Res> {
  __$$_UserListPageStateCopyWithImpl(
      _$_UserListPageState _value, $Res Function(_$_UserListPageState) _then)
      : super(_value, (v) => _then(v as _$_UserListPageState));

  @override
  _$_UserListPageState get _value => super._value as _$_UserListPageState;

  @override
  $Res call({
    Object? allUserList = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_$_UserListPageState(
      allUserList: allUserList == freezed
          ? _value._allUserList
          : allUserList // ignore: cast_nullable_to_non_nullable
              as List<Account>,
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }
}

/// @nodoc

class _$_UserListPageState
    with DiagnosticableTreeMixin
    implements _UserListPageState {
  _$_UserListPageState(
      {required final List<Account> allUserList, this.myAccount})
      : _allUserList = allUserList;

  final List<Account> _allUserList;
  @override
  List<Account> get allUserList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allUserList);
  }

  @override
  final Account? myAccount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserListPageState(allUserList: $allUserList, myAccount: $myAccount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserListPageState'))
      ..add(DiagnosticsProperty('allUserList', allUserList))
      ..add(DiagnosticsProperty('myAccount', myAccount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserListPageState &&
            const DeepCollectionEquality()
                .equals(other._allUserList, _allUserList) &&
            const DeepCollectionEquality().equals(other.myAccount, myAccount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allUserList),
      const DeepCollectionEquality().hash(myAccount));

  @JsonKey(ignore: true)
  @override
  _$$_UserListPageStateCopyWith<_$_UserListPageState> get copyWith =>
      __$$_UserListPageStateCopyWithImpl<_$_UserListPageState>(
          this, _$identity);
}

abstract class _UserListPageState implements UserListPageState {
  factory _UserListPageState(
      {required final List<Account> allUserList,
      final Account? myAccount}) = _$_UserListPageState;

  @override
  List<Account> get allUserList => throw _privateConstructorUsedError;
  @override
  Account? get myAccount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserListPageStateCopyWith<_$_UserListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
