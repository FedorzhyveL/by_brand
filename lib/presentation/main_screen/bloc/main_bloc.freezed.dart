// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainInitialEvent value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainInitialEvent value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainInitialEvent value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res, MainEvent>;
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res, $Val extends MainEvent>
    implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MainInitialEventImplCopyWith<$Res> {
  factory _$$MainInitialEventImplCopyWith(_$MainInitialEventImpl value,
          $Res Function(_$MainInitialEventImpl) then) =
      __$$MainInitialEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MainInitialEventImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$MainInitialEventImpl>
    implements _$$MainInitialEventImplCopyWith<$Res> {
  __$$MainInitialEventImplCopyWithImpl(_$MainInitialEventImpl _value,
      $Res Function(_$MainInitialEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MainInitialEventImpl extends _MainInitialEvent
    with DiagnosticableTreeMixin {
  _$MainInitialEventImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainEvent.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MainEvent.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MainInitialEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainInitialEvent value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainInitialEvent value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainInitialEvent value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _MainInitialEvent extends MainEvent {
  factory _MainInitialEvent() = _$MainInitialEventImpl;
  _MainInitialEvent._() : super._();
}

/// @nodoc
mixin _$MainState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? user, List<Categorie> categories) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? user, List<Categorie> categories)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? user, List<Categorie> categories)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitalMainState value) initial,
    required TResult Function(_LoadedMainState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitalMainState value)? initial,
    TResult? Function(_LoadedMainState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitalMainState value)? initial,
    TResult Function(_LoadedMainState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitalMainStateImplCopyWith<$Res> {
  factory _$$InitalMainStateImplCopyWith(_$InitalMainStateImpl value,
          $Res Function(_$InitalMainStateImpl) then) =
      __$$InitalMainStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitalMainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$InitalMainStateImpl>
    implements _$$InitalMainStateImplCopyWith<$Res> {
  __$$InitalMainStateImplCopyWithImpl(
      _$InitalMainStateImpl _value, $Res Function(_$InitalMainStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitalMainStateImpl extends _InitalMainState
    with DiagnosticableTreeMixin {
  _$InitalMainStateImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MainState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitalMainStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? user, List<Categorie> categories) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? user, List<Categorie> categories)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? user, List<Categorie> categories)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitalMainState value) initial,
    required TResult Function(_LoadedMainState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitalMainState value)? initial,
    TResult? Function(_LoadedMainState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitalMainState value)? initial,
    TResult Function(_LoadedMainState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitalMainState extends MainState {
  factory _InitalMainState() = _$InitalMainStateImpl;
  _InitalMainState._() : super._();
}

/// @nodoc
abstract class _$$LoadedMainStateImplCopyWith<$Res> {
  factory _$$LoadedMainStateImplCopyWith(_$LoadedMainStateImpl value,
          $Res Function(_$LoadedMainStateImpl) then) =
      __$$LoadedMainStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? user, List<Categorie> categories});
}

/// @nodoc
class __$$LoadedMainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LoadedMainStateImpl>
    implements _$$LoadedMainStateImplCopyWith<$Res> {
  __$$LoadedMainStateImplCopyWithImpl(
      _$LoadedMainStateImpl _value, $Res Function(_$LoadedMainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? categories = null,
  }) {
    return _then(_$LoadedMainStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Categorie>,
    ));
  }
}

/// @nodoc

class _$LoadedMainStateImpl extends _LoadedMainState
    with DiagnosticableTreeMixin {
  _$LoadedMainStateImpl(
      {this.user, final List<Categorie> categories = const []})
      : _categories = categories,
        super._();

  @override
  final String? user;
  final List<Categorie> _categories;
  @override
  @JsonKey()
  List<Categorie> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainState.loaded(user: $user, categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainState.loaded'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedMainStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedMainStateImplCopyWith<_$LoadedMainStateImpl> get copyWith =>
      __$$LoadedMainStateImplCopyWithImpl<_$LoadedMainStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? user, List<Categorie> categories) loaded,
  }) {
    return loaded(user, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? user, List<Categorie> categories)? loaded,
  }) {
    return loaded?.call(user, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? user, List<Categorie> categories)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitalMainState value) initial,
    required TResult Function(_LoadedMainState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitalMainState value)? initial,
    TResult? Function(_LoadedMainState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitalMainState value)? initial,
    TResult Function(_LoadedMainState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedMainState extends MainState {
  factory _LoadedMainState(
      {final String? user,
      final List<Categorie> categories}) = _$LoadedMainStateImpl;
  _LoadedMainState._() : super._();

  String? get user;
  List<Categorie> get categories;
  @JsonKey(ignore: true)
  _$$LoadedMainStateImplCopyWith<_$LoadedMainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
