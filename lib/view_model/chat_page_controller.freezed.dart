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
  String? get chatRoomId => throw _privateConstructorUsedError;

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
      String? chatRoomId});
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
    Object? chatRoomId = freezed,
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
      chatRoomId: chatRoomId == freezed
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
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
      String? chatRoomId});
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
    Object? chatRoomId = freezed,
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
      chatRoomId: chatRoomId == freezed
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ChatPageState with DiagnosticableTreeMixin implements _ChatPageState {
  _$_ChatPageState(
      {final List<Message> messageList = const [],
      required this.newMessageController,
      this.chatRoomId})
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
  final String? chatRoomId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatPageState(messageList: $messageList, newMessageController: $newMessageController, chatRoomId: $chatRoomId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatPageState'))
      ..add(DiagnosticsProperty('messageList', messageList))
      ..add(DiagnosticsProperty('newMessageController', newMessageController))
      ..add(DiagnosticsProperty('chatRoomId', chatRoomId));
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
                .equals(other.chatRoomId, chatRoomId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messageList),
      const DeepCollectionEquality().hash(newMessageController),
      const DeepCollectionEquality().hash(chatRoomId));

  @JsonKey(ignore: true)
  @override
  _$$_ChatPageStateCopyWith<_$_ChatPageState> get copyWith =>
      __$$_ChatPageStateCopyWithImpl<_$_ChatPageState>(this, _$identity);
}

abstract class _ChatPageState implements ChatPageState {
  factory _ChatPageState(
      {final List<Message> messageList,
      required final TextEditingController newMessageController,
      final String? chatRoomId}) = _$_ChatPageState;

  @override
  List<Message> get messageList => throw _privateConstructorUsedError;
  @override
  TextEditingController get newMessageController =>
      throw _privateConstructorUsedError;
  @override
  String? get chatRoomId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatPageStateCopyWith<_$_ChatPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
