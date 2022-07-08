// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatPageState {
  List<Message> get messageList => throw _privateConstructorUsedError;
  TextEditingController get newMessageController =>
      throw _privateConstructorUsedError;
  String? get talkRoomId => throw _privateConstructorUsedError;
  StreamSubscription<List<Message>>? get messageListener =>
      throw _privateConstructorUsedError;
  TalkRoom? get talkRoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatPageStateCopyWith<ChatPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPageStateCopyWith<$Res> {
  factory $ChatPageStateCopyWith(
          ChatPageState value, $Res Function(ChatPageState) then) =
      _$ChatPageStateCopyWithImpl<$Res>;
  $Res call(
      {List<Message> messageList,
      TextEditingController newMessageController,
      String? talkRoomId,
      StreamSubscription<List<Message>>? messageListener,
      TalkRoom? talkRoom});

  $TalkRoomCopyWith<$Res>? get talkRoom;
}

/// @nodoc
class _$ChatPageStateCopyWithImpl<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  _$ChatPageStateCopyWithImpl(this._value, this._then);

  final ChatPageState _value;
  // ignore: unused_field
  final $Res Function(ChatPageState) _then;

  @override
  $Res call({
    Object? messageList = freezed,
    Object? newMessageController = freezed,
    Object? talkRoomId = freezed,
    Object? messageListener = freezed,
    Object? talkRoom = freezed,
  }) {
    return _then(_value.copyWith(
      messageList: messageList == freezed
          ? _value.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      newMessageController: newMessageController == freezed
          ? _value.newMessageController
          : newMessageController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      talkRoomId: talkRoomId == freezed
          ? _value.talkRoomId
          : talkRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
      messageListener: messageListener == freezed
          ? _value.messageListener
          : messageListener // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<List<Message>>?,
      talkRoom: talkRoom == freezed
          ? _value.talkRoom
          : talkRoom // ignore: cast_nullable_to_non_nullable
              as TalkRoom?,
    ));
  }

  @override
  $TalkRoomCopyWith<$Res>? get talkRoom {
    if (_value.talkRoom == null) {
      return null;
    }

    return $TalkRoomCopyWith<$Res>(_value.talkRoom!, (value) {
      return _then(_value.copyWith(talkRoom: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChatPageStateCopyWith<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  factory _$$_ChatPageStateCopyWith(
          _$_ChatPageState value, $Res Function(_$_ChatPageState) then) =
      __$$_ChatPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Message> messageList,
      TextEditingController newMessageController,
      String? talkRoomId,
      StreamSubscription<List<Message>>? messageListener,
      TalkRoom? talkRoom});

  @override
  $TalkRoomCopyWith<$Res>? get talkRoom;
}

/// @nodoc
class __$$_ChatPageStateCopyWithImpl<$Res>
    extends _$ChatPageStateCopyWithImpl<$Res>
    implements _$$_ChatPageStateCopyWith<$Res> {
  __$$_ChatPageStateCopyWithImpl(
      _$_ChatPageState _value, $Res Function(_$_ChatPageState) _then)
      : super(_value, (v) => _then(v as _$_ChatPageState));

  @override
  _$_ChatPageState get _value => super._value as _$_ChatPageState;

  @override
  $Res call({
    Object? messageList = freezed,
    Object? newMessageController = freezed,
    Object? talkRoomId = freezed,
    Object? messageListener = freezed,
    Object? talkRoom = freezed,
  }) {
    return _then(_$_ChatPageState(
      messageList: messageList == freezed
          ? _value._messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      newMessageController: newMessageController == freezed
          ? _value.newMessageController
          : newMessageController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      talkRoomId: talkRoomId == freezed
          ? _value.talkRoomId
          : talkRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
      messageListener: messageListener == freezed
          ? _value.messageListener
          : messageListener // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<List<Message>>?,
      talkRoom: talkRoom == freezed
          ? _value.talkRoom
          : talkRoom // ignore: cast_nullable_to_non_nullable
              as TalkRoom?,
    ));
  }
}

/// @nodoc

class _$_ChatPageState with DiagnosticableTreeMixin implements _ChatPageState {
  _$_ChatPageState(
      {final List<Message> messageList = const [],
      required this.newMessageController,
      this.talkRoomId,
      this.messageListener,
      this.talkRoom})
      : _messageList = messageList;

  final List<Message> _messageList;
  @override
  @JsonKey()
  List<Message> get messageList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageList);
  }

  @override
  final TextEditingController newMessageController;
  @override
  final String? talkRoomId;
  @override
  final StreamSubscription<List<Message>>? messageListener;
  @override
  final TalkRoom? talkRoom;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatPageState(messageList: $messageList, newMessageController: $newMessageController, talkRoomId: $talkRoomId, messageListener: $messageListener, talkRoom: $talkRoom)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatPageState'))
      ..add(DiagnosticsProperty('messageList', messageList))
      ..add(DiagnosticsProperty('newMessageController', newMessageController))
      ..add(DiagnosticsProperty('talkRoomId', talkRoomId))
      ..add(DiagnosticsProperty('messageListener', messageListener))
      ..add(DiagnosticsProperty('talkRoom', talkRoom));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatPageState &&
            const DeepCollectionEquality()
                .equals(other._messageList, _messageList) &&
            const DeepCollectionEquality()
                .equals(other.newMessageController, newMessageController) &&
            const DeepCollectionEquality()
                .equals(other.talkRoomId, talkRoomId) &&
            const DeepCollectionEquality()
                .equals(other.messageListener, messageListener) &&
            const DeepCollectionEquality().equals(other.talkRoom, talkRoom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messageList),
      const DeepCollectionEquality().hash(newMessageController),
      const DeepCollectionEquality().hash(talkRoomId),
      const DeepCollectionEquality().hash(messageListener),
      const DeepCollectionEquality().hash(talkRoom));

  @JsonKey(ignore: true)
  @override
  _$$_ChatPageStateCopyWith<_$_ChatPageState> get copyWith =>
      __$$_ChatPageStateCopyWithImpl<_$_ChatPageState>(this, _$identity);
}

abstract class _ChatPageState implements ChatPageState {
  factory _ChatPageState(
      {final List<Message> messageList,
      required final TextEditingController newMessageController,
      final String? talkRoomId,
      final StreamSubscription<List<Message>>? messageListener,
      final TalkRoom? talkRoom}) = _$_ChatPageState;

  @override
  List<Message> get messageList => throw _privateConstructorUsedError;
  @override
  TextEditingController get newMessageController =>
      throw _privateConstructorUsedError;
  @override
  String? get talkRoomId => throw _privateConstructorUsedError;
  @override
  StreamSubscription<List<Message>>? get messageListener =>
      throw _privateConstructorUsedError;
  @override
  TalkRoom? get talkRoom => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatPageStateCopyWith<_$_ChatPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
