// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationPageState {
  int get bottomNavigationIndex => throw _privateConstructorUsedError;
  List<Widget> get pageList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationPageStateCopyWith<NavigationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationPageStateCopyWith<$Res> {
  factory $NavigationPageStateCopyWith(
          NavigationPageState value, $Res Function(NavigationPageState) then) =
      _$NavigationPageStateCopyWithImpl<$Res>;
  $Res call({int bottomNavigationIndex, List<Widget> pageList});
}

/// @nodoc
class _$NavigationPageStateCopyWithImpl<$Res>
    implements $NavigationPageStateCopyWith<$Res> {
  _$NavigationPageStateCopyWithImpl(this._value, this._then);

  final NavigationPageState _value;
  // ignore: unused_field
  final $Res Function(NavigationPageState) _then;

  @override
  $Res call({
    Object? bottomNavigationIndex = freezed,
    Object? pageList = freezed,
  }) {
    return _then(_value.copyWith(
      bottomNavigationIndex: bottomNavigationIndex == freezed
          ? _value.bottomNavigationIndex
          : bottomNavigationIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageList: pageList == freezed
          ? _value.pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ));
  }
}

/// @nodoc
abstract class _$$_NavigationPageStateCopyWith<$Res>
    implements $NavigationPageStateCopyWith<$Res> {
  factory _$$_NavigationPageStateCopyWith(_$_NavigationPageState value,
          $Res Function(_$_NavigationPageState) then) =
      __$$_NavigationPageStateCopyWithImpl<$Res>;
  @override
  $Res call({int bottomNavigationIndex, List<Widget> pageList});
}

/// @nodoc
class __$$_NavigationPageStateCopyWithImpl<$Res>
    extends _$NavigationPageStateCopyWithImpl<$Res>
    implements _$$_NavigationPageStateCopyWith<$Res> {
  __$$_NavigationPageStateCopyWithImpl(_$_NavigationPageState _value,
      $Res Function(_$_NavigationPageState) _then)
      : super(_value, (v) => _then(v as _$_NavigationPageState));

  @override
  _$_NavigationPageState get _value => super._value as _$_NavigationPageState;

  @override
  $Res call({
    Object? bottomNavigationIndex = freezed,
    Object? pageList = freezed,
  }) {
    return _then(_$_NavigationPageState(
      bottomNavigationIndex: bottomNavigationIndex == freezed
          ? _value.bottomNavigationIndex
          : bottomNavigationIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageList: pageList == freezed
          ? _value._pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ));
  }
}

/// @nodoc

class _$_NavigationPageState
    with DiagnosticableTreeMixin
    implements _NavigationPageState {
  _$_NavigationPageState(
      {required this.bottomNavigationIndex,
      required final List<Widget> pageList})
      : _pageList = pageList;

  @override
  final int bottomNavigationIndex;
  final List<Widget> _pageList;
  @override
  List<Widget> get pageList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pageList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationPageState(bottomNavigationIndex: $bottomNavigationIndex, pageList: $pageList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationPageState'))
      ..add(DiagnosticsProperty('bottomNavigationIndex', bottomNavigationIndex))
      ..add(DiagnosticsProperty('pageList', pageList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationPageState &&
            const DeepCollectionEquality()
                .equals(other.bottomNavigationIndex, bottomNavigationIndex) &&
            const DeepCollectionEquality().equals(other._pageList, _pageList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bottomNavigationIndex),
      const DeepCollectionEquality().hash(_pageList));

  @JsonKey(ignore: true)
  @override
  _$$_NavigationPageStateCopyWith<_$_NavigationPageState> get copyWith =>
      __$$_NavigationPageStateCopyWithImpl<_$_NavigationPageState>(
          this, _$identity);
}

abstract class _NavigationPageState implements NavigationPageState {
  factory _NavigationPageState(
      {required final int bottomNavigationIndex,
      required final List<Widget> pageList}) = _$_NavigationPageState;

  @override
  int get bottomNavigationIndex => throw _privateConstructorUsedError;
  @override
  List<Widget> get pageList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationPageStateCopyWith<_$_NavigationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
