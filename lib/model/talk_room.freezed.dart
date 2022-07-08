// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'talk_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TalkRoom _$TalkRoomFromJson(Map<String, dynamic> json) {
  return _TalkRoom.fromJson(json);
}

/// @nodoc
mixin _$TalkRoom {
  String get id => throw _privateConstructorUsedError;
  List<String> get userIDs => throw _privateConstructorUsedError;
  String get finalUpdateUserID =>
      throw _privateConstructorUsedError; //最後に更新したユーザーのID
  String get finalSendContent => throw _privateConstructorUsedError; //最後のメッセージ
  int get unreadMessageCount => throw _privateConstructorUsedError; //未読数
  @DateTimeTimestampConverter()
  DateTime get updateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TalkRoomCopyWith<TalkRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TalkRoomCopyWith<$Res> {
  factory $TalkRoomCopyWith(TalkRoom value, $Res Function(TalkRoom) then) =
      _$TalkRoomCopyWithImpl<$Res>;
  $Res call(
      {String id,
      List<String> userIDs,
      String finalUpdateUserID,
      String finalSendContent,
      int unreadMessageCount,
      @DateTimeTimestampConverter() DateTime updateTime});
}

/// @nodoc
class _$TalkRoomCopyWithImpl<$Res> implements $TalkRoomCopyWith<$Res> {
  _$TalkRoomCopyWithImpl(this._value, this._then);

  final TalkRoom _value;
  // ignore: unused_field
  final $Res Function(TalkRoom) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userIDs = freezed,
    Object? finalUpdateUserID = freezed,
    Object? finalSendContent = freezed,
    Object? unreadMessageCount = freezed,
    Object? updateTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userIDs: userIDs == freezed
          ? _value.userIDs
          : userIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      finalUpdateUserID: finalUpdateUserID == freezed
          ? _value.finalUpdateUserID
          : finalUpdateUserID // ignore: cast_nullable_to_non_nullable
              as String,
      finalSendContent: finalSendContent == freezed
          ? _value.finalSendContent
          : finalSendContent // ignore: cast_nullable_to_non_nullable
              as String,
      unreadMessageCount: unreadMessageCount == freezed
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
      updateTime: updateTime == freezed
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_TalkRoomCopyWith<$Res> implements $TalkRoomCopyWith<$Res> {
  factory _$$_TalkRoomCopyWith(
          _$_TalkRoom value, $Res Function(_$_TalkRoom) then) =
      __$$_TalkRoomCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<String> userIDs,
      String finalUpdateUserID,
      String finalSendContent,
      int unreadMessageCount,
      @DateTimeTimestampConverter() DateTime updateTime});
}

/// @nodoc
class __$$_TalkRoomCopyWithImpl<$Res> extends _$TalkRoomCopyWithImpl<$Res>
    implements _$$_TalkRoomCopyWith<$Res> {
  __$$_TalkRoomCopyWithImpl(
      _$_TalkRoom _value, $Res Function(_$_TalkRoom) _then)
      : super(_value, (v) => _then(v as _$_TalkRoom));

  @override
  _$_TalkRoom get _value => super._value as _$_TalkRoom;

  @override
  $Res call({
    Object? id = freezed,
    Object? userIDs = freezed,
    Object? finalUpdateUserID = freezed,
    Object? finalSendContent = freezed,
    Object? unreadMessageCount = freezed,
    Object? updateTime = freezed,
  }) {
    return _then(_$_TalkRoom(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userIDs: userIDs == freezed
          ? _value._userIDs
          : userIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      finalUpdateUserID: finalUpdateUserID == freezed
          ? _value.finalUpdateUserID
          : finalUpdateUserID // ignore: cast_nullable_to_non_nullable
              as String,
      finalSendContent: finalSendContent == freezed
          ? _value.finalSendContent
          : finalSendContent // ignore: cast_nullable_to_non_nullable
              as String,
      unreadMessageCount: unreadMessageCount == freezed
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
      updateTime: updateTime == freezed
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TalkRoom with DiagnosticableTreeMixin implements _TalkRoom {
  _$_TalkRoom(
      {required this.id,
      required final List<String> userIDs,
      required this.finalUpdateUserID,
      required this.finalSendContent,
      required this.unreadMessageCount,
      @DateTimeTimestampConverter() required this.updateTime})
      : _userIDs = userIDs;

  factory _$_TalkRoom.fromJson(Map<String, dynamic> json) =>
      _$$_TalkRoomFromJson(json);

  @override
  final String id;
  final List<String> _userIDs;
  @override
  List<String> get userIDs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIDs);
  }

  @override
  final String finalUpdateUserID;
//最後に更新したユーザーのID
  @override
  final String finalSendContent;
//最後のメッセージ
  @override
  final int unreadMessageCount;
//未読数
  @override
  @DateTimeTimestampConverter()
  final DateTime updateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TalkRoom(id: $id, userIDs: $userIDs, finalUpdateUserID: $finalUpdateUserID, finalSendContent: $finalSendContent, unreadMessageCount: $unreadMessageCount, updateTime: $updateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TalkRoom'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userIDs', userIDs))
      ..add(DiagnosticsProperty('finalUpdateUserID', finalUpdateUserID))
      ..add(DiagnosticsProperty('finalSendContent', finalSendContent))
      ..add(DiagnosticsProperty('unreadMessageCount', unreadMessageCount))
      ..add(DiagnosticsProperty('updateTime', updateTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TalkRoom &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._userIDs, _userIDs) &&
            const DeepCollectionEquality()
                .equals(other.finalUpdateUserID, finalUpdateUserID) &&
            const DeepCollectionEquality()
                .equals(other.finalSendContent, finalSendContent) &&
            const DeepCollectionEquality()
                .equals(other.unreadMessageCount, unreadMessageCount) &&
            const DeepCollectionEquality()
                .equals(other.updateTime, updateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_userIDs),
      const DeepCollectionEquality().hash(finalUpdateUserID),
      const DeepCollectionEquality().hash(finalSendContent),
      const DeepCollectionEquality().hash(unreadMessageCount),
      const DeepCollectionEquality().hash(updateTime));

  @JsonKey(ignore: true)
  @override
  _$$_TalkRoomCopyWith<_$_TalkRoom> get copyWith =>
      __$$_TalkRoomCopyWithImpl<_$_TalkRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TalkRoomToJson(this);
  }
}

abstract class _TalkRoom implements TalkRoom {
  factory _TalkRoom(
          {required final String id,
          required final List<String> userIDs,
          required final String finalUpdateUserID,
          required final String finalSendContent,
          required final int unreadMessageCount,
          @DateTimeTimestampConverter() required final DateTime updateTime}) =
      _$_TalkRoom;

  factory _TalkRoom.fromJson(Map<String, dynamic> json) = _$_TalkRoom.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  List<String> get userIDs => throw _privateConstructorUsedError;
  @override
  String get finalUpdateUserID => throw _privateConstructorUsedError;
  @override //最後に更新したユーザーのID
  String get finalSendContent => throw _privateConstructorUsedError;
  @override //最後のメッセージ
  int get unreadMessageCount => throw _privateConstructorUsedError;
  @override //未読数
  @DateTimeTimestampConverter()
  DateTime get updateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TalkRoomCopyWith<_$_TalkRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
