// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_chat_list_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyChatListPageState {
  Account? get myAccount => throw _privateConstructorUsedError;
  List<Account> get otherAccountList =>
      throw _privateConstructorUsedError; //チャット相手のアカウントリスト
  List<TalkRoom> get talkRoomList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyChatListPageStateCopyWith<MyChatListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyChatListPageStateCopyWith<$Res> {
  factory $MyChatListPageStateCopyWith(
          MyChatListPageState value, $Res Function(MyChatListPageState) then) =
      _$MyChatListPageStateCopyWithImpl<$Res>;
  $Res call(
      {Account? myAccount,
      List<Account> otherAccountList,
      List<TalkRoom> talkRoomList});

  $AccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class _$MyChatListPageStateCopyWithImpl<$Res>
    implements $MyChatListPageStateCopyWith<$Res> {
  _$MyChatListPageStateCopyWithImpl(this._value, this._then);

  final MyChatListPageState _value;
  // ignore: unused_field
  final $Res Function(MyChatListPageState) _then;

  @override
  $Res call({
    Object? myAccount = freezed,
    Object? otherAccountList = freezed,
    Object? talkRoomList = freezed,
  }) {
    return _then(_value.copyWith(
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      otherAccountList: otherAccountList == freezed
          ? _value.otherAccountList
          : otherAccountList // ignore: cast_nullable_to_non_nullable
              as List<Account>,
      talkRoomList: talkRoomList == freezed
          ? _value.talkRoomList
          : talkRoomList // ignore: cast_nullable_to_non_nullable
              as List<TalkRoom>,
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
abstract class _$$_MyChatListPageStateCopyWith<$Res>
    implements $MyChatListPageStateCopyWith<$Res> {
  factory _$$_MyChatListPageStateCopyWith(_$_MyChatListPageState value,
          $Res Function(_$_MyChatListPageState) then) =
      __$$_MyChatListPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Account? myAccount,
      List<Account> otherAccountList,
      List<TalkRoom> talkRoomList});

  @override
  $AccountCopyWith<$Res>? get myAccount;
}

/// @nodoc
class __$$_MyChatListPageStateCopyWithImpl<$Res>
    extends _$MyChatListPageStateCopyWithImpl<$Res>
    implements _$$_MyChatListPageStateCopyWith<$Res> {
  __$$_MyChatListPageStateCopyWithImpl(_$_MyChatListPageState _value,
      $Res Function(_$_MyChatListPageState) _then)
      : super(_value, (v) => _then(v as _$_MyChatListPageState));

  @override
  _$_MyChatListPageState get _value => super._value as _$_MyChatListPageState;

  @override
  $Res call({
    Object? myAccount = freezed,
    Object? otherAccountList = freezed,
    Object? talkRoomList = freezed,
  }) {
    return _then(_$_MyChatListPageState(
      myAccount: myAccount == freezed
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      otherAccountList: otherAccountList == freezed
          ? _value._otherAccountList
          : otherAccountList // ignore: cast_nullable_to_non_nullable
              as List<Account>,
      talkRoomList: talkRoomList == freezed
          ? _value._talkRoomList
          : talkRoomList // ignore: cast_nullable_to_non_nullable
              as List<TalkRoom>,
    ));
  }
}

/// @nodoc

class _$_MyChatListPageState implements _MyChatListPageState {
  _$_MyChatListPageState(
      {this.myAccount,
      final List<Account> otherAccountList = const [],
      final List<TalkRoom> talkRoomList = const []})
      : _otherAccountList = otherAccountList,
        _talkRoomList = talkRoomList;

  @override
  final Account? myAccount;
  final List<Account> _otherAccountList;
  @override
  @JsonKey()
  List<Account> get otherAccountList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherAccountList);
  }

//チャット相手のアカウントリスト
  final List<TalkRoom> _talkRoomList;
//チャット相手のアカウントリスト
  @override
  @JsonKey()
  List<TalkRoom> get talkRoomList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_talkRoomList);
  }

  @override
  String toString() {
    return 'MyChatListPageState(myAccount: $myAccount, otherAccountList: $otherAccountList, talkRoomList: $talkRoomList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyChatListPageState &&
            const DeepCollectionEquality().equals(other.myAccount, myAccount) &&
            const DeepCollectionEquality()
                .equals(other._otherAccountList, _otherAccountList) &&
            const DeepCollectionEquality()
                .equals(other._talkRoomList, _talkRoomList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(myAccount),
      const DeepCollectionEquality().hash(_otherAccountList),
      const DeepCollectionEquality().hash(_talkRoomList));

  @JsonKey(ignore: true)
  @override
  _$$_MyChatListPageStateCopyWith<_$_MyChatListPageState> get copyWith =>
      __$$_MyChatListPageStateCopyWithImpl<_$_MyChatListPageState>(
          this, _$identity);
}

abstract class _MyChatListPageState implements MyChatListPageState {
  factory _MyChatListPageState(
      {final Account? myAccount,
      final List<Account> otherAccountList,
      final List<TalkRoom> talkRoomList}) = _$_MyChatListPageState;

  @override
  Account? get myAccount => throw _privateConstructorUsedError;
  @override
  List<Account> get otherAccountList => throw _privateConstructorUsedError;
  @override //チャット相手のアカウントリスト
  List<TalkRoom> get talkRoomList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MyChatListPageStateCopyWith<_$_MyChatListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
